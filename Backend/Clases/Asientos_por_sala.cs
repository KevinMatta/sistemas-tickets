using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Asientos_por_sala
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT AsSa_Id AS ID , Asnt_Id AS ASIENTO_ID , SaTe_Id AS SALA_TEATRO_ID FROM [Teat].[tbAsientosPorSalas]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(int id_asiento, int sala_teatro, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_InsertarAsientoPorSala]";
            cmd.Parameters.Add(new SqlParameter("@Asnt_Id", id_asiento));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", sala_teatro));
            cmd.Parameters.Add(new SqlParameter("@AsSa_Creacion", usr));
            cmd.Parameters.Add(new SqlParameter("@AsSa_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDLAsientos(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Asnt_Id,Asnt_Descripcion FROM Teat.tbAsientos WHERE Asnt_Estado = 1 ORDER by Asnt_Descripcion");
        }

        public void CargarDDLSalas_Teatro(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT AsSa_Id , SaTe_Id FROM teat.tbAsientosPorSalas WHERE AsSa_Estado = 1 ORDER by SaTe_Id ");
        }

        public void Llenar(int id, out int Asiento_id, out int Sala_Teatro_Id)
        {
            DataSet ds = util.ObtenerDs("SELECT * FROM Teat.tbAsientosPorSalas WHERE AsSa_Id =" + id, "T");
            Asiento_id = (int)ds.Tables["T"].Rows[0]["Asnt_Id"];
            Sala_Teatro_Id = (int)ds.Tables["T"].Rows[0]["SaTe_Id"];
        }

        public void Actualizar(int id, int Asiento_id, int Sala_Teatro_Id, int usr)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_ActualizarAsientoPorSala]";
            cmd.Parameters.Add(new SqlParameter("@AsSa_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Asnt_Id", Asiento_id));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", Sala_Teatro_Id));
            cmd.Parameters.Add(new SqlParameter("@AsSa_Modifica", usr));
            cmd.Parameters.Add(new SqlParameter("@AsSa_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }
        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_EliminarAsientoPorSala]";
            cmd.Parameters.Add(new SqlParameter("@AsSa_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}
