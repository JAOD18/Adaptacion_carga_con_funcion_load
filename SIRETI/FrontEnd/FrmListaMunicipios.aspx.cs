using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.datos;

namespace FrontEnd
{
    public partial class FrmListaMunicipios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Evitar que agregue más columnas a la tabla
                grvLista.AutoGenerateColumns = false;
                grvLista.DataSource = new MunicipioDao().getAll();
                grvLista.DataBind();
                //grvLista.Columns[2].Visible = false;
            }
        }

        public void enviar(String url, Dictionary<String,String> valores) {
            Response.Clear();
            Response.Write("<html><head>");
            Response.Write("</head><body onload=\"document.frm.submit()\">");
            Response.Write(string.Format("<form name=\"frm\" method=\"post\" action=\"{0}\" >", url));
            foreach (KeyValuePair<String,String> item in valores){
                Response.Write(string.Format("<input name=\"{0}\" type=\"hidden\" value=\"{1}\">", item.Key, item.Value));
            }
            Response.Write("</form>");
            Response.Write("</body></html>");
            Response.End();
        
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmMunicipio.aspx?id=" + 6);
        }

        protected void grvLista_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                Dictionary<String, String> info = new Dictionary<string, string>();
                info.Add("ClaveMun", grvLista.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
                enviar("FrmMunicipio.aspx", info);
            }
            else if (e.CommandName == "Eliminar") {
                IdMunicipio.Value = grvLista.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                Response.Write("<script>" +
                    "window.addEventListener('load', function () {$('#mdlConfirmar').modal('show');});</script>");



            }

        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            bool resultado = new MunicipioDao().delete(int.Parse(IdMunicipio.Value));
            if (resultado)
            {
                //Evitar que agregue más columnas a la tabla
                grvLista.DataSource = null;
                grvLista.DataSource = new MunicipioDao().getAll();
                grvLista.DataBind();
            }
            else
            {
                //hay errores
            }
        }
    }
}