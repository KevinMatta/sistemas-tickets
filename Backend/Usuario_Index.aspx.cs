using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;


namespace FM_Tickets_WebForm
{
    public partial class Formulario_web118 : System.Web.UI.Page
    {
        Clases.Usuarios usuarios = new Clases.Usuarios();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            usuarios.CargarGrid(gvUsuarios);
            CollapseUsuarios.Value = "false";
            usuarios.CargarDDL(ddlEmpleados);
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    string id = argument;
                    Session["ID"] = id;
                    string usuario;
                    string clave;
                    string personaID;
                    usuarios.Llenar(id, out usuario, out clave, out personaID);
                    txtUsuario.Value = usuario;
                    txtClave.Value = clave;
                    ddlEmpleados.SelectedValue = personaID;
                    CollapseUsuarios.Value = "true";
                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        usuarios.Eliminar(id);
                        usuarios.CargarGrid(gvUsuarios);
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

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            usuarios.CargarGrid(gvUsuarios);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if (Session["accion"].ToString() == "editar")
            {
                usuarios.Actualizar(int.Parse(Session["ID"].ToString()), txtUsuario.Value, txtClave.Value, int.Parse(ddlEmpleados.SelectedValue), int.Parse(Session["Usro_Id"].ToString()));
                usuarios.CargarGrid(gvUsuarios);
            }
            else
            {
                usuarios.Insert(txtUsuario.Value, txtClave.Value, int.Parse(ddlEmpleados.SelectedValue), int.Parse(Session["Usro_Id"].ToString()));
                usuarios.CargarGrid(gvUsuarios);
            }
            Session["ID"] = "";
            Session["accion"] = "";
            CollapseUsuarios.Value = "false";
            txtUsuario.Value = "";
            txtClave.Value = "";
            ddlEmpleados.SelectedValue = "0";
        }
    }
    
}