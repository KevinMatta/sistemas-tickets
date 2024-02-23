<%@ Page Title="Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web18" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Empleados</h1>
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
                                    <img src="Content/dist/img/FM.png" alt="" />
                                </div>
                                <div class="col-md-9 register-right">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                            <h3 class="register-heading">Empleados</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control" placeholder="Nombre" value="" id="txtNombre" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control" placeholder="Puesto" value="" id="txtPuesto" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control" placeholder="Apellido" value="" id="txtApellido" />
                                                    </div>
                                                    <div class="form-group">
                                                        <input runat="server" type="number" class="form-control" placeholder="Salario" value="" id="txtsalario" />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <div class="form-check form-check-inline">
                                                            <input runat="server" class="form-check-input" type="radio" name="sexo" id="rbFemenino" value="F" />
                                                            <label class="form-check-label" for="rbFemenino">Femenino</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input runat="server" class="form-check-input" type="radio" name="sexo" id="rbMasculino" value="M" />
                                                            <label class="form-check-label" for="rbMasculino">Masculino</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="ddlEstadosCiviles" runat="server" CssClass="form-control" DataTextField="EsCi_Descripcion" DataValueField="ID"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="date" class="form-control" placeholder="nacimiento" value="" id="dateNacimiento" />
                                                    </div>
                                                </div>
                                                <button id="btnGuardar" runat="server" onserverclick="btnGuardar_ServerClick" class="btn btn-danger type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                                    Guardar
                                                </button>
                                            </div>
                                            <%//row register form %>
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
                <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvEmpleados_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" />
                        <asp:BoundField HeaderText="NOMBRE" DataField="NOMBRE" />
                        <asp:BoundField HeaderText="PUESTO" DataField="Empl_Puesto" />
                        <asp:BoundField HeaderText="SALARIO" DataField="Empl_Salario" />
                        <asp:BoundField HeaderText="SEXO" DataField="Prsn_Sexo" />
                        <asp:BoundField HeaderText="E.CIVIL" DataField="EsCi_Descripcion" />
                        <asp:BoundField HeaderText="NACIMIENTO" DataField="Prsn_FechaNacimiento" />
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
