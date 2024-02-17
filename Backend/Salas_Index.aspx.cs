using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web112 : System.Web.UI.Page
    {
        Clases.Salas Salas = new Clases.Salas();
        protected void Page_Load(object sender, EventArgs e)
        {
            Salas.CargarGrid(gvSala);

            if (!IsPostBack)
            {
                Session["Cont"] = 0;

                Salas.CargarGrid(gvSala);
                Salas.CargarDDL(ddlFunciones);
                Salas_Colapse.Value = "false";
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
                    int funcion;
                    Salas.Llenar(id, out descripcion , out funcion);
                    Salas_Colapse.Value = "true";
                    txtSala.Value = descripcion;
                    ddlFunciones.SelectedValue = funcion.ToString();
                    Salas_Colapse.Value = "true";
                    Session["Cont"] = 1;

                }
                if (target == "Eliminar")
                {
                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(Session["id"].ToString());
                        Salas.Eliminar(id);
                        Salas.CargarGrid(gvSala);
                    }
                    catch 
                    {
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");
                    }

                    //gvSala.DataBind();
                }
            }
        }

        protected void gvSala_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSala.PageIndex = e.NewPageIndex;
            Salas.CargarGrid(gvSala);

        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {

            if (int.Parse(Session["Cont"].ToString()) == 1)
            {
                int id = int.Parse(Session["id"].ToString());
                int usr = int.Parse(Session["Usro_Id"].ToString());
                string sala = txtSala.Value;
                int funcion_ID = int.Parse(ddlFunciones.SelectedValue);
                Salas.actualizar(id, sala, funcion_ID, usr);
                Salas.CargarGrid(gvSala);
                Session["Cont"] = 0;
                Salas_Colapse.Value = "true";
            }
            else
            {
                int usr = int.Parse(Session["Usro_Id"].ToString());
                int funcion_ID = int.Parse(ddlFunciones.SelectedValue);
                Salas.Insert(txtSala.Value, funcion_ID, usr);
                Salas_Colapse.Value = "true";
                Salas.CargarGrid(gvSala);
            }
        }

    }
}