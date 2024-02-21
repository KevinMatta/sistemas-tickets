using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Factura
    {
        Utilitarios util = new Utilitarios();


        public void CargarPersonas(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Gene.sp_MostrarPersonas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void CargarFacturas(GridView gv)
        {
            DataSet ds = util.ObtenerDs("Teat.sp_MostrarFacturas", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

    }
}