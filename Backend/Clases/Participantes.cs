using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Participantes
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Prtp_Id AS ID , Prtp_Rol AS ROL , Obrs_Id AS OBRA , Prsn_Id AS PERSONA_ID FROM [Teat].[tbParticipantes]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}