using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Ciudades
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT  Ciud_Descripcion AS CIUDAD , Estd_Id AS ESTADO_ID FROM Gene.tbCiudades", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}