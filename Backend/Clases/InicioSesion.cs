using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics.Contracts;
namespace FM_Tickets_WebForm.Clases
{
    public class InicioSesion
    {
        Utilitarios utilitarios = new Utilitarios();
        public string Iniciar(string usuario, string contra)
        {
            string resul = "";
            DataSet ds = new DataSet();
            ds = utilitarios.ObtenerDs($"[Acce].[sp_UsuarioObtenerNombre] '{usuario}','{contra}'", "T");
            if (ds.Tables["T"].Rows.Count > 0)
            {
                resul = ds.Tables["T"].Rows[0]["NOMBRE"].ToString();
                HttpContext.Current.Session["Usro_Id"] = ds.Tables["T"].Rows[0]["Usro_Id"].ToString();
            }
            return resul;
        }
    }
}