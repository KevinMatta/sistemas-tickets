using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Salas_por_teatro
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT [SaTe_Id] AS ID , [Teat_Id] AS TEATRO_ID , [Sala_Id] AS SALA_ID FROM [Teat].[tbSalasPorTeatros]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(int teatro, int sala, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_SalaPorTeatroInsertar]";
            cmd.Parameters.Add(new SqlParameter("@Teat_Id", teatro));
            cmd.Parameters.Add(new SqlParameter("@Sala_Id", sala));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@SaTe_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL1(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Teat_Id , Teat_Descripcion FROM Teat.tbTeatros WHERE Teat_Estado = 1 ORDER BY Teat_Descripcion");

        }

        public void CargarDDL2(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Sala_Id,Sala_Descripcion FROM Teat.tbSalas  WHERE Sala_Estado = 1 Order by Sala_Descripcion");

        }

        public void Llenar(int id, out int teatro_id, out int asiento_id)
        {
            DataSet ds = util.ObtenerDs("SELECT*FROM Teat.tbSalasPorTeatros Where SaTe_Id =  " + id, "T");
            teatro_id = (int)ds.Tables["T"].Rows[0]["Sala_Id"];
            asiento_id = (int)ds.Tables["T"].Rows[0]["Teat_Id"];
        }
        public void actualizar(int id, int teatro_id, int sala_id, int modifica)
        {
            /*  @AsSa_Id INT,
             @Asnt_Id INT,
             @SaTe_Id INT,
             @AsSa_Modifica INT,
             @AsSa_FechaModificacion DATETIME*/
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_SalaPorTeatroActualizar]";
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Teat_Id", teatro_id));
            cmd.Parameters.Add(new SqlParameter("@Sala_Id", sala_id));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@SaTe_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_SalaPorTeatroEliminar]";
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}
