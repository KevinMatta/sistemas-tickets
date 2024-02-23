using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Boletos
    {
        Utilitarios util = new Utilitarios();

        public void Insertar(string codigo, int VtDe_ID ,int Asnt_ID, int creacion )
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_BoletoInsertar";
            cmd.Parameters.Add(new SqlParameter("@Blts_Codigo", codigo));
            cmd.Parameters.Add(new SqlParameter("@VtDe_Id", VtDe_ID));
            cmd.Parameters.Add(new SqlParameter("@Asnt_Id", Asnt_ID));
            cmd.Parameters.Add(new SqlParameter("@Blts_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Blts_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }
    }
}