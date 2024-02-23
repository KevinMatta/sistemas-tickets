using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web14 : System.Web.UI.Page
    {
        Clases.Asientos asientos = new Clases.Asientos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Cont"] = 0;

                asientos.CargarGrid(gvAsientos);
                asientos.CargarDDL(ddlSecciones);
                Hf_secciones.Value = "false";
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
                    int id_seccion;
                    asientos.Llenar(id, out descripcion, out id_seccion);
                    Hf_secciones.Value = "true";
                    txtDescripcion.Value = descripcion;
                    ddlSecciones.SelectedValue = id_seccion.ToString();
                    Hf_secciones.Value = "true";
                    Session["Cont"] = 1;

                }
                if (target == "Eliminar")
                {

                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(argument);
                        asientos.Eliminar(id);
                        asientos.CargarGrid(gvAsientos);
                        gvAsientos.DataBind();
                    }
                    catch
                    {
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }

                }
            }
        }

        protected void gvAsientos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAsientos.PageIndex = e.NewPageIndex;
            asientos.CargarGrid(gvAsientos);
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            if (int.Parse(Session["Cont"].ToString()) == 1)
            {
                int id = int.Parse(Session["id"].ToString());
                int usr = int.Parse(Session["Usro_Id"].ToString());
                string descripcion = txtDescripcion.Value;
                int id_seccion = int.Parse(ddlSecciones.SelectedValue);
                asientos.Actualizar(id, descripcion, id_seccion, usr);
                asientos.CargarGrid(gvAsientos);
                Session["Cont"] = 0;
                Hf_secciones.Value = "true";
            }
            else
            {
                int usr = int.Parse(Session["Usro_Id"].ToString());
                string descripcion = txtDescripcion.Value;
                int id_seccion = int.Parse(ddlSecciones.SelectedValue); ;
                asientos.Insert(descripcion, id_seccion, usr);
                Hf_secciones.Value = "true";
                asientos.CargarGrid(gvAsientos);
            }
        }
    }
}