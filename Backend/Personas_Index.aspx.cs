using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web15 : System.Web.UI.Page
    {
        Clases.Personas personas = new Clases.Personas();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["Cont"] = 0;

                personas.CargarGrid(gvPersonas);
                personas.CargarDDL(ddlEstadoCiviles);
                Person_showCollapse.Value = "false";
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Editar")
                {
                    Session["id"] = int.Parse(argument);
                    int id = int.Parse(argument);
                    int estado;
                    string nombre;
                    string apellido;
                    string sexo;
                    string FechaN;
                    personas.Llenar(id, out nombre, out apellido, out sexo, out FechaN, out estado);
                    Person_showCollapse.Value = "true";
                    txtNombre.Value = nombre;
                    txtApellido.Value = apellido;
                    txtSexo.Value = sexo;
                    txtFechaN.Value = FechaN;
                    ddlEstadoCiviles.SelectedValue = estado.ToString();
                    Person_showCollapse.Value = "true";
                    Session["Cont"] = 1;

                }
                if (target == "Eliminar")
                {

                    try
                    {
                        Session["id"] = int.Parse(argument);
                        int id = int.Parse(argument);
                        personas.Eliminar(id);
                        personas.CargarGrid(gvPersonas);
                        gvPersonas.DataBind();
                    }
                    catch 
                    {
                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }
                   
                }
            }
        }
        protected void gvPersonas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPersonas.PageIndex = e.NewPageIndex;
            personas.CargarGrid(gvPersonas);
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {

            {
                if (int.Parse(Session["Cont"].ToString()) == 1)
                {
                    int id = int.Parse(Session["id"].ToString());
                    int usr = int.Parse(Session["Usro_Id"].ToString());
                    string nombre = txtNombre.Value;
                    string apellido = txtApellido.Value;
                    string sexo = txtSexo.Value;
                    string Fecha = txtFechaN.Value;
                    int Id_Estado = int.Parse(ddlEstadoCiviles.SelectedValue);
                    personas.actualizar(id, nombre, apellido, sexo, Fecha, Id_Estado, usr);
                    personas.CargarGrid(gvPersonas);
                    Session["Cont"] = 0;
                    Person_showCollapse.Value = "true";
                }
                else
                {
                    string nombre = txtNombre.Value;
                    string apellido = txtApellido.Value;
                    string sexo = txtSexo.Value;
                    string Fecha = txtFechaN.Value;
                    int usr = int.Parse(Session["Usro_Id"].ToString());
                    int Id_Estado = int.Parse(ddlEstadoCiviles.SelectedValue);
                    personas.Insert(nombre, apellido, sexo, Fecha, Id_Estado, usr);
                    Person_showCollapse.Value = "true";
                    personas.CargarGrid(gvPersonas);

                }
            }

        }
        protected void btnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}
