using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Teatros
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_MostrarTeatros", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string descripcion, string ciudID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_InsertarTeatro";
            cmd.Parameters.Add(new SqlParameter("Teat_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Ciud_Id", ciudID));
            cmd.Parameters.Add(new SqlParameter("@Teat_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Teat_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddlEstados)
        {
            util.CargarDDL(ddlEstados, "DB_Tickets.Gene.sp_MostrarEstados");

        }

        public void Ciudades_CargarDDL(int idEstado, DropDownList ddlCiudades)
        {
            util.CargarDDL(ddlCiudades, $"DB_Tickets.Gene.sp_ddlCiudades '{idEstado}'");

        }

        public void Llenar(int id, out string teatro, out string ciudad, out string estado)
        {
            DataSet ds = util.ObtenerDs($"Teat.BuscarTeatro '{id}'", "T");
            teatro = ds.Tables["T"].Rows[0]["Teat_Descripcion"].ToString();
            ciudad  = ds.Tables["T"].Rows[0]["Ciud_Id"].ToString();
            estado = ds.Tables["T"].Rows[0]["Estd_Id"].ToString();
        }

        public void Actualizar(int id, string estado, int ciudad, int usua)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ActualizarTeatro";
            cmd.Parameters.Add(new SqlParameter("@Teat_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Teat_Descripcion", estado));
            cmd.Parameters.Add(new SqlParameter("@Ciud_Id", ciudad));
            cmd.Parameters.Add(new SqlParameter("@Teat_Modifica", usua));
            cmd.Parameters.Add(new SqlParameter("@Teat_FechaModificacion", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Teat_Estado", 1));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_EliminarTeatro";
            cmd.Parameters.Add(new SqlParameter("Teat_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}