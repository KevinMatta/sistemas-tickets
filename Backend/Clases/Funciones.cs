using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Funciones
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("[Teat].[sp_FuncionMostrar]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string fecha, int id, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_FuncionInsertar";
            cmd.Parameters.Add(new SqlParameter("@Fncs_Fecha", fecha));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Fncs_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "[Teat].[sp_ObrasDdl]");
        }

        public void Llenar(string id, out string fecha, out string obra)
        {
            DataSet ds = util.ObtenerDs($"[Teat].[sp_FuncionBuscar] '{id}'", "T");
            fecha = ds.Tables["T"].Rows[0]["Fncs_Fecha"].ToString();
            obra = ds.Tables["T"].Rows[0]["Obrs_Id"].ToString();
        }

        public void Actualizar(string id, string fecha, string obra, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_FuncionActualizar";
            cmd.Parameters.Add(new SqlParameter("@Fncs_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Fecha", fecha));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Id", obra));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Modifica", usr));
            cmd.Parameters.Add(new SqlParameter("@Fncs_FechaModificacion", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Estado", 1));
            util.EjecutarSP(cmd);
        }
        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_FuncionEliminar";
            cmd.Parameters.Add(new SqlParameter("Fncs_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}