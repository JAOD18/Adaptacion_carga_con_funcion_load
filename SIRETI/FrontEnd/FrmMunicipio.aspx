<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmMunicipio.aspx.cs" Inherits="FrontEnd.FrmMunicipio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <%
        ////Acceso a datos por metodo get
        //Response.Write(Request.QueryString["id"]);
        //Response.Write(Request.QueryString["nombre"]);
        ////Obtener todos los elementos GET
        //foreach (String item in Request.QueryString)
        //{
        //    Response.Write(Request.QueryString[item]);
        //}

        
        //Los elementos ASP que colocamos son modificados por 
        //el servidor al generar su NAME, añade un prefijo para 
        //el control y añade el id del hueco de la página maestra 
        //y posteriormente el id que le hayas colocado
        //Response.Write(Request["ctl00$contenido$IdMunicipio"]);
        //Los elementos html puros no son manipulados por el
        //servidor, por lo que el atributo name no cambia
        //Response.Write(Request["ClaveMun"]);
        //También es posible acceder a todos los elementos que vengan contenidos
        //en el formulario que realizó la petición
        //Response.Write(Request.Form["txtClave"]);




    %>

    <form runat="server">
        <h1>Bienvenido: Johan Alejandro Ortega Díaz</h1>
        <asp:HiddenField ID="txtIdMunicipio" runat="server" Value="0"/>
        <div class="form-row">
            <div class="col-md-6">
                <label for="txtMunicipio">Municipio</label>
                <asp:TextBox ID="txtMunicipio" CssClass="form-control" placeholder="Municipio" runat="server"></asp:TextBox>
                <div class="valid-feedback">
                    Correcto!
                </div>
                <div class="invalid-feedback">
                    El nombre del municipio es obligatorio y tener hasta 50 caracteres.
                </div>
            </div>
            <div class="col-md-6">
            <label for="ddlEstado">Estado</label>
            <asp:DropDownList ID="ddlEstado" CssClass="custom-select" runat="server"></asp:DropDownList>
            <div class="valid-feedback">
                Correcto!
            </div>
            <div class="invalid-feedback">
                Selecciona el estado al que pertenece el municipio
            </div>
        </div>
        </div>
        <div class="form-row my-3">
            <button id="btnValidar" type="button" class="btn btn-success">Aceptar</button>
            <asp:Button ID="btnAceptar" CssClass="btn btn-success" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" />
            <asp:Button ID="btnCancelar" CssClass="btn btn-danger" runat="server" Text="Cancelar" />
            
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">

    <script>
        $(document).ready(function () {
            $("#btnValidar").on('click', validar);
            $(".btn").addClass("text-bold");
            
        });
        function validar(e) {
                
            $("#contenido_txtMunicipio").removeClass("is-valid", "is-invalid");
            $("#contenido_ddlEstado").removeClass("is-valid", "is-invalid");
            if ($("#contenido_txtMunicipio").val().trim().length >= 5 &&
                $("#contenido_txtMunicipio").val().trim().length <= 50) {
                $("#contenido_txtMunicipio").addClass("is-valid");
            } else {
                $("#contenido_txtMunicipio").addClass("is-invalid");
            }

            if ($("#contenido_ddlEstado").val() >= 1 &&
                $("#contenido_ddlEstado").val() <= 32) {
                $("#contenido_ddlEstado").addClass("is-valid");
            } else {
                $("#contenido_ddlEstado").addClass("is-invalid");
            }
        }
    </script>
</asp:Content>
