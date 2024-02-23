using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Participantes
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.ParticipantesMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string obraID, string rol, string persona, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ParticipanteInsertar";
            cmd.Parameters.Add(new SqlParameter("@Prtp_Rol", rol));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Id", obraID));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", persona));
            cmd.Parameters.Add(new SqlParameter("@Prtp_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Prtp_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Llenar(string id, out string obraID, out string personaID, out string rol)
        {
            DataSet ds = util.ObtenerDs($"Teat.ParticipantesBuscar {id}", "T");
            obraID = ds.Tables["T"].Rows[0]["Obrs_Id"].ToString();
            personaID = ds.Tables["T"].Rows[0]["Prsn_Id"].ToString();
            rol = ds.Tables["T"].Rows[0]["Prtp_Rol"].ToString();
        }

        public void Actualizar(string id, string  rol, string obraID, string personaID,string modifica)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ParticipanteActualizar";
            cmd.Parameters.Add(new SqlParameter("@Prtp_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Prtp_Rol", rol));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Id", obraID));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Prtp_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@@Prtp_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ParticipanteEliminar";
            cmd.Parameters.Add(new SqlParameter("Estd_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}