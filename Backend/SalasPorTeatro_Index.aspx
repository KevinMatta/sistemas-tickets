<%@ Page Title="Salas por teatros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalasPorTeatro_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web113" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="card">
          <div class="card-header">
                  <h1 class="h1" id="">Salas por teatro</h1>
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
                  <h3 class="register-heading">Salas por teatro</h3>
                  <div class="row register-form">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input type="text" class="form-control" placeholder="Teatro (ID)" value="" id="txtTeatroID" />
                          </div>
                       
                      </div>
                      <div class="col-md-6">
                            <div class="form-group">
                        <input type="text" class="form-control" placeholder=" Sala (ID)" value="" id="txtSalaID" />
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
                   <asp:GridView ID="gvSalaporTeatro" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvSalaporTeatro_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText =" ID" DataField="ID" />
        <asp:BoundField  HeaderText ="TEATRO_ID" DataField="TEATRO_ID" />
         <asp:BoundField  HeaderText ="SALA_ID" DataField="SALA_ID" />
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
