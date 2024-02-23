using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web111 : System.Web.UI.Page
    {
        Clases.Participantes participantes =  new Clases.Participantes();   
        Obras obras = new Obras();
        Personas personas = new Personas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                participantes.CargarGrid(gvParticipantes);
                obras.CargarObras(ddlObras);
                personas.CargarDDL(ddlPersonas);
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    Session["ID"] = id;
                    try
                    {
                        participantes.Eliminar(id);
                    }
                    catch
                    {
                        string script = @"
                                iziToast.error({
                                    title: 'Fallido',
                                    message: 'No se pudo ingresar el registro',
                                });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
                    }
                }
                if(target == "Editar")
                {
                    int id = int.Parse(argument);
                    string obraID;
                    string personaID;
                    string rol;
                    participantes.Llenar(id.ToString(), out obraID, out personaID, out rol);
                    ddlObras.SelectedValue = obraID;
                    ddlPersonas.SelectedValue = personaID;
                    txtRol.Value = rol;
                }
            }
        }

        protected void gvParticipantes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvParticipantes.PageIndex = e.NewPageIndex;
            participantes.CargarGrid(gvParticipantes);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (ddlObras.SelectedValue == "0" || string.IsNullOrEmpty(txtRol.Value) || ddlPersonas.SelectedValue == "0")
            {
                string script = @"
                                iziToast.warning({
                                    title: 'Error',
                                    message: 'Debe Completar todos los campos',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
                return;
            }
            if (Session["accion"].ToString() == "Editar")
            {
                try
                {
                    participantes.Insert(ddlObras.SelectedValue, txtRol.Value, ddlPersonas.SelectedValue, int.Parse(Session["Usro_Id"].ToString()));
                    participantes.CargarGrid(gvParticipantes);
                }
                catch
                {
                    return;
                }
            }
            else
            {
                try
                {
                    participantes.Actualizar(Session["ID"].ToString(), txtRol.Value, ddlObras.SelectedValue, ddlPersonas.SelectedValue, Session["Usro_Id"].ToString());
                    participantes.CargarGrid(gvParticipantes);
                }
                catch
                {
                    return;
                }
            }


                ddlObras.ClearSelection();
                ddlPersonas.ClearSelection();
                txtRol.Value = "";
        }
    }
}