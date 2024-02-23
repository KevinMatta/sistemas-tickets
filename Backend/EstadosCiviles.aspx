<%@ Page Title="Estados Civiles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EstadosCiviles.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Estados civiles</h1>
                <p>
                    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Nuevo
                    </button>
                </p>
            </div>
            <asp:HiddenField ID="CollapseEstadosCiviles" runat="server" />
            <div class="collapse" id="collapseExample">
                <div class="card card-body">
                    <div class="container">
                        <div class="container register">
                            <div class="row">
                                <div class="col-md-3 register-left">
                                    <img src="Content/dist/img/FM.png" alt="" />
                                </div>
                                <div class="col-md-9 register-right">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <h3 class="register-heading">Estado civiles</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control civil" placeholder="Estado Civil (Nombre)" value="" id="txtDescripcion" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                </div>
                                                <button class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" runat="server" onserverclick="btnGuardar_ServerClick">
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
                <asp:GridView ID="gvEstadosCiviles" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvEstadosCiviles_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="DESCRIPCION" DataField="EsCi_Descripcion" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEditar" class="btn btn-success" onclick="Editar('<%# Eval("ID") %>')">Editar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>')">Eliminar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <script src="Content/plugins/jquery/jquery.min.js"></script>
    <script src="Content/plugins/iziToast-master/dist/js/iziToast.js"></script>
    <script>
        $(document).ready(function () {
            if ($("[id$=CollapseEstadosCiviles]").val() == "true") {
                $("#collapseExample").removeClass("collapse");
            }
        });

        $("input.civil").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

        //civil
    </script>
</asp:Content>
