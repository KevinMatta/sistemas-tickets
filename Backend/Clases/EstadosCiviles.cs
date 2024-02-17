using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class EstadosCiviles
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT EsCi_Id AS ID , EsCi_Descripcion AS NOMBRE  FROM Gene.tbEstadosCiviles", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}