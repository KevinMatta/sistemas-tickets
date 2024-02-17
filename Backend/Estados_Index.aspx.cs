using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web12 : System.Web.UI.Page
    {
        Clases.Estados estados = new Clases.Estados();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                estados.CargarGrid(gvEstados);
                CollapseEstado.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    string id = argument;
                    Session["Estd_Id"] = id;
                    string nombre;
                    estados.Llenar(id, out nombre);
                    txtEstado.Value = nombre;
                    txtEstadoID.Value = id;
                    CollapseEstado.Value = "true";

                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        estados.Eliminar(id);
                        estados.CargarGrid(gvEstados);
                    }
                    catch
                    {
                        //iziToast
                        //Response.Write("<script language=javascript>iziToast.Error({title: 'Error', message: 'Hay otras tablas que depende de este campo',});</script>");
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }
                }

            }

        }

        protected void gvEstados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEstados.PageIndex = e.NewPageIndex;
            estados.CargarGrid(gvEstados);

        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"] == "editar")
            {
                estados.Actualizar(Session["Estd_Id"].ToString(), txtEstado.Value, int.Parse(Session["Usro_Id"].ToString()));
                estados.CargarGrid(gvEstados);
            }
            else
            {
                estados.Insert(txtEstadoID.Value, txtEstado.Value, int.Parse(Session["Usro_Id"].ToString()));
                estados.CargarGrid(gvEstados);
            }
            Session["Obrs_Id"] = "";
            Session["accion"] = "";
            CollapseEstado.Value = "false";
        }
    }
}