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
            DataSet ds = util.ObtenerDs("SELECT [Teat_Id] AS ID ,[Teat_Descripcion] AS NOMBRE ,  [Ciud_Id] AS CIUDAD_ID  FROM [Teat].[tbTeatros]", "T");
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

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Ciud_Id AS ID, Ciud_Descripcion AS Descripcion FROM Gene.tbCiudades WHERE Ciud_Estado =1 ORDER BY Ciud_Descripcion ");
        }

        public void Llenar(int id, out string estado, out string ciudad)
        {
            DataSet ds = util.ObtenerDs("SELECT * FROM Teat.tbTeatros WHERE Teat_Id=" + id, "T");
            estado = ds.Tables["T"].Rows[0]["Teat_Descripcion"].ToString();
            ciudad  = ds.Tables["T"].Rows[0]["Ciud_Id"].ToString();
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