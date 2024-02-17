<%@ Page Title="Ciudades" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ciudades_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="container">
            <div class="card">
                <div class="card-header">
                        <h1 class="h1" id="">Ciudades</h1>
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
                        <h3 class="register-heading">Ciudades</h3>
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Ciudad (Nombre)" value="" id="txtNombreCiudad" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Departamento (ID)" value="" id="txtIdDepto"/>
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
                   <asp:GridView ID="gvCiudades" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvCiudades_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText =" CIUDAD" DataField="CIUDAD" />
        <asp:BoundField  HeaderText ="ESTADO_ID" DataField="ESTADO_ID" />
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
