<%@ Page Title="Asientos por sala" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AsientosPorSala.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Asientos por sala</h1>
                <p>
                    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Nuevo
                    </button>
                </p>
            </div>
            <asp:HiddenField ID="Hf_Asientos_sala" runat="server" />
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
                                            <h3 class="register-heading">Asientos por sala</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlAsiento" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlSala_por_teatro"  CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <button class="btnRegister" runat="server" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onserverclick="Unnamed_ServerClick">
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
                <asp:GridView ID="gvAsientosporSala" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvAsientosporSala_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="ASIENTO_ID" DataField="ASIENTO_ID" />
                        <asp:BoundField HeaderText="SALA_TEATRO_ID" DataField="SALA_TEATRO_ID" />
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
            if ($("[id$=Hf_Asientos_sala]").val() == "true") {
                $("#collapseExample").removeClass("collapse");
            }
        });
    </script>
</asp:Content>
