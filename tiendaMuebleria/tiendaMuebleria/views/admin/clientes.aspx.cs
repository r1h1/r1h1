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

        }

        protected void agregarCliente_Click(object sender, EventArgs e)
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            //La variable estado activa automaticamente al cliente al insertar
            //ACTIVO = 1,  NO ACTIVO = 0
            int dirid = 1, rolid = 1, estado = 1;

            conexion.Open();
            OracleCommand com = new OracleCommand();
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.CommandText = "INSERTA_USUARIO";
            com.Parameters.Add("ID_Usu_NumeroDocumento", numeroDocumento.Text.Trim());
            com.Parameters.Add("Usu_NombreCompleto", nombreCompletoCliente.Text.Trim());
            com.Parameters.Add("Usu_TipoDoc", docTipo.Value);
            com.Parameters.Add("Usu_TelefonoResidencial", Convert.ToInt32(telefonoResidencia.Text.Trim()));
            com.Parameters.Add("Usu_TelefonoMovil", Convert.ToInt32(telefonoCelular.Text.Trim()));
            com.Parameters.Add("Dir_ID", dirid);
            com.Parameters.Add("Usu_Direccion", direccion.Text.Trim());
            com.Parameters.Add("Usu_Email", email.Text.Trim());
            com.Parameters.Add("Rol_ID", rolid);
            com.Parameters.Add("Usu_Estado", estado);
            com.Connection = conexion;
            com.ExecuteNonQuery();
            conexion.Close();

            if (estado != 0)
            {
                Response.Redirect("clientes.aspx");
            }
            else
            {
                Response.Redirect("clientes.aspx");
            }
        }
    }
}