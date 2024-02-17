using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Estados
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Estd_Id AS ID , Estd_Descripcion AS NOMBRE FROM Gene.tbEstados", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string id, string descripcion, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_InsertarEstado";
            cmd.Parameters.Add(new SqlParameter("@Estd_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Estd_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Estd_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Estd_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Esta_Id AS ID, Esta_Descripcion AS Descripcion FROM Gene.tbEstados WHERE Esta_Estado =1 ORDER BY Esta_Descripcion ");
        }

        public void Llenar(string id, out string estado)
        {
            DataSet ds = util.ObtenerDs("SELECT * FROM Gene.tbEstados WHERE Estd_Id=" + id, "T");
            estado = ds.Tables["T"].Rows[0]["Estd_Descripcion"].ToString();
        }
         
        public void Actualizar(string id, string estado, int usua)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_ActualizarEstado";
            cmd.Parameters.Add(new SqlParameter("Estd_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Estd_Descripcion", estado));
            cmd.Parameters.Add(new SqlParameter("@Estd_Modifica", usua));
            cmd.Parameters.Add(new SqlParameter("@Estd_FechaModificacion", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Estd_Estado", 1));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_EliminarEstado";
            cmd.Parameters.Add(new SqlParameter("Estd_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}