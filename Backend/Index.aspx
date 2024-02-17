﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FM_Tickets_WebForm.Index2" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="Content/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
   <!-- Font Awesome -->
   <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
   <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="Content/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
	<link rel="stylesheet" href="Content/dist/css/Login.css">
	<link rel="Icon" href="Content/dist/img/FM-icono-removebg-preview.png">
    <title>Inicio de sesion</title>
    </head>
    <body>
    <form id="form1" runat="server">
        <div>
             <a  class="logo" target="_blank">
   <img src="Content/dist/img/FM.png" alt="">
	</a>
	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3"><span>Inicar sesion</span><span>Registro</span></h6>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
												<h4 class="mb-4 pb-3">Iniciar sesion</h4>
                                                 <div class="form-group">
												<asp:TextBox  type="text" ID="txtUsuario"  runat="server" CssClass ="form-style" placeholder="Nombre de usuario: " ></asp:TextBox>
				                                  <i class="input-icon fas fa-user-circle"></i>
                                                  </div>	
                                                  <div class="form-group mt-2">
												  <asp:TextBox  type="password" ID="txtContraseña" runat="server" CssClass ="form-style" placeholder="Contraseña: " ></asp:TextBox>
				                                 <i class="input-icon fa fa-lock"></i>
                                                 </div>
											   <asp:Button ID="BtnEntrar"  CssClass="btn mt-4" runat="server" Text="iniciar sesion"  OnClick="BtnEntrar_Click"/>
                                              <p class="mb-0 mt-4 text-center"><a href="#0" class="link">Olvidaste tu contraseña?</a></p>
				      					</div>
			      					</div>
			      				</div>
								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Registrarse</h4>
											<div class="form-group">
												<input type="text" name="logname" class="form-style" placeholder="Nombre de usuario" id="logname" autocomplete="off">
												<i class="input-icon fas fa-user-circle"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="email" name="logemail" class="form-style" placeholder="Email" id="logemail" autocomplete="off">
												<i class="input-icon fa fa-envelope"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" name="logpass" class="form-style" placeholder="Contraseña" id="logpass" autocomplete="off">
												<i class="input-icon fa fa-lock"></i>
											</div>
											<a href="#" class="btn mt-4">Registrar</a>
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
 </form>
<script src="Content/dist/js/bootstrap.min.js"></script>
</body>
</html>






















<%--<form id="form2" runat="server">
        <div>
        </div>
    </form>--%>
