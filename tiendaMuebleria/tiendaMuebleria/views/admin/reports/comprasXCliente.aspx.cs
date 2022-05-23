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
    public partial class comprasXCliente : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            alerta.Visible = false;
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../../ingreso.aspx");
        }

        protected void buscarDato_Click(object sender, EventArgs e)
        {
            alerta.Visible = false;

            fechaGeneracion.Text = DateTime.Now.ToString();
            string numeroDocCliente = clienteDoc.Text.Trim();

            if (numeroDocCliente == "" || numeroDocCliente == null)
            {
                comprasXClient.Visible = false;
                alerta.Visible = true;

                textoAlerta.Text = "Debes ingresar el no. de documento del cliente para continuar.";                
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);
                OracleCommand command = new OracleCommand("COMPRAS_X_CLIENTE", conexion);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("cliente", Convert.ToInt64(numeroDocCliente));
                command.Parameters.Add("compraXCliente", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
                OracleDataAdapter d = new OracleDataAdapter();
                d.SelectCommand = command;
                DataTable dt = new DataTable();
                DataSet ds = new DataSet();
                d.Fill(dt);
                d.Fill(ds);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    comprasXClient.Visible = false;
                    alerta.Visible = true;

                    textoAlerta.Text = "No se encuentran ventas con el número de documento del cliente, por favor, verifique o intente de nuevo.";

                    conexion.Close();
                }
                else
                {
                    comprasXClient.Visible = true;
                    comprasXClient.DataSource = dt;
                    comprasXClient.DataBind();
                }

                conexion.Close();
            }          
        }
    }
}