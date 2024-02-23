using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Ventas_Detalle
    {
        Utilitarios util = new Utilitarios();

        public void CargarPersonas(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Gene.sp_PersonasMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_VentaDetalleEliminar]";
            cmd.Parameters.Add(new SqlParameter("@VtDe_Id", id));
            util.EjecutarSP(cmd);
        }

        public void CargarEncabezados(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_VentasEncabezadoMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(int cantidad, int ventaID, int seccionID, int funcionID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_VentaDetalleInsertar";
            cmd.Parameters.Add(new SqlParameter("VtDe_Cantidad", cantidad));
            cmd.Parameters.Add(new SqlParameter("Vnts_Id", ventaID));
            cmd.Parameters.Add(new SqlParameter("@Secc_Id", seccionID));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Id", funcionID));
            cmd.Parameters.Add(new SqlParameter("@VtDe_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@VtDe_FechaCreacion", DateTime.Now));

            util.EjecutarSP(cmd);
        }

        public void CargarFacturas(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_FacturasMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void BuscarFactura(GridView gv, int facturaID)
        {
            DataSet ds = util.ObtenerDs($"Teat.sp_FacturaBuscar '{facturaID}'", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Teatros_CargarDDL(int idCiudad, DropDownList ddlTeatros)
        {
            util.CargarDDL(ddlTeatros, $"Teat.sp_TeatrosDdl '{idCiudad}'");

        }

        public void Funciones_CargarDDL(int idTeatro, DropDownList ddlFunciones)
        {
            util.CargarDDL(ddlFunciones, $"Teat.sp_FuncionesDdl '{idTeatro}'");

        }

        public void Secciones_CargarDDL(DropDownList ddlSecciones)
        {
            util.CargarDDL(ddlSecciones, "Teat.sp_SeccionesDdl");

        }
        public void Personas_CargarDDL(DropDownList ddlPersonas)
        {
            util.CargarDDL(ddlPersonas, "Gene.sp_PersonasMostrar");

        }

        
    }
}