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
            contarProductos();
            mostrarProductos();
        }

        public void contarProductos()
        {
            //conexión a la base de datos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand comm = new OracleCommand("CONTAR_CANTIDAD_PRODUCTOS", conexion);
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Parameters.Add("regs", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter ad = new OracleDataAdapter(comm);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            comm.Connection = conexion;
            cantidadProductos.Text = dt.Rows[0]["cantidadRep"].ToString();

            conexion.Close();
        }

        public void mostrarProductos()
        {
            //mostrar la información de los productos
            OracleConnection conexion = new OracleConnection(con);

            conexion.Open();

            OracleCommand com = new OracleCommand("MOSTRAR_PRODUCTOS_COMPRAR", conexion);
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.Parameters.Add("registros", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

            OracleDataAdapter adapter = new OracleDataAdapter(com);
            DataTable ds = new DataTable();
            adapter.Fill(ds);
            com.Connection = conexion;

            string prodnombre, proprecio;

            prodnombre = ds.Rows[0]["nombre"].ToString();
            proprecio = ds.Rows[0]["precio"].ToString();

            conexion.Close();
        }
    }
}