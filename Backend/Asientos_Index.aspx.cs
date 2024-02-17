using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        Clases.Asientos asientos = new Clases.Asientos();

        protected void Page_Load(object sender, EventArgs e)
        {
            asientos.CargarGrid(gvAsientos);
        }

        protected void gvAsientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAsientos.PageIndex = e.NewPageIndex;
            asientos.CargarGrid(gvAsientos);
        }
    }
}