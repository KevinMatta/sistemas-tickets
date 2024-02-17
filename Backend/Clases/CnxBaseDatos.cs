using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace FM_Tickets_WebForm.Clases
{
	public class CnxBaseDatos
	{
		string con = "";
		SqlConnection cnx = new SqlConnection();

		public SqlConnection ObtenerCnx()
        {
			//laptop Laptop-Kevin\SQLEXPRESS
			//lab    DESKTOP-6C3UF0A\SQLEXPRESS
			con = @"data source = DESKTOP-6C3UF0A\SQLEXPRESS; initial catalog = DB_Tickets; user id = ADMIN123; password = Admin123;";
			cnx.ConnectionString = con;
			return cnx;
        }
	}
}