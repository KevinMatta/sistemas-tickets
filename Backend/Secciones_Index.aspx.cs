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
            if (!IsPostBack)
            {
                Secciones.CargarGrid(gvSecciones);
                CollapseSecciones.Value = "false";
                //cargar ddl
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    CollapseSecciones.Value = "true";
                    Session["accion"] = "editar";
                    string id = argument;
                    Session["Secc_Id"] = id;
                    string seccion;
                    string precio;
                    string sate;
                    Secciones.Llenar(id, out seccion, out precio, out sate);
                    txtSeccion.Value = seccion;
                    txtSeccionPrecio.Value = precio;
                    txtSeccionporTeatro.Value = sate;

                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        Secciones.Eliminar(id);
                        Secciones.CargarGrid(gvSecciones);
                    }
                    catch
                    {
                        //iziToast
                        //Response.Write("<script language=javascript>iziToast.Error({title: 'Error', message: 'Hay otras tablas que depende de este campo',});</script>");
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de esta Seccion');</script>");
                    }
                }

            }
        }

        protected void gvSecciones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSecciones.PageIndex = e.NewPageIndex;
            Secciones.CargarGrid(gvSecciones);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"] == "editar")
            {
                Secciones.Actualizar(Session["Secc_Id"].ToString(), txtSeccion.Value, txtSeccionPrecio.Value, txtSeccionporTeatro.Value, int.Parse(Session["Usro_Id"].ToString()));
                Secciones.CargarGrid(gvSecciones);
            }
            else
            {
                Secciones.Insert(txtSeccion.Value, double.Parse(txtSeccionPrecio.Value), txtSeccionporTeatro.Value, int.Parse(Session["Usro_Id"].ToString()));
                Secciones.CargarGrid(gvSecciones);
            }
            Session["Secc_Id"] = "";
            Session["accion"] = "";
            CollapseSecciones.Value = "false";
        }
    }
}