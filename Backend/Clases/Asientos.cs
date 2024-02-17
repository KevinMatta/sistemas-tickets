using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Asientos
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Asnt_Id AS ID , Asnt_Descripcion AS NOMBRE , Secc_Id AS SECCION FROM Teat.tbAsientos", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}