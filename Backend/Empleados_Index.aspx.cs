using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web18 : System.Web.UI.Page
    {
       Clases.Empleados Empleados = new Clases.Empleados();
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleados.CargarGrid(gvEmpleados);
        }

        protected void gvEmpleados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvEmpleados.PageIndex = e.NewPageIndex;
            Empleados.CargarGrid(gvEmpleados);
        }
    }
}