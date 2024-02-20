using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web13 : System.Web.UI.Page
    {
        Clases.EstadosCiviles estadosCiviles = new Clases.EstadosCiviles();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                estadosCiviles.CargarGrid(gvEstadosCiviles);
                CollapseEstadosCiviles.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    int id = int.Parse(argument);
                    Session["ID"] = id;
                    string descripcion;
                    estadosCiviles.Llenar(id, out descripcion);
                    txtDescripcion.Value = descripcion;
                    CollapseEstadosCiviles.Value = "true";
                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        estadosCiviles.Eliminar(id);
                        estadosCiviles.CargarGrid(gvEstadosCiviles);
                    }
                    catch
                    {
                        //iziToast
                        //Response.Write("<script language=javascript>iziToast.Error({title: 'Error', message: 'Hay otras tablas que depende de este campo',});</script>");
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este Estado Civil');</script>");
                    }
                }

            }
        }

        protected void gvEstadosCiviles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEstadosCiviles.PageIndex = e.NewPageIndex;
            estadosCiviles.CargarGrid(gvEstadosCiviles);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"].ToString() == "editar")
            {
                estadosCiviles.Actualizar(int.Parse(Session["ID"].ToString()), txtDescripcion.Value, int.Parse(Session["Usro_Id"].ToString()));
                estadosCiviles.CargarGrid(gvEstadosCiviles);
            }
            else
            {
                estadosCiviles.Insert(txtDescripcion.Value, int.Parse(Session["Usro_Id"].ToString()));
                estadosCiviles.CargarGrid(gvEstadosCiviles);
            }
            Session["ID"] = "";
            Session["accion"] = "";
            CollapseEstadosCiviles.Value = "false";
            txtDescripcion.Value = "";
        }
    }


    
}