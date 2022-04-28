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
            cargarNumeroProductosCarrito();
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
            stockProductos.DataSource = dt;
            stockProductos.DataBind();

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
            noProductosCarrito.Text = numeroProductosCarrito;

            conexion.Close();
        }

        protected void agregarCarrito_Click(object sender, EventArgs e)
        {

            //SE OBTIENE EL VALOR SEND DEL BOTON "AGREGAR CARRITO
            Button agregarCarrito = (Button)sender;

            //SE CREA UN DATALISTITEM, PARA OBTENER LOS VALORES DENTRO DEL DATALIST
            DataListItem item = (DataListItem)agregarCarrito.Parent;

            //SE OBTIENE EL VALOR DEL PRODUCTO DE LA LABEL "PROIDLABEL"
            Label PRO_IDLabel = (Label)item.Controls[1];
            string idprod = PRO_IDLabel.Text;

            //SE OBTIENE EL PRECIO DEL PRODUCTO DE LA LABEL "PROIDLABEL"
            Label PRO_PRECIOLabel = (Label)item.FindControl("PRO_PRECIOLabel");
            string proprecio = PRO_PRECIOLabel.Text;

            //SE OBTIENE EL VALOR DEL TEXTBOX "CANTIDADPROD"
            TextBox cantidadComprar = (TextBox)item.FindControl("cantidadComprar");
            string cantProducto = cantidadComprar.Text.ToString();

            int cantPro = Convert.ToInt32(cantProducto);
            double precioPro = Convert.ToDouble(proprecio);

            double totalCompraProducto = precioPro * cantPro;


            if (cantProducto == "")
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Debes poner la cantidad a comprar.');</script>", "Error");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
            else
            {
                //SE CONECTA A BASE DE DATOS Y SE PROCEDE CON SU INSERCIÓN A LA TABLA "CARRITO"
                OracleConnection conexion = new OracleConnection(con);

                conexion.Open();

                OracleCommand command = new OracleCommand("INSERTA_CARRITO", conexion);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Add("carritoIdProducto", Convert.ToInt32(idprod));
                command.Parameters.Add("cantidadCompraProducto", Convert.ToInt32(cantProducto));
                command.Parameters.Add("totalProducto", totalCompraProducto);
                command.Connection = conexion;

                command.ExecuteNonQuery();

                conexion.Close();

                Response.Redirect("cliente.aspx");
            }
        }

        protected void masInformacion_Click(object sender, EventArgs e)
        {
            //SE OBTIENE EL VALOR SEND DEL BOTON "AGREGAR CARRITO
            Button masInformacion = (Button)sender;

            //SE CREA UN DATALISTITEM, PARA OBTENER LOS VALORES DENTRO DEL DATALIST
            DataListItem item = (DataListItem)masInformacion.Parent;

            //SE OBTIENE EL VALOR DEL PRODUCTO DE LA LABEL "PROIDLABEL"
            Label PRO_IDLabel = (Label)item.Controls[1];
            string idprodfiltrar = PRO_IDLabel.Text;

            Response.Redirect("descripcionProducto.aspx?IdProducto=" + idprodfiltrar);
        }
    }
}