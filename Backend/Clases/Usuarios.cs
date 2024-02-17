using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Usuarios
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Usro_Id AS ID , Usro_Rol AS ROL , Usro_Clave AS CLAVE , Prsn_Id AS PERSONA_ID  FROM Acce.tbUsuarios", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}