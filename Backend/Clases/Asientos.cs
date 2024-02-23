using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Asientos
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Asnt_Id AS ID , Asnt_Descripcion AS NOMBRE , Secc_Id AS SECCION FROM Teat.tbAsientos", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
        public void Insert(string descripcion, int Secc_id, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_InsertarAsiento]";
            cmd.Parameters.Add(new SqlParameter("@Asnt_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Secc_Id", Secc_id));
            cmd.Parameters.Add(new SqlParameter("@Asnt_Creacion", usr));
            cmd.Parameters.Add(new SqlParameter("@Asnt_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "select Secc_Id,Secc_Descripcion from teat.tbSecciones where Secc_Estado = 1 order by Secc_Descripcion");
        }

        public void Llenar(int id, out string decripcion, out int id_seccion)
        {
            DataSet ds = util.ObtenerDs("SELECT*FROM Teat.tbAsientos WHERE Asnt_Id =" + id, "T");
            decripcion = ds.Tables["T"].Rows[0]["Asnt_Descripcion"].ToString();
            id_seccion = (int)ds.Tables["T"].Rows[0]["Secc_Id"];
        }

        public void Actualizar(int id, string descripcion, int seccion_id, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_ActualizarAsiento]";
            cmd.Parameters.Add(new SqlParameter("@Asnt_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Asnt_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Secc_Id", seccion_id));
            cmd.Parameters.Add(new SqlParameter("@Asnt_Modifica", usr));
            cmd.Parameters.Add(new SqlParameter("@Asnt_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }
        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_EliminarAsiento]";
            cmd.Parameters.Add(new SqlParameter("@Asnt_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}
