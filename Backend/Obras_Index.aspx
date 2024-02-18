<%@ Page Title="Obras" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Obras_Index.aspx.cs" Inherits="FM_Tickets_WebForm.Formulario_web110" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



            <%--modal de confirmar eliminar--%>
<asp:HiddenField ID="ShowModalElim" runat="server" />
<div class="modal fade" id="confirmacionModal" tabindex="-1" role="dialog" aria-labelledby="confirmacionModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">Confirmación de Eliminación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Está seguro de que desea eliminar esta obra?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <asp:Button type="button" class="btn btn-danger" id="btnConfirmarEliminar" OnClick="btnConfirmarEliminar_Click">Eliminar</asp:Button>
            </div>
        </div>
    </div>
</div>



    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="h1" id="">Obras</h1>
                <p>
                    <button class="btn btn-danger" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Nuevo
                    </button>
                </p>
            </div>
            <asp:HiddenField ID="CollapseObras" runat="server" />
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
                                            <h3 class="register-heading">Obras</h3>
                                            <div class="row register-form">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input runat="server" type="text" class="form-control" placeholder="Obra (Nombre)" value="" id="txtObraNombre" />
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                </div>
                                                <button runat="server" class="btnRegister" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" onserverclick="Unnamed_ServerClick">
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
                <asp:GridView ID="gvObras" runat="server" AutoGenerateColumns="false" CssClass="table  table-striped table-border" AllowPaging="true" OnPageIndexChanging="gvObras_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText=" ID" DataField="ID" />
                        <asp:BoundField HeaderText="NOMBRE" DataField="NOMBRE" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEditar"  value="Editar" class="btn btn-success" onclick="Editar('<%# Eval("ID") %>');" >Editar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <button id="btnEliminar"  value="Eliminar" class="btn btn-danger" onclick="Eliminar('<%# Eval("ID") %>');">Eliminar</button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>








    <script src="Content/plugins/iziToast-master/dist/js/iziToast.js"></script>
    <script src="Content/plugins/jquery/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

            if ($("[id$=CollapseObras]").val() == "true") {
                $("#collapseExample").removeClass("collapse");

            }
            if ($('[id$=ShowModalElim]').val() == 'true') {
                $('#confirmacionModal').modal('show');
            }
            alert($('[id$=ShowModalElim]').val())

        });

            //$("body").on("click", ".btnEliminar", function () {
            //    var obraId = $(this).closest("td").text();

            //    $("#confirmacionModal").modal("show");

            //    $("#btnConfirmarEliminar").off().on("click", function () {
            //        __doPostBack("Eliminar", obraId);

            //        $("#confirmacionModal").modal("hide");
            //    });
            //});


        //function Eliminar(obraId) {
        //    //alert('Hola');
        //    var obraId = $(this).closest("td").text();

        //    $("#confirmacionModal").modal("show");

        //    $("#btnConfirmarEliminar").off().on("click", function () {
        //        __doPostBack("Eliminar", obraId);

        //        $("#confirmacionModal").modal("hide");
        //    }


    </script>

</asp:Content>
