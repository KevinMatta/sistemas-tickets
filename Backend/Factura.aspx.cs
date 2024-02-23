using FM_Tickets_WebForm.Clases;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm
{
    public partial class Factura : System.Web.UI.Page
    {
        Ventas_Detalle factura = new Ventas_Detalle();
        Venta_Encabezado encabezado = new Venta_Encabezado();
        Asientos_por_sala assa = new Asientos_por_sala();
        Personas personas = new Personas();
        EstadosCiviles ec = new EstadosCiviles();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                factura.Personas_CargarDDL(ddlPersonas);
                factura.BuscarFactura(gvFacturas, 0);
                factura.Secciones_CargarDDL(ddlSecciones);
                factura.Teatros_CargarDDL(int.Parse(Session["Ciud_Id"].ToString()), ddlTeatros);
                ec.CargarDDL(ddlEstadoCiviles);

            }
            else
            {
                string target = Request["__EVENTTARGET"];
                string argument = Request["__EVENTARGUMENT"];
                if (target == "Eliminar")
                {
                    int id = int.Parse(argument);
                    Session["ID"] = id;
                    factura.Eliminar(id);
                    factura.BuscarFactura(gvFacturaDetalle, int.Parse(Session["VentaID"].ToString()));

                }
            }
        }
        //========================index pages

        protected void gvFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFacturas.PageIndex = e.NewPageIndex;
            encabezado.CargarEncabezados(gvFacturas);
        }

        protected void gvFacturaDetalle_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFacturaDetalle.PageIndex = e.NewPageIndex;
            factura.CargarFacturas(gvFacturaDetalle);
        }
        //=================================dlls

        protected void ddlTeatros_SelectedIndexChanged(object sender, EventArgs e)
        {
            factura.Funciones_CargarDDL(int.Parse(ddlTeatros.SelectedValue), ddlFunciones);
                try
                {
                    assa.CargarAsientosDDL(ddlAsientos, int.Parse(ddlSecciones.SelectedValue), int.Parse(ddlFunciones.SelectedValue));
                }
                catch
                {
                    return;
                }
        }

        protected void ddlPersonas_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCliente.Value = ddlPersonas.SelectedValue;
        }

        protected void ddlSecciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                assa.CargarAsientosDDL(ddlAsientos, int.Parse(ddlSecciones.SelectedValue), int.Parse(ddlFunciones.SelectedValue));
            }
            catch
            {
                return;
            }
        }

        //==========botones

        protected void Agregar_ServerClick(object sender, EventArgs e)
        {
            if (ddlPersonas.SelectedValue == "0" || ddlSecciones.SelectedValue == "0" || ddlFunciones.SelectedValue == "0" || ddlAsientos.SelectedIndex == -1)
            {
                string script = @"
                                iziToast.warning({
                                    title: 'Error',
                                    message: 'Debe Completar todos los campos',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
                return; 
            }
            int ventaID;

            if (string.IsNullOrEmpty(Session["VentaID"]?.ToString()))
            {
                string idPersona;
                idPersona = personas.Buscar(ddlPersonas.SelectedItem.Text);
                ventaID = encabezado.Insert(int.Parse(idPersona), int.Parse(Session["Usro_Id"].ToString()));
                Session["VentaID"] = ventaID;
            }
            else
            {
                ventaID = int.Parse(Session["VentaID"].ToString());
            }


            try
            {
                factura.Insert(1, ventaID, int.Parse(ddlSecciones.SelectedValue.ToString()), int.Parse(ddlFunciones.SelectedValue.ToString()), int.Parse(Session["Usro_Id"].ToString()));
                factura.BuscarFactura(gvFacturaDetalle, ventaID);

                string script = @"
                                iziToast.success({
                                    title: 'Completado',
                                    message: 'Se ha agregado el registro',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
                pnlFacturaDetalle.Visible = true;

                ddlAsientos.ClearSelection();
                ddlFunciones.ClearSelection();
                ddlSecciones.ClearSelection();

            }
            catch
            {
                string script = @"
                                iziToast.error({
                                    title: 'Fallido',
                                    message: 'No se pudo completar el registro',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
            }
        }
        protected void btnFinalizar_ServerClick(object sender, EventArgs e)
        {
            Session["VentaID"] = null;
            encabezado.CargarEncabezados(gvFacturas);
            ddlPersonas.ClearSelection();
            txtApellido.Value = "";
            ddlTeatros.ClearSelection();
            ddlFunciones.ClearSelection();
            ddlSecciones.ClearSelection();
            ddlAsientos.ClearSelection();
            pnlFacturaDetalle.Visible = false;
            pnlFacturaEncabezado.Visible = true;
        }
        protected void btnGuardarPersona_ServerClick(object sender, EventArgs e)
        {
            string sexo = radMasculino.Checked ? "M" : "F";
            if (string.IsNullOrEmpty(txtId.Value) || string.IsNullOrEmpty(txtNombre.Value)  || string.IsNullOrEmpty(txtApellido.Value) || ddlEstadoCiviles.SelectedValue == "0" || string.IsNullOrEmpty(txtFechaN.Value))
            {
                string script = @"
                                iziToast.warning({
                                    title: 'Error',
                                    message: 'Debe Completar todos los campos',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", script, true);
                return;
            }
            try
            {
                personas.Insert(txtNombre.Value, txtApellido.Value, sexo, txtFechaN.Value, int.Parse(Session["Usro_ID"].ToString()), int.Parse(ddlEstadoCiviles.SelectedValue));

                string scrpt = @"
                                iziToast.succes({
                                    title: 'Completado',
                                    message: 'Se ha agregado el registro',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", scrpt, true);
                pnlFacturaEncabezado.Visible = false;
                pnlFacturaDetalle.Visible = true;
            }
            catch
            {
                string scrpt = @"
                                iziToast.error({
                                    title: 'Fallido',
                                    message: 'No se pudo completar el registro',
                                });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScript", scrpt, true);
            }
        }
    }
}