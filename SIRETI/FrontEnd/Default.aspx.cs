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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divMensaje.Visible = false;
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            //Verificar los datos que llegan del cliente
            
            UsuarioDAO dao = new UsuarioDAO();
            Usuario objUsuario = dao.iniciarSesion(txtEmail.Text,
                txtPassword.Text);
            if (objUsuario != null)
            {
                Session["tipo"] = objUsuario.Tipo;
                Response.Redirect("FrmInicio.aspx");
            }
            else {
                divMensaje.Visible = true;
            }
        }
    }
}