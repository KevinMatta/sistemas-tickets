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
            DataSet ds = util.ObtenerDs("SELECT Prsn_Id AS ID , Prsn_Nombre AS NOMBRE , Prsn_Apellido AS APELLIDO , Prsn_FechaNacimiento AS FECHA_NACIMIENTO , Prsn_Sexo AS SEXO ,EsCi_Id AS ESTADO_ID FROM Gene.tbPersonas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
        public void Insert(string nombre , string apellido ,string sexo , string fecha, int creacion , int est)
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
        }
         
        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "SELECT EsCi_Id, EsCi_Descripcion FROM Gene.tbEstadosCiviles WHERE EsCi_Estado = 1 ORDER BY EsCi_Descripcion ");
        }
    }
}