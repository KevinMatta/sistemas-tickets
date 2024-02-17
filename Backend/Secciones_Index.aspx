<%@ Page Title="Secciones" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Secciones_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="container">
            <div class="card">
                <div class="card-header">
                        <h1 class="h1" id="">Secciones</h1>
                          <p>
                      <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                          Nuevo
                     </button>
                 </p>
                </div>
                <asp:HiddenField ID="CollapseSecciones" runat="server" />
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
                        <h3 class="register-heading">Secciones</h3>
                        <div class="row register-form">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input runat="server" type="text" class="form-control" placeholder="Seccion (Nombre)" value="" id="txtSeccion" />
                                </div>
                                  <div class="form-group">
                                <input runat="server" type="text" class="form-control" placeholder="Seccion por teatro (ID)" value="" id="txtSeccionporTeatro" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input runat="server" type="text" class="form-control" placeholder="Seccion (Precio)" value="" id="txtSeccionPrecio"/>
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
                   <asp:GridView ID="gvSecciones" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging ="true" OnPageIndexChanging="gvSecciones_PageIndexChanging">
    <Columns>
        <asp:BoundField  HeaderText ="Id Seccion" DataField="ID" />
        <asp:BoundField  HeaderText ="Seccion" DataField="SECCION" />
        <asp:TemplateField>
            <ItemTemplate>
                 <button id="btnEditar" class="btn btn-success" onclick="Editar('<%# Eval("ID") %>');">Editar</button>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                 <button id="btnEliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>');">Eliminas</button>
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
        if ($("[id$=CollapseSecciones]").val() == "true") {
            $("#collapseExample").removeClass("collapse");
        }
    });
</script>
</asp:Content>
