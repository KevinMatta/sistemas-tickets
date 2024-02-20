using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Obras
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_MostrarObras", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insertar(string descrip, int usua)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_InsertarObra";
            cmd.Parameters.Add(new SqlParameter("Obrs_Descripcion", descrip));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Creacion", usua));
            cmd.Parameters.Add(new SqlParameter("@Obrs_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }
        public void Llenar(int id, out string nombre)
        {
            DataSet ds = util.ObtenerDs($"Teat.sp_BuscarObra '{id}'", "T");
            nombre = ds.Tables["T"].Rows[0]["Obrs_Descripcion"].ToString();
        }

        public void Actualizar(int id, string nombre, int usua)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ActualizarObra";
            cmd.Parameters.Add(new SqlParameter("Obrs_Id", id));
            cmd.Parameters.Add(new SqlParameter("Obrs_Descripcion", nombre));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Modifica", usua));
            cmd.Parameters.Add(new SqlParameter("@Obrs_FechaModificacion", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Obrs_Estado", 1));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_EliminarObra";
            cmd.Parameters.Add(new SqlParameter("Obrs_Id", id));
            util.EjecutarSP(cmd);
        }

    }
}