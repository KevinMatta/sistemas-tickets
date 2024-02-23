using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Venta_Encabezado
    {
        Utilitarios util = new Utilitarios();

        public void CargarEncabezados(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_VentasEncabezadoMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public int Insert(int personaID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_VentaEncabezadoInsertar";
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Vnts_Fecha", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Vnts_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Vnts_FechaCreacion", DateTime.Now));

            SqlParameter outputParameter = new SqlParameter("@id", SqlDbType.Int);
            outputParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(outputParameter);

            util.EjecutarSP(cmd);

            int id = Convert.ToInt32(cmd.Parameters["@id"].Value);
            return id;
        }


        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_VentaEncabezadoEliminar]";
            cmd.Parameters.Add(new SqlParameter("Vnts_Id", id));
            util.EjecutarSP(cmd);
        }


    }
}