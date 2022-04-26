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
    public partial class carrito : System.Web.UI.Page
    {
        string con = ConfigurationManager.ConnectionStrings["connectOrcl"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarProductosEnCarrito();
            cargarNumeroProductosCarrito();
        }

        public void cargarProductosEnCarrito()
        {
            OracleConnection conexion = new OracleConnection(con);
            OracleCommand command = new OracleCommand("MOSTRAR_PRODUCTOS_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("prods", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter d = new OracleDataAdapter();
            d.SelectCommand = command;
            DataTable dt = new DataTable();
            d.Fill(dt);
            productosEnCarrito.DataSource = dt;
            productosEnCarrito.DataBind();
            conexion.Close();
        }

        public void cargarNumeroProductosCarrito()
        {
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand command = new OracleCommand("CONTAR_PRODUCTOS_CARRITO", conexion);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add("prodsCarrito", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            OracleDataAdapter adapter = new OracleDataAdapter(command);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            command.Connection = conexion;
            string numeroProductosCarrito = ds.Rows[0]["Count(*)"].ToString();
            cantProdCar.Text = numeroProductosCarrito + " " + "productos";

            conexion.Close();
        }

        protected void borrarCod_Click(object sender, EventArgs e)
        {
            int codigoProductoABorrar = Convert.ToInt32(codigoBorrar.Text.Trim());
        }

        protected void borrarTodo_Click(object sender, EventArgs e)
        {
            //borra toda la tabla del carrito haciendo un delete * from
        }
    }
}