using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tiendaMuebleria
{
    public partial class reportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../ingreso.aspx");
        }

        protected void cerrarSesion_Click1(object sender, EventArgs e)
        {
            Session.Remove("usuarioLogueado");
            Response.Redirect("../ingreso.aspx");
        }
    }
}