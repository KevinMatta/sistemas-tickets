using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Clases.Ciudades ciudades = new Clases.Ciudades();

        protected void Page_Load(object sender, EventArgs e)
        {
            ciudades.CargarGrid(gvCiudades);

        }

        protected void gvCiudades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCiudades.PageIndex = e.NewPageIndex;
            ciudades.CargarGrid(gvCiudades);

        }
    }
}