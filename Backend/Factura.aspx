<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="FM_Tickets_WebForm.Factura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="card">
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
                                                        <input type="number" class="form-control" placeholder="Numero de identidad" value="" id="txtId" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder=" Nombre" value="" id="txtNombre" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder=" Sexo" value="" id="txtSexo" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlEstadoCiviles" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="date" class="form-control" placeholder=" Fecha de nacimiento" value="" id="txtFechaN" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <button runat="server" id="btnCerar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                        Cerrar
                                                    </button>
                                                    <button runat="server" id="btnGuardar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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
        <header>
            <button class="btn btn-success" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                <i class="fas fa-user-plus"></i>Agregar nuevo cliente
            </button>
        </header>

        <!--Formulario venta detalle-->
        <div class="form">
            <div class="dbl-field">
                <div class="field">
                    <asp:DropDownList ID="ddlPersonas" runat="server" CssClass="form-control" DataTextField="Prsn_Identidad" DataValueField="ID"></asp:DropDownList>
                </div>
                <div class="button-area">
                    <button runat="server" onserverclick="btnSeleccionar_ServerClick" id="btnSeleccionar" type="button" class="btn btn-primary"><i class="fa-solid fa-floppy-disk"></i>Seleccionar cliente</button>
                    <span></span>
                </div>
            </div>
                    <!--Venta ID-->
            <div class="dbl-field">
                <div class="field">
                    <h6 class="h6"></h6>
                    <input id="nmbCantidad" runat="server" type="number" name="cantidad" value="" />
                </div>
                <div class="field">
                    <h6 class="h6"></h6>
                    <asp:DropDownList ID="ddlEstados" runat="server" CssClass="form-control" DataTextField="Estd_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlEstados_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="field">
                    <h6 class="h6"></h6>
                    <asp:DropDownList ID="ddlCiudades" runat="server" CssClass="form-control" DataTextField="Ciud_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlCiudades_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="field">
                    <h6 class="h6"></h6>
                    <asp:DropDownList ID="ddlTeatros" runat="server" CssClass="form-control" DataTextField="Teat_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlTeatros_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="field">
                    <h6 class="h6"></h6>
                    <asp:DropDownList ID="ddlFunciones" runat="server" CssClass="form-control" DataTextField="Obrs_Descripcion" DataValueField="ID"></asp:DropDownList>
                </div>
                <div class="field">
                    <h6 class="h6"></h6>
                    <asp:DropDownList ID="ddlSecciones" runat="server" CssClass="form-control" DataTextField="Secc_Descripcion" DataValueField="ID"></asp:DropDownList>
                </div>
            </div>
            <div class="button-area">
                <button runat="server" id="Agregar" type="button" class="btn btn-primary" onserverclick="Agregar_ServerClick"><i class="fa-solid fa-floppy-disk"></i>Agregar</button>


                <button runat="server" id="btnFinalizar" type="button" class="btn btn-primary" onserverclick="btnFinalizar_ServerClick"><i class="fa-solid fa-floppy-disk"></i>Finalizar</button>

            </div>
        </div>
    </div>
    <!--fas fa-trash-alt-->


    <!--GridView facturas detalle-->
<div class="container">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvFacturaDetalle" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvFacturaDetalle_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>');">Eliminar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                        <asp:BoundField HeaderText="CANTIDAD" DataField="VtDe_Cantidad" />
                        <asp:BoundField HeaderText="OBRA" DataField="Obrs_Descripcion" />
                        <asp:BoundField HeaderText="PRECIO" DataField="Secc_Precio" />
                        <asp:BoundField HeaderText="SECCION" DataField="Secc_Descripcion" />
                        <asp:BoundField HeaderText="SALA" DataField="Sala_Descripcion" />
                        <asp:BoundField HeaderText="TEATRO" DataField="Teat_Descripcion" />
                        <asp:BoundField HeaderText="CIUDAD" DataField="Ciud_Descripcion" />
                        <asp:BoundField HeaderText="FECHA" DataField="Fncs_Fecha" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>


    <!--GridView facturas finales-->
    <div class="container collapse">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvFacturas_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText=" ID" DataField="ID" />
                            <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                            <asp:BoundField HeaderText="CANTIDAD" DataField="VtDe_Cantidad" />
                            <asp:BoundField HeaderText="OBRA" DataField="Obrs_Descripcion" />
                            <asp:BoundField HeaderText="PRECIO" DataField="Secc_Precio" />
                            <asp:BoundField HeaderText="SECCION" DataField="Secc_Descripcion" />
                            <asp:BoundField HeaderText="SALA" DataField="Sala_Descripcion" />
                            <asp:BoundField HeaderText="TEATRO" DataField="Teat_Descripcion" />
                            <asp:BoundField HeaderText="CIUDAD" DataField="Ciud_Descripcion" />
                            <asp:BoundField HeaderText="FECHA" DataField="Fncs_Fecha" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
