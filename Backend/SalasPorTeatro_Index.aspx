﻿<%@ Page Title="Salas por teatros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalasPorTeatro_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web113" %>

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
            <asp:HiddenField ID="HFSalaporTeatro" runat="server" />
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
                                            <h3 class="register-heading">Salas por teatro</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlTeatro" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlSala" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <button runat="server" id="btnCerar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                            Cerrar
                                                        </button>
                                                        <button runat="server" id="btnGuardar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onserverclick="btnGuardar_ServerClick">
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
                <asp:GridView ID="gvSalaporTeatro" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvSalaporTeatro_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="TEATRO_ID" DataField="TEATRO_ID" />
                        <asp:BoundField HeaderText="SALA_ID" DataField="SALA_ID" />
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
            if ($("[id$=HFSalaporTeatro]").val() == "true") {
                $("#collapseExample").removeClass("collapse");
            }
        });
    </script>
</asp:Content>
