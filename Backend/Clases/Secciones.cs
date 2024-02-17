using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace FM_Tickets_WebForm.Clases
{


    public class Secciones
    {
        Utilitarios util = new Utilitarios();
        public void CargarGrid (GridView gv)
        {
            DataSet ds = util.ObtenerDs("SELECT Secc_Id as ID , Secc_Descripcion as SECCION FROM  Teat.tbSecciones" , "T");
            gv.DataSource = ds.Tables["T"];
            gv.DataBind();
        }

        public void Insert(string descripcion, double precio, string sate, int creacion)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_InsertarSeccion";
            cmd.Parameters.Add(new SqlParameter("@Secc_Descripcion ", descripcion));
            cmd.Parameters.Add(new SqlParameter("@Secc_Precio", precio));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", sate));
            cmd.Parameters.Add(new SqlParameter("@Secc_Creacion", creacion));
            cmd.Parameters.Add(new SqlParameter("@Secc_FechaCreacion", DateTime.Now));
            util.EjecutarSP(cmd);
        }

        public void Llenar(string id, out string estado, out string precio, out string sate)
        {
            DataSet ds = util.ObtenerDs("SELECT * FROM Teat.tbSecciones WHERE Secc_Id=" + id, "T");
            estado = ds.Tables["T"].Rows[0]["Secc_Descripcion"].ToString();
            precio = ds.Tables["T"].Rows[0]["Secc_Precio"].ToString();
            sate = ds.Tables["T"].Rows[0]["SaTe_Id"].ToString();
        }

        public void Actualizar(string id, string estado, string precio, string sate, int usua)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_ActualizarSeccion";
            cmd.Parameters.Add(new SqlParameter("@Secc_Id", id));
            cmd.Parameters.Add(new SqlParameter("@Secc_Descripcion", estado));
            cmd.Parameters.Add(new SqlParameter("@Secc_Precio", precio));
            cmd.Parameters.Add(new SqlParameter("@SaTe_Id", sate));
            cmd.Parameters.Add(new SqlParameter("@Secc_Modifica", usua));
            cmd.Parameters.Add(new SqlParameter("@Secc_FechaModificacion", DateTime.Now));
            cmd.Parameters.Add(new SqlParameter("@Secc_Estado", 1));
            util.EjecutarSP(cmd);
        }

        public void Eliminar(int id)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Teat.sp_EliminarSeccion";
            cmd.Parameters.Add(new SqlParameter("Secc_Id", id));
            util.EjecutarSP(cmd);
        }
    }
}