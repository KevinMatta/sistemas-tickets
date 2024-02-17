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
            DataSet ds = util.ObtenerDs("SELECT Fncs_Id AS ID , Fncs_Fecha AS FECHA ,Obrs_Id AS OBRA_ID FROM [Teat].[tbFunciones]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string fecha, int id, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_InsertarFuncion";
            cmd.Parameters.Add(new SqlParameter("@Fncs_Fecha", fecha));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Fncs_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Obrs_Id AS ID, Obrs_Descripcion AS Descripcion FROM Teat.tbObras WHERE Obrs_Estado =1 ORDER BY Obrs_Descripcion");
        }

        public void Llenar(string id, out string fecha, out string obra)
        {
            DataSet ds = util.ObtenerDs("SELECT * FROM Teat.tbFunciones WHERE Fncs_Id=" + id, "T");
            fecha = ds.Tables["T"].Rows[0]["Fncs_Fecha"].ToString();
            obra = ds.Tables["T"].Rows[0]["Obrs_Id"].ToString();
        }

        public void Actualizar(string id, string fecha, string obra, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ActualizarFuncion";
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
            cmd.CommandText = "Teat.sp_EliminarFuncion";
            cmd.Parameters.Add(new SqlParameter("Fncs_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}