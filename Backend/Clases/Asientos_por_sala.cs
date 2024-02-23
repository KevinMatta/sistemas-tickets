using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Asientos_por_sala
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT AsSa_Id AS ID , Asnt_Id AS ASIENTO_ID , SaTe_Id AS SALA_TEATRO_ID FROM [Teat].[tbAsientosPorSalas]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void CargarAsientosDDL(DropDownList ddl, int seccion, int funcion)
        {
            util.CargarDDL(ddl, $"Teat.tbAsientosList '{seccion}', '{funcion}'");
        }

    }
}
