<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Secciones_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField  HeaderText ="Id Seccion" DataField="ID" />
            <asp:BoundField  HeaderText ="Seccion" DataField="SECCION" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a>Editasr</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <a>Eliminar</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
