using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web19 : System.Web.UI.Page
    {
        Clases.Funciones Funciones = new Clases.Funciones();    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Funciones.CargarGrid(gvFunciones);
                CollapseFunciones.Value = "false";
                Funciones.CargarDDL(ddlObras);
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    string id = argument;
                    Session["Fncs_Id"] = id;
                    string fecha;
                    string obra;
                    Funciones.Llenar(id, out fecha, out obra);
                    txtfechaFun.Value = fecha;
                    ddlObras.SelectedValue = obra;
                    CollapseFunciones.Value = "true";

                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        Funciones.Eliminar(id);
                        Funciones.CargarGrid(gvFunciones);
                    }
                    catch
                    {
                        //iziToast
                        //Response.Write("<script language=javascript>iziToast.Error({title: 'Error', message: 'Hay otras tablas que depende de este campo',});</script>");
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de esta Funcion');</script>");
                    }
                }

            }
        }

        protected void gvFunciones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFunciones.PageIndex = e.NewPageIndex;
            Funciones.CargarGrid(gvFunciones);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"] == "editar")
            {
                Funciones.Actualizar(Session["Fncs_Id"].ToString(), txtfechaFun.Value, ddlObras.SelectedValue, int.Parse(Session["Usro_Id"].ToString()));
                Funciones.CargarGrid(gvFunciones);
            }
            else
            {
                Funciones.Insert(txtfechaFun.Value, int.Parse(ddlObras.SelectedValue), int.Parse(Session["Usro_Id"].ToString()));
                Funciones.CargarGrid(gvFunciones);
            }
            Session["Obrs_Id"] = "";
            Session["accion"] = "";
            CollapseFunciones.Value = "false";
        }
    }
}