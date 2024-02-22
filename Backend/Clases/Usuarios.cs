using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Usuarios
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Acce.sp_UsuariosMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string usuario, string clave, int personaID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Acce].[sp_UsuarioInsertar]";
            cmd.Parameters.Add(new SqlParameter("@Usro_Usuario", usuario));
            cmd.Parameters.Add(new SqlParameter("@Usro_Clave", clave));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Usro_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Usro_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "Teat.sp_EmpleadosDdl");
        }

        public void Llenar(string id, out string usuario, out string clave, out string personaID)
        {
            DataSet ds = util.ObtenerDs($"Acce.sp_UsuarioBuscar '{id}'", "T");
            usuario = ds.Tables["T"].Rows[0]["USUARIO"].ToString();
            clave = ds.Tables["T"].Rows[0]["CLAVE"].ToString();
            personaID = ds.Tables["T"].Rows[0]["NOMBRE_ID"].ToString();
        }


        public void Actualizar(int id, string usuario, string clave, int personaID, int modifica)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Acce].[sp_UsuarioActualizar]";
            cmd.Parameters.Add(new SqlParameter("@Usro_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Usro_Usuario", usuario));
            cmd.Parameters.Add(new SqlParameter("@Usro_Clave", clave));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Usro_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@Usro_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Acce].[sp_UsuarioEliminar]";
            cmd.Parameters.Add(new SqlParameter("@Usro_Id", id));
            util.EjecutarSP(cmd);
        }


    }
}