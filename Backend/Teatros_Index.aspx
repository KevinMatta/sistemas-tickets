<%@ Page Title="Teatros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teatros_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web114" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
      <div class="card">
          <div class="card-header">
                  <h1 class="h1" id="">Teatros</h1>
                    <p>
                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Nuevo
               </button>
           </p>
          </div>
          <asp:HiddenField ID="CollapseTeatro" runat="server" />
          <div class="collapse" id="collapseExample">
         <div class="card card-body">
              <div class="container">
<div class="container register">
  <div class="row">
      <div class="col-md-3 register-left">
          <img src="Content/dist/img/FM.png" alt=""/>
      </div>
      <div class="col-md-9 register-right">
          <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                  <h3 class="register-heading">Teatros</h3>
                  <div class="row register-form">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input runat="server" type="text" class="form-control" placeholder="Teatro (Nombre)" value="" id="txtTeatro" />
                          </div>
                      </div>
                      <asp:UpdatePanel runat="server">
                          <ContentTemplate>
                              <div class="col-md-6">
                                  <div class="form-group">
                                      <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control" DataTextField="Estd_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged"></asp:DropDownList>
                                  </div>
                              </div>
                              <div class="col-md-6">
                                  <div class="form-group">
                                      <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" DataTextField="Ciud_Descripcion" DataValueField="ID"></asp:DropDownList>
                                  </div>
                              </div>
                          </ContentTemplate>
                      </asp:UpdatePanel>
                      <button runat="server" id="btnGuardar" onserverclick="btnGuardar_ServerClick" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                          Guardar
                      </button>
                  </div>
              </div>
          </div>
      </div>
  </div>
                  </div>
  
                  </div>
              </div>
          </div>
      </div>
  </div>
                            <div class="container">
       <div class="card">
           <div class="card-body">
                   <asp:GridView ID="gvTeatros" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvTeatros_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText =" ID" DataField="ID" />
        <asp:BoundField  HeaderText ="TEATRO" DataField="Teat_Descripcion" />
         <asp:BoundField  HeaderText ="CIUDAD" DataField="Ciud_Descripcion" />
        <asp:BoundField  HeaderText ="ESTADO" DataField="Estd_Descripcion" />
        <asp:TemplateField>
            <ItemTemplate>
                 <button id="btnEditar" class="btn btn-success" onclick="Editar('<%# Eval("ID") %>');">Editar</button>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
               <button id="btnEliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>');">Eliminar</button>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
           </div>
       </div>
    </div>
        <script src="Content/plugins/jquery/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        if ($("[id$=CollapseTeatro]").val() == "true") {
            $("#collapseExample").removeClass("collapse");
        }
    });
</script>
</asp:Content>
