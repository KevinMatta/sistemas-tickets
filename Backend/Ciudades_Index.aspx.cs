using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;

namespace FM_Tickets_WebForm
{
    public partial class Formulario_web11 : System.Web.UI.Page
    {
        Clases.Ciudades ciudades = new Clases.Ciudades();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ciudades.CargarGrid(gvCiudades);
                ciudades.CargarDDL(DDLDepto);
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
                    string idEstado;
                    ciudades.Llenar(id, out descripcion, out idEstado);
                    txtNombreCiudad.Value = descripcion;
                    DDLDepto.SelectedValue = idEstado;
                    CollapseCiudades.Value = "true";
                }
                if (target == "Eliminar")
                {
                    try
                    {
                        Session["ID"] = int.Parse(argument);
                        int id = int.Parse(Session["ID"].ToString());
                        ciudades.Eliminar(id);
                        ciudades.CargarGrid(gvCiudades);
                    }
                    catch 
                    {

                        Response.Write("<script language=javascript>alert('Existen campos dependientes de este estado');</script>");

                    }
                  
                    //gvSala.DataBind();
                }
            }


        }

        protected void gvCiudades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCiudades.PageIndex = e.NewPageIndex;
            ciudades.CargarGrid(gvCiudades);

        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            if(Session["accion"].ToString() == "editar")
            {
                ciudades.actualizar(int.Parse(Session["ID"].ToString()), txtNombreCiudad.Value, DDLDepto.SelectedValue, int.Parse(Session["Usro_Id"].ToString()));
                ciudades.CargarGrid(gvCiudades);
                ciudades.CargarDDL(DDLDepto);
            }
            else
            {
                ciudades.Insert(txtNombreCiudad.Value, DDLDepto.SelectedValue, int.Parse(Session["Usro_Id"].ToString()));
                ciudades.CargarGrid(gvCiudades);
                ciudades.CargarDDL(DDLDepto);
            }
            Session["ID"] = "";
            Session["accion"] = "";
            CollapseCiudades.Value = "false";
            txtNombreCiudad.Value = "";
            DDLDepto.SelectedValue = "0";
        }

    }
}