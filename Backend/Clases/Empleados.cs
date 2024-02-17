using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace FM_Tickets_WebForm.Clases
{
    public class Empleados
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid(GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Empl_Id AS ID , Empl_Puesto AS PUESTO , Empl_Salario AS SALARIO FROM [Teat].[tbEmpleados]", "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }
    }
}