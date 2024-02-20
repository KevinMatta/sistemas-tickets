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
            DataSet ds = util.ObtenerDs("Gene.sp_MostrarCiudades", "T");
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
            util.CargarDDL(ddl, "Gene.sp_MostrarEstados");
        }

        public void Llenar(int id, out string descripcion, out string id_est)
        {
            DataSet ds = util.ObtenerDs($"Gene.sp_BuscarCiudad '{id}'", "T");
            descripcion = ds.Tables["T"].Rows[0]["Ciud_Descripcion"].ToString();
            id_est = ds.Tables["T"].Rows[0]["Estd_Id"].ToString();
        }


        public void actualizar(int id, string descripcion, string estado_id, int modifica)
        {
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