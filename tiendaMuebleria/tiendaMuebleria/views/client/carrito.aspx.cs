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
            string codigoProductoABorrar = codigoBorrar.Text.Trim();

            if(codigoProductoABorrar == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('El ID de producto a borrar no puede ir vacío.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;

                com.CommandText = "BORRAR_CARRITO_POR_ID";
                com.Parameters.Add("idProdCarrito", Convert.ToInt32(codigoBorrar.Text.Trim()));

                com.Connection = conexion;

                com.ExecuteNonQuery();

                conexion.Close();

                Response.Redirect("carrito.aspx");
            }
            
        }

        protected void borrarTodo_Click(object sender, EventArgs e)
        {
            
            string codigoProductoABorrar = codigoBorrar.Text.Trim();

            if (codigoProductoABorrar == "")
            {
                string yesornot = String.Format(@"<script type='text/javascript'>alert('¿Estás seguro de borrarlo?, pon 0 en el apartado COD para borrar.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", yesornot, false);
            }
            else
            {
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand com = new OracleCommand();
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.CommandText = "BORRAR_TODO_EL_CARRITO";

                com.Connection = conexion;

                com.ExecuteNonQuery();

                conexion.Close();

                Response.Redirect("carrito.aspx");
            }
            
        }
    }
}