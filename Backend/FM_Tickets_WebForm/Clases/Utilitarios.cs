using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

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
    }
}