using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web113 : System.Web.UI.Page
    {
        Clases.Salas_por_teatro Salas_por_teatro = new Salas_por_teatro();
        protected void Page_Load(object sender, EventArgs e)
        {
            Salas_por_teatro.CargarGrid(gvSalaporTeatro);

            if (!IsPostBack)
            {
                Session["Cont"] = 0;

                Salas_por_teatro.CargarGrid(gvSalaporTeatro);
                Salas_por_teatro.CargarDDL1(ddlTeatro);
                Salas_por_teatro.CargarDDL2(ddlSala);
                HFSalaporTeatro.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Editar")
                {
                    Session["id"] = int.Parse(argument);
                    int id = int.Parse(argument);
                    int teatro_id = int.Parse(ddlTeatro.SelectedValue);
                    int sala_id = int.Parse(ddlSala.SelectedValue);
                    Salas_por_teatro.Llenar(id, out teatro_id, out sala_id);
                    ddlTeatro.SelectedValue = teatro_id.ToString();
                    ddlSala.SelectedValue = sala_id.ToString();
                    HFSalaporTeatro.Value = "true";
                    Session["Cont"] = 1;

                }
                if (target == "Eliminar")
                {

                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(Session["id"].ToString());
                        Salas_por_teatro.Eliminar(id);
                        Salas_por_teatro.CargarGrid(gvSalaporTeatro);
                    }
                    catch 
                    {
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }
                  
                }
            }
        }

        protected void gvSalaporTeatro_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalaporTeatro.PageIndex = e.NewPageIndex;
            Salas_por_teatro.CargarGrid(gvSalaporTeatro);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (int.Parse(Session["Cont"].ToString()) == 1)
            {
                int id = int.Parse(Session["id"].ToString());
                int usr = int.Parse(Session["Usro_Id"].ToString());
                int teatro_id = int.Parse(ddlTeatro.SelectedValue);
                int sala_id = int.Parse(ddlSala.SelectedValue);
                Salas_por_teatro.actualizar(id, teatro_id, sala_id, usr);
                Salas_por_teatro.CargarGrid(gvSalaporTeatro);
                Session["Cont"] = 0;
                HFSalaporTeatro.Value = "true";
            }
            else
            {
                int id = int.Parse(Session["id"].ToString());
                int usr = int.Parse(Session["Usro_Id"].ToString());
                int teatro_id = int.Parse(ddlTeatro.SelectedValue);
                int sala_id = int.Parse(ddlSala.SelectedValue);
                Salas_por_teatro.Insert(teatro_id, sala_id, usr);
                HFSalaporTeatro.Value = "true";
                Salas_por_teatro.CargarGrid(gvSalaporTeatro);
            }
        }
    }
    
}