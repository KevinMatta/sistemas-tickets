using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Salas
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Sala_Id AS ID , Sala_Descripcion AS NOMBRE , Fncs_Id AS FUNCION_ID FROM [Teat].[tbSalas]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string descripcion, int funcion, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_InsertarSala]";
            cmd.Parameters.Add(new SqlParameter("@Sala_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Id", funcion));
            cmd.Parameters.Add(new SqlParameter("@Sala_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Sala_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Fncs_Id,Fncs_Fecha FROM Teat.tbFunciones WHERE Fncs_Estado = 1 ORDER BY Fncs_Fecha");
        }

        public void Llenar(int id, out string descripcion, out int Funcion)
        {
            DataSet ds = util.ObtenerDs("SELECT*FROM Teat.tbSalas  WHERE [Sala_Id] = " + id, "T");
            descripcion = ds.Tables["T"].Rows[0]["Sala_Descripcion"].ToString();
            Funcion = (int)ds.Tables["T"].Rows[0]["Fncs_Id"];
        }
        

        public void actualizar(int id, string descripcion,  int funcion_id, int modifica)
        {
            /*  @Prsn_Id INT,
          @Prsn_Nombre VARCHAR(20),
          @Prsn_Apellido VARCHAR(20),
          @Prsn_Sexo CHAR(1),
          @Prsn_FechaNacimiento DATE,
          @EsCi_Id INT,
          @Prsn_Modifica INT,
          @Prsn_FechaModificacion DATETIME,
          @Prsn_Estado BIT*/
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_ActualizarSala]";
            cmd.Parameters.Add(new SqlParameter("@Sala_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Sala_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Fncs_Id", funcion_id));
            cmd.Parameters.Add(new SqlParameter("@Sala_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@Sala_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_EliminarSala]";
            cmd.Parameters.Add(new SqlParameter("@Sala_Id", id));
            util.EjecutarSP(cmd);
        }
    }

}
