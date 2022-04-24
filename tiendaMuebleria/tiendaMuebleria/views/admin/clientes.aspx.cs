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

    public partial class clientes : System.Web.UI.Page
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

        protected void agregarCliente_Click(object sender, EventArgs e)
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            //La variable estado activa automaticamente al cliente al insertar
            //ACTIVO = 1,  NO ACTIVO = 0
            int estado = 1;

            conexion.Open();
            OracleCommand com = new OracleCommand();
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.CommandText = "INSERTA_USUARIO";
            
            com.Parameters.Add("ID_Usu_NumeroDocumento", numeroDocumento.Text.Trim());
            com.Parameters.Add("Usu_NombreCompleto", nombreCompletoCliente.Text.Trim());
            com.Parameters.Add("Usu_TipoDoc", docTipo.Value);
            com.Parameters.Add("Usu_TelefonoResidencial", Convert.ToInt32(telefonoResidencia.Text.Trim()));
            com.Parameters.Add("Usu_TelefonoMovil", Convert.ToInt32(telefonoCelular.Text.Trim()));
            com.Parameters.Add("Usu_Pais", pais.Value);
            com.Parameters.Add("Usu_Departamento", departamentoEstado.Text.Trim());
            com.Parameters.Add("Usu_CiudadResidencia", ciudadResidencia.Text.Trim());
            com.Parameters.Add("Usu_Direccion", direccion.Text.Trim());
            com.Parameters.Add("Usu_Profesion", profesion.Text.Trim());
            com.Parameters.Add("Usu_Email", email.Text.Trim());
            com.Parameters.Add("Usu_Rol", rol.Value);
            com.Parameters.Add("Usu_Estado", estado);
            com.Connection = conexion;
            com.ExecuteNonQuery();
            conexion.Close();

            if (estado != 0)
            {
                numeroDocumento.Text = "";
                nombreCompletoCliente.Text = "";
                docTipo.SelectedIndex = 1;
                telefonoResidencia.Text = "";
                telefonoCelular.Text = "";
                pais.SelectedIndex = 1;
                ciudadResidencia.Text = "";
                departamentoEstado.Text = "";
                profesion.Text = "";
                direccion.Text = "";
                email.Text = "";

                Response.Redirect("clientes.aspx");
            }
            else
            {
                Response.Redirect("clientes.aspx");
            }
        }

        public void cargarDatos()
        {
            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("MOSTRAR_CLIENTES", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("registros", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            conexion.Close();
        }

        protected void actualizar_Click(object sender, EventArgs e)
        {
            string numerodocumento = numeroDocumento.Text.Trim();
            string emailcliente = email.Text.Trim();

            if (numerodocumento == "" || emailcliente == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Llena todos los campos para editar.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                numeroDocumento.Text = "";

                /*
                 
                 */
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
                com.CommandText = "UPDATE_CLIENTE";

                com.Parameters.Add("id_usuario", numeroDocumento.Text.Trim());
                com.Parameters.Add("nombreCompleto", nombreCompletoCliente.Text.Trim());
                com.Parameters.Add("tipoDoc", docTipo.Value);
                com.Parameters.Add("telefonoResidencial", Convert.ToInt32(telefonoResidencia.Text.Trim()));
                com.Parameters.Add("telefonoMovil", Convert.ToInt32(telefonoCelular.Text.Trim()));
                com.Parameters.Add("pais", pais.Value);
                com.Parameters.Add("departamento", departamentoEstado.Text.Trim());
                com.Parameters.Add("ciudadResidencia", ciudadResidencia.Text.Trim());
                com.Parameters.Add("direccion", direccion.Text.Trim());
                com.Parameters.Add("profesion", profesion.Text.Trim());
                com.Parameters.Add("email", email.Text.Trim());
                com.Parameters.Add("rol", rol.Value);
                com.Parameters.Add("usuEstado", estado);

                com.Connection = conexion;
                com.ExecuteNonQuery();
                cargarDatos();

                conexion.Close();

                numeroDocumento.Text = "";
                nombreCompletoCliente.Text = "";
                docTipo.SelectedIndex = 1;
                telefonoResidencia.Text = "";
                telefonoCelular.Text = "";
                pais.SelectedIndex = 1;
                ciudadResidencia.Text = "";
                departamentoEstado.Text = "";
                profesion.Text = "";
                direccion.Text = "";
                email.Text = "";
            }
        }

        protected void borrarCliente_Click(object sender, EventArgs e)
        {
            string numerodocumento = numeroDocumento.Text.Trim();

            if (numerodocumento == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Debes ingresar el Número de Documento para continuar');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                numeroDocumento.Text = "";
            }
            else
            {
                //conexión a la base de datos
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();
                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "DELETE_CLIENTE";
                com.Parameters.Add("id_usuario", numeroDocumento.Text.Trim());
                com.Connection = conexion;
                com.ExecuteNonQuery();
                cargarDatos();

                conexion.Close();

                numeroDocumento.Text = "";
                nombreCompletoCliente.Text = "";
                docTipo.SelectedIndex = 1;
                telefonoResidencia.Text = "";
                telefonoCelular.Text = "";
                pais.SelectedIndex = 1;
                ciudadResidencia.Text = "";
                departamentoEstado.Text = "";
                profesion.Text = "";
                direccion.Text = "";
                email.Text = "";
            }
        }

        protected void buscarDato_Click(object sender, EventArgs e)
        {
            cargarDatosBuscarDato();
            { ClientScript.RegisterStartupScript(GetType(), "buscarDatoModal", "abrirBusqueda();", true); }
        }

        public void cargarDatosBuscarDato()
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("BUSCAR_CLIENTES", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("datoBusqueda", datoBusqueda.Text.Trim());
            com.Parameters.Add("reg", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            com.Connection = conexion;

            gridBusquedaEspecial.DataSource = ds;
            gridBusquedaEspecial.DataBind();

            conexion.Close();
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../ingreso.aspx");
        }
    }
}