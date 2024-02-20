using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FM_Tickets_WebForm.Clases;
namespace FM_Tickets_WebForm
{
    public partial class Formulario_web18 : System.Web.UI.Page
    {
       Clases.Empleados Empleados = new Clases.Empleados();
        protected void Page_Load(object sender, EventArgs e)
        {
            Empleados.CargarGrid(gvEmpleados);
        }

        protected void gvEmpleados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gvEmpleados.PageIndex = e.NewPageIndex;
            Empleados.CargarGrid(gvEmpleados);
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
                string nombre = txtNombre.Value;
                string apellido = txtApellido.Value;
                string sexo = "";
                sexo = rbFemenino.Checked ? "F" : "M";
                string fechaNacimiento = dateNacimiento.Value;
                int idEstadoCivil = int.Parse(ddlEstadosCiviles.SelectedValue);
                decimal salario = decimal.Parse(txtsalario.Value);
                string puesto = txtPuesto.Value;

                Personas personas = new Personas();
                int personaID = personas.Insert(nombre, apellido, sexo, fechaNacimiento, int.Parse(Session["Usro_Id"].ToString()), idEstadoCivil);

                Empleados empleados = new Empleados();
                empleados.Insert(txtsalario.Value, float.Parse(txtsalario.Value), personaID, int.Parse(Session["Usro_Id"].ToString()));

                Empleados.CargarGrid(gvEmpleados);
        }
    }
}