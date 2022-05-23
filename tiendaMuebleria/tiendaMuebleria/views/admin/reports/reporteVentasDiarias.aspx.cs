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

namespace tiendaMuebleria.views.admin.reports
{
    public partial class reporteVentasDiarias : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            divTotalVenta.Visible = false;
            alertaVacio.Visible = false;
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../../ingreso.aspx");
        }

        protected void buscarDato_Click(object sender, EventArgs e)
        {
            alertaVacio.Visible = false;

            string fechaHoy = DateTime.Now.Date.ToString("dd-MM-yyyy");

            fechaGeneracion.Text = DateTime.Now.ToString();
            fechaInicio.Text = fechaHoy;
            fechaFin.Text = fechaHoy;
            ciudad.Text = "Ciudad de Guatemala";

            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("REPORTE_VENTAS_DIARIA", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("fechaDia", fechaHoy);
            command.Parameters.Add("reporteVentaDiaria", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            DataSet reporteVentasDiarias = new DataSet();
            d.Fill(dt);
            d.Fill(reporteVentasDiarias);
            ventasDiarias.DataSource = dt;
            ventasDiarias.DataBind();


            OracleCommand com = new OracleCommand("TOTAL_VENTAS_DIARIA", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("fechaDia", fechaHoy);
            com.Parameters.Add("totalVentaDiaria", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter totalVentaDiariaDinero = new OracleDataAdapter();
            totalVentaDiariaDinero.SelectCommand = com;
            DataTable tabla = new DataTable();
            totalVentaDiariaDinero.Fill(tabla);

            if(reporteVentasDiarias.Tables[0].Rows.Count == 0)
            {
                divTotalVenta.Visible = false;
                alertaVacio.Visible = true;
                ventasDiarias.Visible = false;

                ventaVacia.Text = "No se encontró ninguna venta con fecha: " + fechaHoy + ", vende algo primero e intenta de nuevo.";

                conexion.Close();
            }
            else
            {
                totalVentaDiaria.Text = tabla.Rows[0]["TOTAL_VENTA_DIARIA"].ToString();
                divTotalVenta.Visible = true;
                conexion.Close();
            }            

            conexion.Close();
        }
    }
}