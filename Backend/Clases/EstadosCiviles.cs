using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class EstadosCiviles
    {
        Utilitarios util = new Utilitarios();

        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Gene.sp_EstadosCivilesMostrar", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "Gene.sp_EstadoCivilDdl");
        }
        public void Insert(string descripcion, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_EstadoCivilInsertar";
            cmd.Parameters.Add(new SqlParameter("@EsCi_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@EsCi_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@EsCi_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Llenar(int id, out string descripcion)
        {
            DataSet ds = util.ObtenerDs($"Gene.sp_EstadoCivilBuscar {id}", "T");
            descripcion = ds.Tables["T"].Rows[0]["EsCi_Descripcion"].ToString();
        }

        public void Actualizar(int id, string descripcion, int modifica)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_EstadoCivilActualizar";
            cmd.Parameters.Add(new SqlParameter("@EsCi_Id", id));
            cmd.Parameters.Add(new SqlParameter("@EsCi_Descripcion", descripcion));
            cmd.Parameters.Add(new SqlParameter("@EsCi_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@EsCi_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Gene.sp_EstadoCivilEliminar";
            cmd.Parameters.Add(new SqlParameter("@EsCi_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}