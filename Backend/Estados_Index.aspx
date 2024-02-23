<%@ Page Title="Estados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Estados_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Estados</h1>
                <p>
                    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Nuevo
                    </button>
                </p>
            </div>
            <asp:HiddenField ID="CollapseEstado" runat="server" />
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
                                            <h3 class="register-heading">Estados</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control codigo" placeholder="Estado (Codigo)" value="" id="txtEstadoID" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control nombreEst" placeholder="Estado (Nombre)" value="" id="txtEstado" />
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
                <asp:GridView ID="gvEstados" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvEstados_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="ESTADO" DataField="Estd_Descripcion" />
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
            if ($("[id$=CollapseEstado]").val() == "true") {
                $("#collapseExample").removeClass("collapse");
            }
        });

        $("input.codigo").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

        $("input.nombreEst").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

    </script>
</asp:Content>
