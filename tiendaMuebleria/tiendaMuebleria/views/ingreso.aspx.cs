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
    public partial class ingreso : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ingresarSistema_Click(object sender, EventArgs e) 
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("INGRESAR_SISTEMA", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("email", correoElectronico.Text.Trim());
            com.Parameters.Add("numeroDoc", Convert.ToInt64(numeroDocumento.Text.Trim()));
            com.Parameters.Add("registros", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            com.Connection = conexion;
            string valor = ds.Rows[0]["Count(*)"].ToString();

            if (valor == "1")
            {
                Response.Redirect("admin/dashboard.aspx");
            }
            else
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Correo y/o Número de documento incorrecto.');</script>");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            conexion.Close();

        }
    }
}