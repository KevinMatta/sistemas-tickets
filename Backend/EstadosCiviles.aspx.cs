using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        Clases.EstadosCiviles estadosCiviles = new Clases.EstadosCiviles();

        protected void Page_Load(object sender, EventArgs e)
        {
            estadosCiviles.CargarGrid(gvEstadosCiviles);

        }

        protected void gvEstadosCiviles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEstadosCiviles.PageIndex = e.NewPageIndex;
            estadosCiviles.CargarGrid(gvEstadosCiviles);

        }
    }
}