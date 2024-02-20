using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"].ToString() == "" || Session["Usuario"] == null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void BtnCerrarSesion_ServerClick(object sender, EventArgs e)
        {
                Session.Clear();            
                Server.Transfer("Index.aspx");
            
        }
    }
}