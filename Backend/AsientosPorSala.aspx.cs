using FM_Tickets_WebForm.Clases;
using System;
using System.Web.UI.WebControls;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web16 : System.Web.UI.Page
    {
        Clases.Asientos_por_sala asientos_por_sala = new Asientos_por_sala();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Cont"] = 0;

                asientos_por_sala.CargarGrid(gvAsientosporSala);
                asientos_por_sala.CargarDDLAsientos(ddlAsiento);
                asientos_por_sala.CargarDDLSalas_Teatro(ddlSala_por_teatro);
                Hf_Asientos_sala.Value = "false";

            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Editar")
                {
                    Session["id"] = int.Parse(argument);
                    int id = int.Parse(argument);
                    int AsientoID;
                    int Sala_TeatroID;
                    asientos_por_sala.Llenar(id, out AsientoID, out Sala_TeatroID);
                    Hf_Asientos_sala.Value = "true";
                    ddlAsiento.SelectedValue = AsientoID.ToString();
                    ddlSala_por_teatro.SelectedValue = Sala_TeatroID.ToString();
                    Hf_Asientos_sala.Value = "true";
                    Session["Cont"] = 1;

                }
                if (target == "Eliminar")
                {
                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(argument);
                        asientos_por_sala.Eliminar(id);
                        asientos_por_sala.CargarGrid(gvAsientosporSala);
                        gvAsientosporSala.DataBind();
                    }
                    catch
                    {
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }

                }
            }
        }

        protected void gvAsientosporSala_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAsientosporSala.PageIndex = e.NewPageIndex;
            asientos_por_sala.CargarGrid(gvAsientosporSala);
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            if (int.Parse(Session["Cont"].ToString()) == 1)
            {
                int id = int.Parse(Session["id"].ToString());
                int usr = int.Parse(Session["Usro_Id"].ToString());
                int AsientoID = int.Parse(ddlAsiento.SelectedValue);
                int Sala_Teatro = int.Parse(ddlSala_por_teatro.SelectedValue);
                asientos_por_sala.Actualizar(id, AsientoID, Sala_Teatro, usr);
                asientos_por_sala.CargarGrid(gvAsientosporSala);
                Session["Cont"] = 0;
                Hf_Asientos_sala.Value = "true";
            }
            else
            {
                int usr = int.Parse(Session["Usro_Id"].ToString());
                int AsientoID = int.Parse(ddlAsiento.SelectedValue);
                int Sala_Teatro = int.Parse(ddlSala_por_teatro.SelectedValue); ; 
                asientos_por_sala.Insert(AsientoID, Sala_Teatro, usr);
                Hf_Asientos_sala.Value = "true";
                asientos_por_sala.CargarGrid(gvAsientosporSala);
            }
        }
    }
}