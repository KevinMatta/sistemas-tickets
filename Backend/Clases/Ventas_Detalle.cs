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
            DataSet ds = util.ObtenerDs("Gene.sp_MostrarPersonas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(int cantidad, int ventaID, int seccionID, int funcionID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.spInsertarVentaDetalle";
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
            DataSet ds = util.ObtenerDs("Teat.sp_MostrarFacturas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void BuscarFactura(GridView gv, int facturaID)
        {
            DataSet ds = util.ObtenerDs($"Teat.sp_BuscarFactura '{facturaID}'", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Estados_CargarDDL(DropDownList ddlEstados)
        {
            util.CargarDDL(ddlEstados, "Gene.sp_MostrarEstados");

        }

        public void Ciudades_CargarDDL(int idEstado, DropDownList ddlCiudades)
        {
            util.CargarDDL(ddlCiudades, $"Gene.sp_ddlCiudades '{idEstado}'");

        }

        public void Teatros_CargarDDL(int idCiudad, DropDownList ddlTeatros)
        {
            util.CargarDDL(ddlTeatros, $"Teat.sp_ddlTeatros '{idCiudad}'");

        }

        public void Funciones_CargarDDL(int idTeatro, DropDownList ddlFunciones)
        {
            util.CargarDDL(ddlFunciones, $"Teat.sp_ddlFunciones '{idTeatro}'");

        }

        public void Secciones_CargarDDL(DropDownList ddlSecciones)
        {
            util.CargarDDL(ddlSecciones, "Teat.sp_ddlSecciones");

        }
        public void Personas_CargarDDL(DropDownList ddlEstados)
        {
            util.CargarDDL(ddlEstados, "Gene.sp_MostrarPersonas");

        }

        
    }
}