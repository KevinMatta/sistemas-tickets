using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web111 : System.Web.UI.Page
    {
        Clases.Participantes participantes =  new Clases.Participantes();   
        protected void Page_Load(object sender, EventArgs e)
        {
            participantes.CargarGrid(gvParticipantes);
        }

        protected void gvParticipantes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvParticipantes.PageIndex = e.NewPageIndex;
            participantes.CargarGrid(gvParticipantes);
        }
    }
}