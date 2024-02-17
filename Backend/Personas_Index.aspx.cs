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
            personas.CargarGrid(gvPersonas);
            if (!IsPostBack)
            {
                personas.CargarDDL(ddlEstadoCiviles);
            }

        }

        protected void gvPersonas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvPersonas.PageIndex = e.NewPageIndex;
            personas.CargarGrid(gvPersonas);
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            int usr = int.Parse(Session["Usro_Id"].ToString());
            int Id_Estado = 0;
            if (ddlEstadoCiviles.SelectedValue == "S")
            {
                Id_Estado = 1;
            }
             personas.Insert(txtNombre.Value,txtApellido.Value,txtSexo.Value, txtFechaN.Value,usr,Id_Estado  );
            personas.CargarGrid(gvPersonas);

        }

    }
}