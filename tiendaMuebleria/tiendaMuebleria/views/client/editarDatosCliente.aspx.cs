using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace tiendaMuebleria.views.client
{
    public partial class editarDatosCliente : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            inactivos();
        }

        protected void buscarCliente_Click(object sender, EventArgs e)
        {
            string numeroDocumento = numeroDoc.Text.Trim();

            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("BUSCAR_CLIENTES", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("datoBusqueda", numeroDocumento);
            com.Parameters.Add("reg", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataSet data = new DataSet();
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            adapter.Fill(data);
            com.Connection = conexion;

            if(data.Tables[0].Rows.Count > 0)
            {
                string numeroDocTabla = ds.Rows[0]["NUMERO_DOCUMENTO"].ToString();

                if (numeroDocumento == numeroDocTabla)
                {
                    activos();
                    nombreCompletoCliente.Text = ds.Rows[0]["NOMBRE_COMPLETO"].ToString();
                    telefonoResidencia.Text = ds.Rows[0]["TELEFONO_RESIDENCIAL"].ToString();
                    telefonoCelular.Text = ds.Rows[0]["TELEFONO_MOVIL"].ToString();
                    pais.Value = ds.Rows[0]["PAIS"].ToString();
                    departamentoEstado.Text = ds.Rows[0]["DEPARTAMENTO"].ToString();
                    ciudadResidencia.Text = ds.Rows[0]["CIUDAD"].ToString();
                    direccion.Text = ds.Rows[0]["DIRECCION"].ToString();
                    profesion.Text = ds.Rows[0]["PROFESION"].ToString();
                    email.Text = ds.Rows[0]["EMAIL"].ToString();
                    conexion.Close();
                }
                else
                {
                    Response.Redirect("cliente.aspx");
                    conexion.Close();
                }
            }
            else
            {
                inactivos();
                string script = String.Format(@"<script type='text/javascript'>alert('No existe el cliente registrado, puede crearlo cuando pague su compra.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

            
        }

        public void inactivos()
        {
            panel_info.Visible = false;

        }

        public void activos()
        {
            panel_info.Visible = true;
        }

        protected void editarCliente_Click(object sender, EventArgs e)
        {
            string numeroDocumento = numeroDoc.Text.Trim();
            string correo = email.Text.Trim();
            string direccionT = direccion.Text.Trim();
            string nombreCliente = nombreCompletoCliente.Text.Trim();

            if(numeroDocumento != "" && correo != ""  && direccionT != "" && nombreCliente != "")
            {
                //conexión a la base de datos
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();
                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "UPDATE_CLIENTE_PANTALLA_CLIENTE";

                com.Parameters.Add("id_usuario", numeroDocumento);
                com.Parameters.Add("nombreCompleto", nombreCompletoCliente.Text.Trim());
                com.Parameters.Add("telefonoResidencial", Convert.ToInt32(telefonoResidencia.Text.Trim()));
                com.Parameters.Add("telefonoMovil", Convert.ToInt32(telefonoCelular.Text.Trim()));
                com.Parameters.Add("pais", pais.Value);
                com.Parameters.Add("departamento", departamentoEstado.Text.Trim());
                com.Parameters.Add("ciudadResidencia", ciudadResidencia.Text.Trim());
                com.Parameters.Add("direccion", direccion.Text.Trim());
                com.Parameters.Add("profesion", profesion.Text.Trim());
                com.Parameters.Add("email", email.Text.Trim());

                com.Connection = conexion;
                com.ExecuteNonQuery();

                conexion.Close();    

                string script = String.Format(@"<script type='text/javascript'>alert('Datos actualizados con éxito.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Debe llenar todos los campos para editar.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
    }
}