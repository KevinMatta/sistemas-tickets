using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Ciudades
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Ciud_Id AS ID , Ciud_Descripcion AS CIUDAD, Estd_Id  AS ESTADO_ID FROM Gene.tbCiudades ", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string ciudad, string estado, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_InsertarCiudad]";
            cmd.Parameters.Add(new SqlParameter("@Ciud_Descripcion", ciudad));
            cmd.Parameters.Add(new SqlParameter("@Estd_Id", estado));
            cmd.Parameters.Add(new SqlParameter("@Ciud_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Ciud_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT Estd_Id,Estd_Descripcion FROM gene.tbEstados WHERE Estd_Estado = 1 ORDER BY Estd_Descripcion");
        }

        public void Llenar(int id, out string descripcion, out string id_est)
        {
            DataSet ds = util.ObtenerDs("SELECT*FROM Gene.tbCiudades  WHERE Ciud_Id = " + id, "T");
            descripcion = ds.Tables["T"].Rows[0]["Ciud_Descripcion"].ToString();
            id_est = ds.Tables["T"].Rows[0]["Estd_Id"].ToString();
        }


        public void actualizar(int id, string descripcion, string estado_id, int modifica)
        {
            /*@Ciud_Id VARCHAR(4),
             @Ciud_Descripcion VARCHAR(20),
             @Estd_Id VARCHAR(2),
             @Ciud_Modifica INT,
             @Ciud_FechaModificacion DATETIME*/
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_ActualizarCiudad]";
            cmd.Parameters.Add(new SqlParameter("@Ciud_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Ciud_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Estd_Id", estado_id));
            cmd.Parameters.Add(new SqlParameter("@Ciud_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@Ciud_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_EliminarCiudad]";
            cmd.Parameters.Add(new SqlParameter("@Ciud_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}