<%@ Page Title="Funciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Funciones_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="card">
          <div class="card-header">
                  <h1 class="h1" id="">Funciones</h1>
                    <p>
                <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Nuevo
               </button>
           </p>
          </div>
          <asp:HiddenField ID="CollapseFunciones" runat="server" />
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
                  <h3 class="register-heading">Funciones</h3>
                  <div class="row register-form">
                      <div class="col-md-6">
                          <div class="form-group">
                              <input runat="server" type="Date" class="form-control" placeholder="Fecha de la funcion " value="" id="txtfechaFun" />
                          </div>
  

                      </div>
                      <div class="col-md-6">
                          <div class="form-group">
                              <asp:DropDownList ID="ddlObras" runat="server" CssClass="form-control" DataTextField="Descripcion" DataValueField="ID"></asp:DropDownList>
                          </div>
                          </div>
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
                   <asp:GridView ID="gvFunciones" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvFunciones_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText =" ID" DataField="ID" />
        <asp:BoundField  HeaderText ="FECHA" DataField="Fncs_Fecha" />
         <asp:BoundField  HeaderText ="OBRA" DataField="Obrs_Descripcion" />
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
        if ($("[id$=CollapseFunciones]").val() == "true") {
            $("#collapseExample").removeClass("collapse");
        }
    });
</script>
</asp:Content>
