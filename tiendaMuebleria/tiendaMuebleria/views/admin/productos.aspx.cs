using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tiendaMuebleria
{
    public partial class productos : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuarioLogueado"] != null)
            {
                string usuariologueado = Session["usuarioLogueado"].ToString();
            }
            else
            {
                Response.Redirect("../ingreso.aspx");
            }
            cargarDatos();
        }

        public void cargarDatos()
        {
            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("MOSTRAR_PRODUCTOS", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("registros", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            gridProductos.DataSource = dt;
            gridProductos.DataBind();
            conexion.Close();
        }

        protected void agregarProducto_Click(object sender, EventArgs e)
        {
            //La variable estado activa automaticamente al cliente al insertar
            //ACTIVO = 1,  NO ACTIVO = 0
            int estado = 1;


            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand();
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.CommandText = "INSERTA_PRODUCTO";

            com.Parameters.Add("PRONOMBRE", nombre.Text.Trim());
            com.Parameters.Add("PRODESCRIPCION", descripcion.Text.Trim());
            com.Parameters.Add("PROTIPO", tipoDeMueble.Value);
            com.Parameters.Add("PROMATERIAL", material.Text.Trim());
            com.Parameters.Add("PROALTO", Convert.ToDouble(altura.Text.Trim()));
            com.Parameters.Add("PROANCHO", Convert.ToDouble(anchura.Text.Trim()));
            com.Parameters.Add("PROPROFUNDIDAD", Convert.ToDouble(profundidad.Text.Trim()));
            com.Parameters.Add("PROCOLOR", color.Text.Trim());
            com.Parameters.Add("PROPESO", Convert.ToDouble(peso.Text.Trim()));
            com.Parameters.Add("PROPRECIO", Convert.ToDouble(precio.Text.Trim()));
            com.Parameters.Add("PROCANTIDAD", Convert.ToInt32(cantidad.Text.Trim()));
            com.Parameters.Add("PROESTADO", estado);


            com.Connection = conexion;
            com.ExecuteNonQuery();

            conexion.Close();

            if (estado != 0)
            {
                idproducto.Text = "";
                nombre.Text = "";
                descripcion.Text = "";
                tipoDeMueble.SelectedIndex = 1;
                material.Text = "";
                altura.Text = "";
                anchura.Text = "";
                profundidad.Text = "";
                color.Text = "";
                peso.Text = "";
                precio.Text = "";
                precio.Text = "";
                cantidad.Text = "";

                Response.Redirect("productos.aspx");
            }
            else
            {
                Response.Redirect("productos.aspx");
            }
        }

        protected void editarProducto_Click(object sender, EventArgs e)
        {
            string idProducto = idproducto.Text.Trim();

            if (idProducto == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Ingresa el código de producto.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                idproducto.Text = "";
            }

            else
            {
                //La variable estado activa automaticamente al cliente al insertar
                //ACTIVO = 1,  NO ACTIVO = 0
                int estado = 1;

                //conexión a la base de datos
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "EDITAR_PRODUCTO";

                com.Parameters.Add("PROID", Convert.ToInt32(idproducto.Text.Trim()));
                com.Parameters.Add("PRONOMBRE", nombre.Text.Trim());
                com.Parameters.Add("PRODESCRIPCION", descripcion.Text.Trim());
                com.Parameters.Add("PROTIPO", tipoDeMueble.Value);
                com.Parameters.Add("PROMATERIAL", material.Text.Trim());
                com.Parameters.Add("PROALTO", Convert.ToDouble(altura.Text.Trim()));
                com.Parameters.Add("PROANCHO", Convert.ToDouble(anchura.Text.Trim()));
                com.Parameters.Add("PROPROFUNDIDAD", Convert.ToDouble(profundidad.Text.Trim()));
                com.Parameters.Add("PROCOLOR", color.Text.Trim());
                com.Parameters.Add("PROPESO", Convert.ToDouble(peso.Text.Trim()));
                com.Parameters.Add("PROPRECIO", Convert.ToDouble(precio.Text.Trim()));
                com.Parameters.Add("PROCANTIDAD", Convert.ToInt32(cantidad.Text.Trim()));

                com.Connection = conexion;
                com.ExecuteNonQuery();

                cargarDatos();

                conexion.Close();

                idproducto.Text = "";
                nombre.Text = "";
                descripcion.Text = "";
                tipoDeMueble.SelectedIndex = 1;
                material.Text = "";
                altura.Text = "";
                anchura.Text = "";
                profundidad.Text = "";
                color.Text = "";
                peso.Text = "";
                precio.Text = "";
                precio.Text = "";
                cantidad.Text = "";
            }
        }

        protected void borrarProducto_Click(object sender, EventArgs e)
        {
            string idProducto = idproducto.Text.Trim();

            if (idProducto == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Debes ingresar el código de producto.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                idproducto.Text = "";
            }
            else
            {
                //conexión a la base de datos
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();
                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "DELETE_PRODUCTO";
                com.Parameters.Add("PROID", Convert.ToInt32(idproducto.Text.Trim()));
                com.Connection = conexion;
                com.ExecuteNonQuery();

                cargarDatos();

                conexion.Close();

                idproducto.Text = "";
                nombre.Text = "";
                descripcion.Text = "";
                tipoDeMueble.SelectedIndex = 1;
                material.Text = "";
                altura.Text = "";
                anchura.Text = "";
                profundidad.Text = "";
                color.Text = "";
                peso.Text = "";
                precio.Text = "";
                precio.Text = "";
                cantidad.Text = "";
            }
        }

        protected void buscarProducto_Click(object sender, EventArgs e)
        {
            cargarDatosBuscarDato();
            { ClientScript.RegisterStartupScript(GetType(), "buscarDatoModal", "abrirBusquedaProductos();", true); }
        }

        public void cargarDatosBuscarDato()
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("BUSCAR_PRODUCTOS", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("datoBusqueda", datoBusqueda.Text.Trim());
            com.Parameters.Add("reg", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            com.Connection = conexion;

            gridBusquedaP.DataSource = ds;
            gridBusquedaP.DataBind();

            conexion.Close();
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../ingreso.aspx");
        }

    }
}