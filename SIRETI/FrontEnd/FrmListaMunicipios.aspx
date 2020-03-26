<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FrmListaMunicipios.aspx.cs" Inherits="FrontEnd.FrmListaMunicipios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/datatables.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    

    <form runat="server">
        <!-------------------INICIA MODAL---------------------->
    <div class="modal" id="mdlConfirmar" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmar eliminación</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Estás seguro que deseas eliminar?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <asp:Button ID="btnConfirmarEliminar" CssClass="btn btn-danger" OnClick="btnConfirmarEliminar_Click" runat="server" Text="Eliminar" />
      </div>
    </div>
  </div>
</div>
    <!--Termina modal -->

        <asp:HiddenField ID="IdMunicipio" runat="server" />
        <h1>Bienvenido: Johan Alejandro Ortega Díaz</h1>
        <h1>Municipios registrados</h1>
        <div class="row justify-content-center my-2">
            <asp:Button ID="btnAgregar" CssClass="btn btn-primary" runat="server" Text="Agregar" OnClick="btnAgregar_Click"  />
            
        </div>
        <asp:GridView ID="grvLista" CssClass="table table-bordered table-striped" runat="server" 
            OnRowCommand="grvLista_RowCommand" DataKeyNames="IdMunicipio">
            <Columns>
                <asp:BoundField DataField="IdMunicipio" HeaderText="Clave" />
                <asp:BoundField DataField="Nombre" HeaderText="Municipio" />
                <asp:BoundField DataField="Estado" HeaderText="Estado"/>
                <asp:ButtonField CommandName="Editar" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" Text="Editar"/>
                <asp:ButtonField CommandName="Eliminar"  ButtonType="Button" ControlStyle-CssClass="btn btn-danger" Text="Eliminar"/>
                <%--<asp:CommandField DeleteText="Eliminar" EditText="Editar" />--%>
            </Columns>
        </asp:GridView>
        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="js/datatables.js"></script>
    <script>
    $(document).ready( function () {
        /*
         *CORRECCION: El plugin requiere que la tabla tenga un thead con los encabezados de la
         * tabla y el gridview no genera este elemento, al traducir el gridview a tabla solo genera
         * un tbody y un tfooter, por lo que en el siguiente código adecúo la tabla antes de 
         * activar el plugin
         * */
        let tabla = $('#contenido_grvLista');
        //Obtengo la fila de los encabezados en el gridview colocó en el tbody (la primera)
        let fila = $(tabla).find("tbody tr:first").clone();
        //La elimino del tbody
        $(tabla).find("tbody tr:first").remove();
        //Creo un elemento thead y le añado la fila de encabezados
        let encabezado = $("<thead/>").append(fila);
        //Añado el thead a la tabla antes del tbody
        $(tabla).children('tbody').before(encabezado);
        //Activamos el plugin
        $('#contenido_grvLista').DataTable();
        
    });
    </script>
</asp:Content>
