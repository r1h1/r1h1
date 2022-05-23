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
    public partial class descripcionProducto : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["IdProducto"] != null)
            {
                idProducto.Text = Request.QueryString["IdProducto"].ToString();
            }

            cargarDatosDetalleProducto();
        }

        public void cargarDatosDetalleProducto()
        {
            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("MOSTRAR_PRODUCTOS_DETALLE", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("idProdFiltrar", Convert.ToInt32(idProducto.Text.Trim()));
            command.Parameters.Add("productosDetalle", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            detalleProducto.DataSource = dt;
            detalleProducto.DataBind();
            conexion.Close();
        }
    }
}