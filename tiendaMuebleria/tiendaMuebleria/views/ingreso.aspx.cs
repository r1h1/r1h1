using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);
            conexion.Open();
            OracleCommand com = new OracleCommand("INGRESO_USUARIO", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("email", correoElectronico.Text);
            com.Parameters.Add("numdoc", Convert.ToInt32(numeroDocumento.Text));
            com.Connection = conexion;
            int result = Convert.ToInt32(com.ExecuteScalar());

            if (result == 1)
            {
                Response.Redirect("admin/dashboard.aspx");
            }
            else
            {
                Response.Redirect("../index.aspx");

            }
            conexion.Close();

        }

        protected void ingresarSistema_Click1(object sender, EventArgs e)
        {

        }
    }
}