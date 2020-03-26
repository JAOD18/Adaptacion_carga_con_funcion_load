<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmInicio.aspx.cs" Inherits="FrontEnd.FrmInicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <%
        String strTipo = "";
        int tipo=int.Parse(Session["tipo"].ToString());
        if (tipo == 0)
            strTipo = "Alumno";
        else if (tipo == 1)
            strTipo = "Docente";
        else if (tipo == 2)
            strTipo = "Coordinador";
        else
            strTipo = "Encargado";
    %>
    <%--<h1>Bienvenido <%= strTipo %></h1>--%>
    
<div id="divContenido"></div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="FrmInicio.js"></script>
</asp:Content>
