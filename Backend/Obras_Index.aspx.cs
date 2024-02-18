using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web110 : System.Web.UI.Page
    {
        Clases.Obras Obras = new Clases.Obras();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Obras.CargarGrid(gvObras);
                CollapseObras.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    int id = int.Parse(argument);
                    Session["Obrs_Id"] = id;
                    string nombre;
                    Obras.Llenar(id, out nombre);
                    txtObraNombre.Value = nombre;
                    CollapseObras.Value = "true";

                }
                if (target == "Eliminar")
                {
                    ShowModalElim.Value = "true";
                    int id = int.Parse(argument);
                    Session["ID"] = id;

                }

            }



        }

        protected void gvObras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvObras.PageIndex = e.NewPageIndex;
            Obras.CargarGrid(gvObras);

        }


        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"] == "editar")
            {
                Obras.Actualizar(int.Parse(Session["Obrs_Id"].ToString()), txtObraNombre.Value, int.Parse(Session["Usro_Id"].ToString()));
                Obras.CargarGrid(gvObras);
            }
            else
            {
                Obras.Insertar(txtObraNombre.Value, int.Parse(Session["Usro_Id"].ToString()));
                Obras.CargarGrid(gvObras);
            }
            Session["Obrs_Id"] = "";
            Session["accion"] = "";
            CollapseObras.Value = "false";
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Obras.Eliminar(int.Parse(Session["ID"].ToString()));
                Obras.CargarGrid(gvObras);
            }
            catch
            {
                //iziToast
                //Response.Write("<script language=javascript>iziToast.Error({title: 'Error', message: 'Hay otras tablas que depende de este campo',});</script>");
                Response.Write("<script language=javascript>alert('Existen campos dependientes de esta obra');</script>");

            }
        }
    }
}