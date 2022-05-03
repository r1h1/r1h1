using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

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
                    tipoError.Text = "El Cliente existe, efectuando la compra...";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "datosCliente", "$('#datosCliente').modal();", true);

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
                        com.Parameters.Add("IDCOMPRAUSUARIO", Convert.ToInt64(compraUsuario));
                        com.Parameters.Add("CARRITOIDPRODUCTO", Convert.ToInt32(codProducto));
                        com.Parameters.Add("CANTIDADCOMPRAPRODUCTO", Convert.ToInt32(cantidadCompraProducto));
                        com.Parameters.Add("CARRITOTOTALCOMPRA", Convert.ToDouble(totalCompra));
                        com.Parameters.Add("METODOPAGO", metodoPago);
                        com.Parameters.Add("FECHACOMPRA", fecha);

                        com.Connection = conexion;
                        com.ExecuteNonQuery();
                    }

                }
                conexion.Close();
            }
        }

        protected void clienteNuevo_Click(object sender, EventArgs e)
        {
            string idcliente = numeroDocumento.Text.Trim();
            string correElectronico = correoElectronico.Text.Trim();

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

                    OracleCommand comm = new OracleCommand();
                    comm.CommandType = System.Data.CommandType.StoredProcedure;
                    comm.CommandText = "INSERTA_VENTA_FACTURA";
                    comm.Parameters.Add("IDCOMPRAUSUARIO", Convert.ToInt64(compraUsuario));
                    comm.Parameters.Add("CARRITOIDPRODUCTO", Convert.ToInt32(codProducto));
                    comm.Parameters.Add("CANTIDADCOMPRAPRODUCTO", Convert.ToInt32(cantidadCompraProducto));
                    comm.Parameters.Add("CARRITOTOTALCOMPRA", Convert.ToDouble(totalCompra));
                    comm.Parameters.Add("METODOPAGO", metodoPago);
                    comm.Parameters.Add("FECHACOMPRA", fecha);

                    comm.Connection = conexion;
                    comm.ExecuteNonQuery();
                }
                conexion.Close();
            }
        }
    }
}