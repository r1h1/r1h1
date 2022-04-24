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
    public partial class cliente : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarStockProductos();
        }

        public void cargarStockProductos()
        {
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand command = new OracleCommand("MOSTRAR_PRODUCTOS_COMPRAR", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("registros", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            conexion.Close();
        }

        protected void agregarCarrito_Click(object sender, EventArgs e)
        {
            int ejemplo = 1;
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand command = new OracleCommand("INSERTA_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("carritoIdProducto", Convert.ToInt32(ejemplo));
            command.Parameters.Add("cantidadCompraProducto", Convert.ToInt32(ejemplo));
            command.Connection = conexion;

            command.ExecuteNonQuery();

            conexion.Close();
        }
    }
}