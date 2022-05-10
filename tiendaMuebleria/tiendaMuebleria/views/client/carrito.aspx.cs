using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Text;

namespace tiendaMuebleria
{
    public partial class carrito : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
        string noProductosCarrito;
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarProductosEnCarrito();
            cargarNumeroProductosCarrito();
            totalCompraCarrito();
            tipoError.Text = "Si su cliente ya existe, por favor, llena sólo el número de documento y presione 'Cliente Frecuente' " +
                ", si no, llene todos los datos y presione 'Cliente Nuevo' para proceder con la compra.";
        }

        public void cargarProductosEnCarrito()
        {
            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("MOSTRAR_PRODUCTOS_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("prods", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            productosEnCarrito.DataSource = dt;
            productosEnCarrito.DataBind();
            conexion.Close();
        }

        public void cargarNumeroProductosCarrito()
        {
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand command = new OracleCommand("CONTAR_PRODUCTOS_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("prodsCarrito", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter adapter = new OracleDataAdapter(command);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            command.Connection = conexion;
            string numeroProductosCarrito = ds.Rows[0]["Count(*)"].ToString();
            noProductosCarrito = numeroProductosCarrito;
            cantProdCar.Text = numeroProductosCarrito + " " + "producto(s)";

            conexion.Close();
        }

        protected void borrarCod_Click(object sender, EventArgs e)
        {
            string codigoProductoABorrar = codigoBorrar.Text.Trim();

            if (codigoProductoABorrar == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('El COD del producto a borrar no puede ir vacío.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                codigoBorrar.Focus();
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;

                com.CommandText = "BORRAR_CARRITO_POR_ID";
                com.Parameters.Add("idProdCarrito", Convert.ToInt32(codigoBorrar.Text.Trim()));

                com.Connection = conexion;

                com.ExecuteNonQuery();

                conexion.Close();

                Response.Redirect("carrito.aspx");
            }

        }

        protected void borrarTodo_Click(object sender, EventArgs e)
        {

            string codigoProductoABorrar = codigoBorrar.Text.Trim();

            if (codigoProductoABorrar == "")
            {
                string yesornot = String.Format(@"<script type='text/javascript'>alert('¿Estás seguro de borrarlo?, pon 0 en el apartado COD para borrar.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", yesornot, false);
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "BORRAR_TODO_EL_CARRITO";

                com.Connection = conexion;

                com.ExecuteNonQuery();

                conexion.Close();

                Response.Redirect("carrito.aspx");
            }

        }

        public void totalCompraCarrito()
        {
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand command = new OracleCommand("SUMAR_TOTAL_COMPRA_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("sumaTotalCompra", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter oracleAdapt = new OracleDataAdapter(command);
            DataTable totalCompraCarrito = new DataTable();
            oracleAdapt.Fill(totalCompraCarrito);
            command.Connection = conexion;
            string totalCompra = totalCompraCarrito.Rows[0]["Total"].ToString();
            totalAPagar.Text = totalCompra;

            conexion.Close();
        }

        protected void clienteFrecuente_Click(object sender, EventArgs e)
        {
            string idcliente = numeroDocumento.Text.Trim();

            int length = 7;
            // creating a StringBuilder object()
            StringBuilder str_build = new StringBuilder();
            Random random = new Random();

            char letter;

            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                str_build.Append(letter);
            }
            string refCompra = str_build.ToString();


            if (idcliente == "" || idcliente == null)
            {
                //no hace nada
            }
            else
            {

                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand command = new OracleCommand("BUSCAR_CLIENTES_POR_ID", conexion);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("idCliente", idcliente);
                command.Parameters.Add("cliente", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                OracleDataAdapter adaptOra = new OracleDataAdapter(command);
                DataTable existeCliente = new DataTable();
                adaptOra.Fill(existeCliente);
                command.Connection = conexion;
                int nombreCliente = Convert.ToInt32(existeCliente.Rows[0]["NOMBRECLIENTE"].ToString());

                if (nombreCliente == 0)
                {
                    tipoError.Text = "Cliente no existe, llena todos los datos y presiona el botón 'Cliente Nuevo' para continuar.";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "datosCliente", "$('#datosCliente').modal();", true);
                }
                else
                {

                    //SE GUARDAN LOS DATOS EN LA TABLA DE COMPRA Y SE PROCEDE A MOSTRAR LA PANTALLA DE CONFIRMACIÓN

                    int repeticion = Convert.ToInt32(noProductosCarrito);
                    string metodoPago = "Tarjeta", fecha = DateTime.Now.ToString();

                    OracleCommand comando = new OracleCommand("MOSTRAR_PRODUCTOS_CARRITO", conexion);
                    comando.CommandType = System.Data.CommandType.StoredProcedure;
                    comando.Parameters.Add("prods", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                    OracleDataAdapter dap = new OracleDataAdapter();
                    dap.SelectCommand = comando;
                    DataTable dtap = new DataTable();
                    dap.Fill(dtap);

                    int i;

                    for (i = 0; i < repeticion; i++)
                    {
                        string compraUsuario = numeroDocumento.Text.Trim();
                        string codProducto = dtap.Rows[i]["COD"].ToString();
                        string cantidadCompraProducto = dtap.Rows[i]["CANTIDAD"].ToString();
                        string totalCompra = dtap.Rows[i]["TOTAL"].ToString();

                        OracleCommand com = new OracleCommand();
                        com.CommandType = System.Data.CommandType.StoredProcedure;
                        com.CommandText = "INSERTA_VENTA_FACTURA";
                        com.Parameters.Add("REFERENCIACOMPRA", refCompra);
                        com.Parameters.Add("IDCOMPRAUSUARIO", Convert.ToInt64(compraUsuario));
                        com.Parameters.Add("CARRITOIDPRODUCTO", Convert.ToInt32(codProducto));
                        com.Parameters.Add("CANTIDADCOMPRAPRODUCTO", Convert.ToInt32(cantidadCompraProducto));
                        com.Parameters.Add("CARRITOTOTALCOMPRA", Convert.ToDouble(totalCompra));
                        com.Parameters.Add("METODOPAGO", metodoPago);
                        com.Parameters.Add("FECHACOMPRA", fecha);

                        com.Connection = conexion;
                        com.ExecuteNonQuery();
                    }

                    OracleCommand borrarTodoCarrito = new OracleCommand();
                    borrarTodoCarrito.CommandType = System.Data.CommandType.StoredProcedure;
                    borrarTodoCarrito.CommandText = "BORRAR_TODO_EL_CARRITO";
                    borrarTodoCarrito.Connection = conexion;
                    borrarTodoCarrito.ExecuteNonQuery();

                    referencia.Text = refCompra;

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clienteFrecuente", "$('#refCompra').modal();", true);

                }
                conexion.Close();
            }
        }

        protected void clienteNuevo_Click(object sender, EventArgs e)
        {
            string idcliente = numeroDocumento.Text.Trim();
            string correElectronico = correoElectronico.Text.Trim();

            int length = 7;
            // creating a StringBuilder object()
            StringBuilder str_build = new StringBuilder();
            Random random = new Random();

            char letter;

            for (int i = 0; i < length; i++)
            {
                double flt = random.NextDouble();
                int shift = Convert.ToInt32(Math.Floor(25 * flt));
                letter = Convert.ToChar(shift + 65);
                str_build.Append(letter);
            }
            string refCompra = str_build.ToString();


            if (idcliente == "" || correElectronico == "")
            {
                tipoError.Text = "Llena todos los datos antes de registrar el cliente.";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "datosCliente", "$('#datosCliente').modal();", true);
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);

                //SE GUARDA EL CLIENTE YA QUE NO EXISTE PARA EFECTUAR LA COMPRA
                //ESTADO: ACTIVO = 1,  NO ACTIVO = 0
                int estado = 1;
                string rol = "Cliente";

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "INSERTA_USUARIO";
                com.Parameters.Add("ID_Usu_NumeroDocumento", numeroDocumento.Text.Trim());
                com.Parameters.Add("Usu_NombreCompleto", nombreCompleto.Text.Trim());
                com.Parameters.Add("Usu_TipoDoc", docTipo.Value);
                com.Parameters.Add("Usu_TelefonoResidencial", Convert.ToInt32(telefonoResidencia.Text.Trim()));
                com.Parameters.Add("Usu_TelefonoMovil", Convert.ToInt32(telefonoCelular.Text.Trim()));
                com.Parameters.Add("Usu_Pais", pais.Value);
                com.Parameters.Add("Usu_Departamento", departamentoEstado.Text.Trim());
                com.Parameters.Add("Usu_CiudadResidencia", ciudadResidencia.Text.Trim());
                com.Parameters.Add("Usu_Direccion", direccion.Text.Trim());
                com.Parameters.Add("Usu_Profesion", profesion.Text.Trim());
                com.Parameters.Add("Usu_Email", correoElectronico.Text.Trim());
                com.Parameters.Add("Usu_Rol", rol);
                com.Parameters.Add("Usu_Estado", estado);

                com.Connection = conexion;
                com.ExecuteNonQuery();


                //SE GUARDAN LOS DATOS EN LA TABLA DE COMPRA Y SE PROCEDE A MOSTRAR LA PANTALLA DE CONFIRMACIÓN

                int repeticion = Convert.ToInt32(noProductosCarrito);
                string metodoPago = "Tarjeta", fecha = DateTime.Now.ToString();

                OracleCommand comando = new OracleCommand("MOSTRAR_PRODUCTOS_CARRITO", conexion);
                comando.CommandType = System.Data.CommandType.StoredProcedure;
                comando.Parameters.Add("prods", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                OracleDataAdapter dap = new OracleDataAdapter();
                dap.SelectCommand = comando;
                DataTable dtap = new DataTable();
                dap.Fill(dtap);

                int i;

                for (i = 0; i < repeticion; i++)
                {
                    string compraUsuario = numeroDocumento.Text.Trim();
                    string codProducto = dtap.Rows[i]["COD"].ToString();
                    string cantidadCompraProducto = dtap.Rows[i]["CANTIDAD"].ToString();
                    string totalCompra = dtap.Rows[i]["TOTAL"].ToString();

                    OracleCommand facturaF = new OracleCommand();
                    facturaF.CommandType = System.Data.CommandType.StoredProcedure;
                    facturaF.CommandText = "INSERTA_VENTA_FACTURA";
                    facturaF.Parameters.Add("REFERENCIACOMPRA", refCompra);
                    facturaF.Parameters.Add("IDCOMPRAUSUARIO", Convert.ToInt64(compraUsuario));
                    facturaF.Parameters.Add("CARRITOIDPRODUCTO", Convert.ToInt32(codProducto));
                    facturaF.Parameters.Add("CANTIDADCOMPRAPRODUCTO", Convert.ToInt32(cantidadCompraProducto));
                    facturaF.Parameters.Add("CARRITOTOTALCOMPRA", Convert.ToDouble(totalCompra));
                    facturaF.Parameters.Add("METODOPAGO", metodoPago);
                    facturaF.Parameters.Add("FECHACOMPRA", fecha);

                    facturaF.Connection = conexion;
                    facturaF.ExecuteNonQuery();

                }

                OracleCommand borrarTodoCarrito = new OracleCommand();
                borrarTodoCarrito.CommandType = System.Data.CommandType.StoredProcedure;
                borrarTodoCarrito.CommandText = "BORRAR_TODO_EL_CARRITO";
                borrarTodoCarrito.Connection = conexion;
                borrarTodoCarrito.ExecuteNonQuery();

                conexion.Close();

                referencia.Text = refCompra;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clienteFrecuente", "$('#refCompra').modal();", true);
            }
        }

        protected void finCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("cliente.aspx");
        }
    }
}