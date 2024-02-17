using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Salas_por_teatro
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT [SaTe_Id] AS ID , [Teat_Id] AS TEATRO_ID , [Sala_Id] AS SALA_ID FROM [Teat].[tbSalasPorTeatros]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}