using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Utilitarios
    {
        CnxBaseDatos cnx = new CnxBaseDatos();
        SqlConnection con = new SqlConnection();

        public DataSet ObtenerDs(string sql , string tabla)
        {
            con = cnx.ObtenerCnx();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            da.Fill(ds,tabla);
            con.Close();

            return ds; 
        }

        public void CargarDDL(DropDownList ddl, string sql)
        {
            DataSet ds = ObtenerDs(sql, "T");
            ddl.DataValueField = ds.Tables["T"].Columns[0].ColumnName;
            ddl.DataTextField  = ds.Tables["T"].Columns[1].ColumnName;
            ddl.DataSource = ds.Tables["T"];
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Seleccione una opcion", "0"));
        }

        public void EjecutarSP (SqlCommand cmd)
        {
            con = cnx.ObtenerCnx();
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}