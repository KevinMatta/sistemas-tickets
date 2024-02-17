using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using FM_Tickets_WebForm.Clases;


namespace FM_Tickets_WebForm
{
    public partial class Index2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnEntrar_Click(object sender, EventArgs e)
        {
            InicioSesion inicio = new InicioSesion();
            string result = inicio.Iniciar(txtUsuario.Text, txtContraseña.Text);
            if (result != "")
            {
                Session["Usuario"] = result;
                Response.Redirect("Main.aspx");
            }
        }
    }
}