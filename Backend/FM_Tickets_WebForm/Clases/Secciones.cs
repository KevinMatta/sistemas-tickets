using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Secciones
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid (GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Secc_Id as ID , Secc_Descripcion as SECCION FROM  Teat.tbSecciones" , "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();

        }
    }
}