using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Salas
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Sala_Id AS ID , Sala_Descripcion AS NOMBRE , Fncs_Id AS FUNCION_ID FROM [Teat].[tbSalas]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }

}