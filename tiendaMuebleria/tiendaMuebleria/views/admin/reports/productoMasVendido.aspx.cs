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
    public partial class productoMasVendido : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            alerta.Visible = false;
        }

        protected void buscarDato_Click(object sender, EventArgs e)
        {
            alerta.Visible = false;
            fechaGeneracion.Text = DateTime.Now.ToString();
            string fechaInicio = fechaTInicio.Text.Trim();
            string fechaFin = fechaTFin.Text.Trim();

            feInicio.Text = fechaInicio;
            feFin.Text = fechaFin;


            if (fechaInicio == "" && fechaFin == "")
            {
                prodMasVendido.Visible = false;
                alerta.Visible = true;

                textoAlerta.Text = "Debes ingresar la fecha de inicio y final para generar el reporte.";
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);
                OracleCommand command = new OracleCommand("PRODUCTO_MAS_VENDIDO", conexion);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("fechaInicio", fechaInicio);
                command.Parameters.Add("fechaFin", fechaFin);
                command.Parameters.Add("prodMasVendido", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                OracleDataAdapter d = new OracleDataAdapter();
                d.SelectCommand = command;
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                d.Fill(dt);
                d.Fill(ds);

                string nProducto = dt.Rows[0]["Nombre_Producto"].ToString();


                if (ds.Tables[0].Rows.Count == 0)
                {
                    prodMasVendido.Visible = false;
                    ciudadYDemasReport.Visible = false;
                    alerta.Visible = true;

                    textoAlerta.Text = "No se encuentran productos con las fechas establecidas, por favor verifique.";

                    conexion.Close();
                }
                else
                {
                    OracleCommand com = new OracleCommand("CIUDAD_TIPO_PRODUCTO_MAS_VENDIDO", conexion);
                    com.CommandType = System.Data.CommandType.StoredProcedure;
                    com.Parameters.Add("nombreProducto", nProducto);
                    com.Parameters.Add("registros ", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                    OracleDataAdapter da = new OracleDataAdapter();
                    da.SelectCommand = com;
                    DataTable dta = new DataTable();
                    DataSet dsa = new DataSet();
                    da.Fill(dta);
                    da.Fill(dsa);

                    prodMasVendido.Visible = true;
                    prodMasVendido.DataSource = dt;
                    prodMasVendido.DataBind();

                    ciudadYDemasReport.Visible = true;
                    ciudadYDemasReport.DataSource = dta;
                    ciudadYDemasReport.DataBind();
                }

                conexion.Close();
            }
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../../ingreso.aspx");
        }
    }
}