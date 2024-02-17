using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web112 : System.Web.UI.Page
    {
        Clases.Salas Salas = new Clases.Salas();
        protected void Page_Load(object sender, EventArgs e)
        {
            Salas.CargarGrid(gvSala);
        }

        protected void gvSala_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSala.PageIndex = e.NewPageIndex;
            Salas.CargarGrid(gvSala);
        }
    }
}