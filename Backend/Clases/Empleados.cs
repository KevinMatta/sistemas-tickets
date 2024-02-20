using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Empleados
    {
        Utilitarios util = new Utilitarios();
        Personas personas = new Personas();

        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_MostrarEmpleados", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
        public void Insert(string puesto, float salario, int personaID, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_InsertarEmpleado]";
            cmd.Parameters.Add(new SqlParameter("@Empl_Puesto", puesto));
            cmd.Parameters.Add(new SqlParameter("@Empl_Salario", salario));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Empl_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Empl_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void CargarDDL(DropDownList ddl)
        {
            util.CargarDDL(ddl, "Gene.sp_MostrarPersonas");
        }

        public void Llenar(int id, out string puesto, out string salario, out string personaID)
        {
            DataSet ds = util.ObtenerDs($"Teat.sp_BuscarEmpleados '{id}'", "T");
            puesto = ds.Tables["T"].Rows[0]["Empl_Puesto"].ToString();
            salario = ds.Tables["T"].Rows[0]["Empl_Salario"].ToString();
            personaID = ds.Tables["T"].Rows[0]["Prsn_Id"].ToString();
        }

        public void actualizar(int id, string puesto, string salario, string personaID, string modifica)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_ActualizarEmpleado]";
            cmd.Parameters.Add(new SqlParameter("@Empl_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Empl_Puesto", puesto));
            cmd.Parameters.Add(new SqlParameter("@Empl_salario", salario));
            cmd.Parameters.Add(new SqlParameter("@Prsn_Id", personaID));
            cmd.Parameters.Add(new SqlParameter("@Empl_Modifica", modifica));
            cmd.Parameters.Add(new SqlParameter("@Empl_FechaModificacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "[Teat].[sp_EliminarEmpleado]";
            cmd.Parameters.Add(new SqlParameter("@Empl_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}