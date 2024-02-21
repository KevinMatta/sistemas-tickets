using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Personas
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Gene.sp_MostrarPersonas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
        public int Insert(string nombre, string apellido, string sexo, string fecha, int creacion, int est)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_InsertarPersona]";
            cmd.Parameters.Add(new SqlParameter("@Prsn_Nombre", nombre));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Apellido", apellido));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Sexo", sexo));
            cmd.Parameters.Add(new SqlParameter("@Prsn_FechaNacimiento", fecha));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@EsCi_Id", est));
            cmd.Parameters.Add(new SqlParameter("@Prsn_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);

            int personaID = Convert.ToInt32(cmd.ExecuteScalar());

            return personaID;
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "Gene.sp_MostrarEstadosCiviles");
        }

        public void Llenar(int id, out string nombre, out string apellido, out string sexo, out string fecha, out int estado)
        {
            DataSet ds = util.ObtenerDs($"Gene.sp_BuscarPersona '{id}'", "T");
            nombre = ds.Tables["T"].Rows[0]["Prsn_Nombre"].ToString();
            apellido = ds.Tables["T"].Rows[0]["Prsn_Apellido"].ToString();
            sexo = ds.Tables["T"].Rows[0]["Prsn_Sexo"].ToString();
            fecha = ds.Tables["T"].Rows[0]["Prsn_FechaNacimiento"].ToString();
            estado = (int)ds.Tables["T"].Rows[0]["EsCi_Id"];
        }

        public void actualizar(int id,string nombre, string apellido, string sexo ,string fecha ,int estado, int modifica  )
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_ActualizarPersona]";
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Nombre", nombre));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Apellido", apellido));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Sexo", sexo));
            cmd.Parameters.Add(new SqlParameter("@Prsn_FechaNacimiento", fecha));
            cmd.Parameters.Add(new SqlParameter("@EsCi_Id", estado));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@Prsn_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Gene].[sp_EliminarPersona]";
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}
