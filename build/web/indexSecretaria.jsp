<%-- 
    Document   : indexSecretaria
    Created on : 17/11/2021, 08:15:28 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Secretary</title>
    </head>
    <body>
        <jsp:include page="menuSecretaria.jsp"/>
        <div class="container-fluid" ng-app="secretaria" ng-controller="secretariaController as sc">
            <div class="row">
                <div class="col-2"><h1>Bienvenid@</h1></div>
                <div class="col-3"> <div class="p-3 mb-2 bg-info text-white">{{sc.Usuario.nombreUsuario}}</div></div>                   
            </div>
            <div class="row">
                <div class="col-6"><h3>Usted tiene privilegios de Secretaria</h3></div>
                <img src="welcome1.png"  width="500" height="250"/>                
            </div>
        </div>
        <script>
            var app = angular.module('secretaria', []);
            app.controller('secretariaController', ['$http', controladorSecretaria]);
            function controladorSecretaria($http) {
                var uc = this;
                var user;
                uc.userName = document.cookie;
                this.user = document.cookie;
                uc.comprobar = function () {
                    var parametros = {
                        proceso: 'consultaUsuario',
                        usuario: this.user
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.Usuario = res.data.Usuario;
                    });
                };
                window.onload = uc.comprobar();
            }
        </script>
    </body>
</html>
