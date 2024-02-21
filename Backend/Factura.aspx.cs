using FM_Tickets_WebForm.Clases;
using System;
using System.Collections.Generic;
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
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                factura.Personas_CargarDDL(ddlPersonas);
                factura.BuscarFactura(gvFacturas, 0);
                factura.Estados_CargarDDL(ddlEstados);
                factura.Secciones_CargarDDL(ddlSecciones);
            }
        }

        //========================index pages
        protected void gvPersonas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        //=================================dlls
        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            factura.Ciudades_CargarDDL(int.Parse(ddlEstados.SelectedValue), ddlCiudades);
        }

        protected void ddlCiudades_SelectedIndexChanged(object sender, EventArgs e)
        {
            factura.Teatros_CargarDDL(int.Parse(ddlCiudades.SelectedValue), ddlTeatros);
        }

        protected void ddlTeatros_SelectedIndexChanged(object sender, EventArgs e)
        {
            factura.Funciones_CargarDDL(int.Parse(ddlTeatros.SelectedValue), ddlFunciones);
        }

        
        //==========botones
        protected void btnSeleccionar_ServerClick(object sender, EventArgs e)
        {
            int ventaID = encabezado.Insert(int.Parse(ddlPersonas.SelectedValue.ToString()), Session["Usro_Id"].ToString());
            Session["VentaID"] = ventaID;
            factura.BuscarFactura(gvFacturas, 0);
        }

        protected void Agregar_ServerClick(object sender, EventArgs e)
        {
            factura.Insert(int.Parse(nmbCantidad.Value), int.Parse(Session["ventaID"].ToString()), int.Parse(ddlSecciones.SelectedValue.ToString()), int.Parse(ddlFunciones.SelectedValue.ToString()), int.Parse(Session["Usro_Id"].ToString()));
            factura.BuscarFactura(gvFacturas, int.Parse(Session["ventaID"].ToString()));
            nmbCantidad.Value = "0";
            ddlSecciones.SelectedValue = "0";
            ddlFunciones.SelectedValue = "0";
        }
        protected void btnFinalizar_ServerClick(object sender, EventArgs e)
        {
            factura.CargarFacturas(gvFacturaDetalle);
            ddlPersonas.SelectedValue = "0";
        }

        protected void gvFacturaDetalle_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}