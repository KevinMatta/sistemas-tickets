using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web16 : System.Web.UI.Page
    {
        Clases.Asientos_por_sala asientos_por_sala = new Asientos_por_sala();
        protected void Page_Load(object sender, EventArgs e)
        {
            asientos_por_sala.CargarGrid(gvAsientosporSala);
        }

        protected void gvAsientosporSala_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAsientosporSala.PageIndex = e.NewPageIndex;
            asientos_por_sala.CargarGrid(gvAsientosporSala);
        }
    }
}