<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuario_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web118" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="card">
          <div class="card-header">
                  <h1 class="h1" id="">Usuarios</h1>
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
                  <h3 class="register-heading">Usuarios</h3>
                  <div class="row register-form">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Rol " value="" id="txtRol_Usr" />
                          </div>
                          <div class="form-group">
                          <input type="text" class="form-control" placeholder="Usuario" value="" id="txtUsuario"/>
                           </div>
                      </div>
                      <div class="col-md-6">
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Clave" value="" id="txtClave"/>
                          </div>
                          <div class="form-group">
                            <input type="text" class="form-control" placeholder="Persona (ID)" value="" id="txtPersonaID_Usr"/>
                           </div>
                          </div>
                           <button class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
       <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvUsuarios_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText ="ID Usuario" DataField="ID" />
        <asp:BoundField  HeaderText ="Rol" DataField="ROL" />
         <asp:BoundField  HeaderText ="CLAVE" DataField="CLAVE" />
        <asp:BoundField  HeaderText ="PERSONA_ID" DataField="PERSONA_ID" />

        <asp:TemplateField>
            <ItemTemplate>
                 <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-success" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                 <asp:Button ID="btnEditar" runat="server" Text="Eliminar" CssClass="btn btn-danger" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
           </div>
       </div>
    </div>
</asp:Content>
