using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.datos;
using BackEnd.modelo;

namespace FrontEnd
{
    public partial class FrmMunicipio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                ddlEstado.DataSource = new EstadoDao().getAll();
                ddlEstado.DataValueField = "IdEstado";
                ddlEstado.DataTextField = "Nombre";
                ddlEstado.DataBind();

                if (Request["ClaveMun"] != null) {
                    Municipio m = new MunicipioDao().getOne(int.Parse(Request["ClaveMun"].ToString()));
                    txtIdMunicipio.Value = m.IdMunicipio.ToString();
                    txtMunicipio.Text = m.Nombre;
                    ddlEstado.SelectedValue = m.IdEstado.ToString();
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Municipio m = new Municipio();
            m.IdEstado = int.Parse(ddlEstado.SelectedValue.ToString());
            m.Nombre = txtMunicipio.Text.Trim();
            //Identificar si es agregar o editar
            if (txtIdMunicipio.Value == "0")
            {
                int resultado = new MunicipioDao().insert(m);
                if (resultado > 0)
                    Response.Redirect("FrmListaMunicipios.aspx");
                else {
                    //Mostrar errores
                }
            }
            else {
                m.IdMunicipio = int.Parse(txtIdMunicipio.Value);
                bool resultado = new MunicipioDao().update(m);
                if (resultado)
                    Response.Redirect("FrmListaMunicipios.aspx");
                else
                {
                    //Mostrar errores
                }
            }
        }
    }
}