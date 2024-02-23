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
                                                        <input type="number" class="form-control" placeholder="identidad" value="" id="txtId" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Nombre" value="" id="txtNombre" runat="server" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="date" class="form-control" placeholder="Fecha de nacimiento" value="" id="txtFechaN" runat="server" />
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlEstadoCiviles" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Apellido" value="" id="txtApellido" runat="server" />

                                                    </div>
                                                    <div class="form-group">
                                                        <label for="radMasculino">
                                                            <input type="radio" id="radMasculino" runat="server" name="sexo" value="Masculino" />
                                                            Masculino
                                                        </label>
                                                        <label for="radFemenino">
                                                            <input type="radio" id="radFemenino" runat="server" name="sexo" value="Femenino" />
                                                            Femenino
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <button runat="server" id="btnCerar" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                        Cerrar
                                                    </button>
                                                    <button onserverclick="btnGuardarPersona_ServerClick" runat="server" id="btnGuardarPersona" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
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


        <div class="card">
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
                                        <h3 class="register-heading">Facturacion</h3>
                                        <div class="row register-form">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlPersonas" runat="server" CssClass="form-control" DataTextField="Prsn_Identidad" DataValueField="NOMBRE" AutoPostBack="true" OnSelectedIndexChanged="ddlPersonas_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlTeatros" runat="server" CssClass="form-control" DataTextField="Teat_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlTeatros_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlSecciones" runat="server" CssClass="form-control" DataTextField="Secc_Descripcion" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="ddlSecciones_SelectedIndexChanged"></asp:DropDownList>
                                                </div>


                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input id="txtCliente" runat="server" type="text" name="cliente" value="" class="form-control" placeholder="Cliente" readonly />
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlFunciones" runat="server" CssClass="form-control" DataTextField="Obrs_Descripcion" DataValueField="ID"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <asp:DropDownList ID="ddlAsientos" runat="server" CssClass="form-control" DataTextField="Asnt_Descripcion" DataValueField="ID"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <button runat="server" id="Agregar" type="button" class="btnRegister" onserverclick="Agregar_ServerClick"><i class="fa-solid fa-floppy-disk"></i>Agregar</button>

                                                <button runat="server" id="btnFinalizar" type="button" class="btnRegister" onserverclick="btnFinalizar_ServerClick"><i class="fa-solid fa-floppy-disk"></i>Finalizar</button>

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

    <!--Formulario venta detalle-->
    <!--fas fa-trash-alt-->

    <asp:Panel ID="pnlFacturaDetalle" runat="server" Visible="false">
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
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!--GridView facturas enccabezado-->
    <asp:Panel ID="pnlFacturaEncabezado" runat="server" Visible="false">
        <div class="container ">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvFacturas_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText=" ID" DataField="ID" />
                                <asp:BoundField HeaderText="NOMBRE" DataField="Nombre" />
                                <asp:BoundField HeaderText="TOTAL" DataField="TOTAL" />
                                <asp:BoundField HeaderText="FECHA" DataField="Vnts_Fecha" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <script src="Content/iziToast-master/dist/js/iziToast.js"></script>


</asp:Content>
