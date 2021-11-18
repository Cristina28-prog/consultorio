<%-- 
    Document   : login
    Created on : 17/11/2021, 07:29:15 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <jsp:include page="heads.jsp"/>
        <title>Login</title>
    </head>
    <body>
        <div>    
            <section class="vh-100" ng-app = "login" ng-controller="loginController as lc">
                <div class="container py-5 h-100">
                    <div class="row d-flex align-items-center justify-content-center h-100">
                        <div class="col-md-8 col-lg-7 col-xl-6">
                            <img src="img/logo.png" class="img-fluid" alt="TicSalud Logo">
                        </div>
                        <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                            <form>
                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <input type="text"  class="form-control form-control-lg"  ng-model="lc.usuario"/>
                                    <label class="form-label" for="form1Example13">Usuario</label>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <input type="password" id="contraseniaForm" class="form-control form-control-lg" ng-model="lc.contrasenia"/>
                                    <label class="form-label" for="form1Example23">Contraseña</label>
                                </div>

                                <div class="d-flex justify-content-around align-items-center mb-4">
                                    <!-- Checkbox -->
                                    <div class="form-check">
                                        <input
                                            class="form-check-input"
                                            type="checkbox"
                                            value=""
                                            id="form1Example3"
                                            checked
                                            />
                                        <label class="form-check-label" for="form1Example3"> Recordarme </label>
                                    </div>
                                    <a href="#!">Olvidó la contraseña?</a>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" class="btn btn-primary btn-lg btn-block" ng-click="lc.comprobar(lc.usuario)">Ingresar</button>

                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
         <script>
            var app = angular.module('login', []);
            app.controller('loginController', ['$http', controladorLogin]);
            function controladorLogin($http) {
                var lc = this;
                lc.comprobar = function (usuario) {
                    var parametros = {
                        proceso: 'consultaUsuario', 
                        usuario: usuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        lc.Usuario = res.data.Usuario;
                        if(lc.Usuario.contrasenia === lc.contrasenia){
                            document.cookie = lc.Usuario.usuario;
                            if(lc.Usuario.tipoPerfil === "ADMINISTRADOR"){window.location.href = 'indexAdmin.jsp';}
                            if(lc.Usuario.tipoPerfil === "SECRETARIA"){window.location.href = 'indexSecretaria.jsp';}
                            //if(lc.Usuario.tipoPerfil === "USUARIO"){window.location.href = 'indexUsuario.jsp';}
                        }
                    });
                };
            }

        </script>
    </body>
</html>
