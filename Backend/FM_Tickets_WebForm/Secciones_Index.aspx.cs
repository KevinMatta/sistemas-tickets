using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        Clases.Secciones Secciones = new Clases.Secciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            Secciones.CargarGrid(gvSecciones);
        }
    }
}