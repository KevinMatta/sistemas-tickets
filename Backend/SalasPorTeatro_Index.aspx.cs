using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web113 : System.Web.UI.Page
    {
        Clases.Salas_por_teatro Salas_por_teatro = new Salas_por_teatro();
        protected void Page_Load(object sender, EventArgs e)
        {
            Salas_por_teatro.CargarGrid(gvSalaporTeatro);
        }

        protected void gvSalaporTeatro_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalaporTeatro.PageIndex = e.NewPageIndex;
            Salas_por_teatro.CargarGrid(gvSalaporTeatro);
        }
    }
}