﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web114 : System.Web.UI.Page
    {
        Clases.Teatros teatros = new Clases.Teatros();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                teatros.CargarGrid(gvTeatros);
                CollapseTeatro.Value = "false";
                teatros.CargarDDL(ddlCiudades);
            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];

                if (target == "Editar")
                {
                    Session["accion"] = "editar";
                    int id = int.Parse(argument);
                    Session["Teat_Id"] = id;
                    string nombre;
                    string ciudad;
                    teatros.Llenar(id, out nombre, out ciudad);
                    txtTeatro.Value = nombre;
                    ddlCiudades.SelectedValue = ciudad;
                    CollapseTeatro.Value = "true";

                }
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    try
                    {
                        teatros.Eliminar(id);
                        teatros.CargarGrid(gvTeatros);
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

        protected void gvTeatros_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeatros.PageIndex = e.NewPageIndex;   
            teatros.CargarGrid(gvTeatros);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {

            if (Session["accion"] == "editar")
            {
                teatros.Actualizar(int.Parse(Session["Teat_Id"].ToString()), txtTeatro.Value, int.Parse(ddlCiudades.SelectedValue), int.Parse(Session["Usro_Id"].ToString()));
                teatros.CargarGrid(gvTeatros);
            }
            else
            {
                teatros.Insert(txtTeatro.Value, ddlCiudades.SelectedValue, int.Parse(Session["Usro_Id"].ToString()));
                teatros.CargarGrid(gvTeatros);
            }
            Session["Teat_Id"] = "";
            Session["accion"] = "";
            CollapseTeatro.Value = "false";
        }
    }
}