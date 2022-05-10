using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace tiendaMuebleria.views.admin.reports
{
    public partial class filtrarVentaCodigo : System.Web.UI.Page
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
                Response.Redirect("../../ingreso.aspx");
            }
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../ingreso.aspx");
        }

        public void cargarCompra()
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("BUSCAR_COMPRA", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("numeroReferencia", numeroRef.Text.Trim());
            com.Parameters.Add("compraEfectuada", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            com.Connection = conexion;

            gridBusquedaEspecial.DataSource = ds;
            gridBusquedaEspecial.DataBind();

            conexion.Close();
        }

        protected void buscarDato_Click(object sender, EventArgs e)
        {
            string numeroRefCompra = numeroRef.Text.Trim();

            if(numeroRefCompra == "" || numeroRefCompra == null)
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Ingresa el número de referencia de la compra.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                cargarCompra();
            }
        }
    }
}