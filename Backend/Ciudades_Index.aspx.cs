using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Clases.Ciudades ciudades = new Clases.Ciudades();

        protected void Page_Load(object sender, EventArgs e)
        {
            ciudades.CargarGrid(gvCiudades);
            if (!IsPostBack)
            {
                Session["Cont"] = 0;
                ciudades.CargarGrid(gvCiudades);
                ciudades.CargarDDL(DDLDepto);
                HFCiudades.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Editar")
                {
                    Session["id"] = int.Parse(argument);
                    int id = int.Parse(argument);
                    string descripcion;
                    string funcion;
                    ciudades.Llenar(id, out descripcion, out funcion);
                    HFCiudades.Value = "true";
                    txtNombreCiudad.Value = descripcion;
                    DDLDepto.SelectedValue = funcion.ToString();
                    HFCiudades.Value = "true";
                    Session["Cont"] = 1;
                }
                if (target == "Eliminar")
                {
                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(Session["id"].ToString());
                        ciudades.Eliminar(id);
                        ciudades.CargarGrid(gvCiudades);
                    }
                    catch 
                    {

                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }
                  
                    //gvSala.DataBind();
                }
            }


        }

        protected void gvCiudades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCiudades.PageIndex = e.NewPageIndex;
            ciudades.CargarGrid(gvCiudades);

        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        { 
            int usr = int.Parse(Session["Usro_Id"].ToString());
            string estado = DDLDepto.SelectedValue;
            ciudades.Insert(txtNombreCiudad.Value,estado,usr);
            ciudades.CargarGrid(gvCiudades);
        }

        protected void btnGuardar_ServerClick1(object sender, EventArgs e)
        {

        }
    }
}