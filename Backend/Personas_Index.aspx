<%@ Page Title="Personas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Personas_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Personas</h1>
                <p>
                    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Nuevo
                    </button>
                </p>
            </div>
            <asp:HiddenField ID="Person_showCollapse" runat="server" />
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
                                            <h3 class="register-heading">Personas</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control nombre " placeholder="Nombre" value="" id="txtNombre" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control apellido" placeholder=" Apellido" value="" id="txtApellido" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlEstadoCiviles" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input type="number" class="form-control identidad" placeholder="Identidad" value="" id="txtIdentidad" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control sexo" placeholder=" Sexo" value="" id="txtSexo" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="date" class="form-control" placeholder=" Fecha de nacimiento" value="" id="txtFechaN" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <button runat="server" id="btnCerar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                            Cerrar
                                                        </button>
                                                        <button runat="server" id="btnGuardar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onserverclick="Unnamed_ServerClick">
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
        </div>
    </div>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <asp:GridView ID="gvPersonas" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvPersonas_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                        <asp:BoundField HeaderText="Sexo" DataField="Prsn_Sexo" />
                        <asp:BoundField HeaderText="ESTADO_ID" DataField="EsCi_Descripcion" />
                        <asp:BoundField HeaderText="FECHA NACIMIENTO" DataField="Prsn_FechaNacimiento" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEditar" text="Editar" class="btn btn-success" value="Editar" onclick="Editar('<%# Eval("ID") %>');" />
                                Editar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEditar" text="Eliminar" class="btn btn-danger" value="Eliminar" onclick="Eliminar('<%#Eval("ID") %>')" />
                                Eliminar</button>
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
            if ($("[id$=Person_showCollapse]").val() == "true") {
                $("#collapseExample").removeClass("collapse");
            }
        });

        $("input.nombre").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

        $("input.apellido").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

        $("input.sexo").bind('keypress', function (event) {
            var regex = new RegExp("^[a-zA-Z ]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        }); 

        $("input.identidad").bind('keypress', function (event) {
            var regex = new RegExp("^[0-9]+$");
            var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
            if (!regex.test(key)) {
                event.preventDefault();
                return false;
            }
        });

    </script>


</asp:Content>
