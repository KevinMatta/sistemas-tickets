<%@ Page Title="Participantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Participantes_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web111" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
             <div class="container">
      <div class="card">
          <div class="card-header">
                  <h1 class="h1" id="">Participantes</h1>
                    <p>
                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Nuevo
               </button>
           </p>
          </div>
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
                  <h3 class="register-heading">Participantes</h3>
                  <div class="row register-form">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Rol" value="" id="txtRol"  runat="server"/>
                          </div>
                            <div class="form-group">
                          <asp:DropDownList ID="ddlObras" runat="server" CssClass="form-control" DataTextField="Obrs_Descripcion" DataValueField="ID"></asp:DropDownList>
                          </div>
                      </div>
                      <div class="col-md-6">
                          <div class="form-group">
                              <asp:DropDownList ID="ddlPersonas" runat="server" CssClass="form-control" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                          </div>
                          </div>
                           <button id="btnGuardar" runat="server" onserverclick="btnGuardar_ServerClick" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
                   <asp:GridView ID="gvParticipantes" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvParticipantes_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText =" ID" DataField="ID" />
        <asp:BoundField  HeaderText ="ROL" DataField="Prtp_Rol" />
         <asp:BoundField  HeaderText ="OBRA" DataField="Obrs_Descripcion" />
          <asp:BoundField  HeaderText ="PARTICIPANTE" DataField="NOMBRE" />
        <asp:TemplateField>
            <ItemTemplate>
                <button id="btnEditar"  value="Editar" class="btn btn-success" onclick="Editar('<%# Eval("ID") %>');" >Editar</button>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                 <button id="btnEliminar"  value="Eliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>');">Eliminar</button>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
           </div>
       </div>
    </div>
    <script src="Content/plugins/iziToast-master/dist/js/iziToast.js"></script>
</asp:Content>
