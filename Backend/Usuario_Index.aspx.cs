using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;


namespace FM_Tickets_WebForm
{
    public partial class Formulario_web118 : System.Web.UI.Page
    {
        Clases.Usuarios usuarios = new Clases.Usuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
            usuarios.CargarGrid(gvUsuarios);

        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            usuarios.CargarGrid(gvUsuarios);
        }
    }
}