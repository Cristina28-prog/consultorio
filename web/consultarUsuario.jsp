<%-- 
    Document   : consultarUsuario
    Created on : 12/11/2021, 08:08:26 AM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Busqueda de Usuarios</title>
        <!--        <style>div{border:dotted;}</style>-->
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> BUSQUEDA </h1>
        <div class="container-fluid" ng-app="consultarUsuarios" ng-controller="consultarUsuariosController as cu" >
            <div class="row">
                <div class="col-2">
                    Nombre : <input type="checkbox" class="form-control" ng-model="cu.bNombre" ng-init="cu.bNombre = true">
                </div>
                <div class="col-2">
                    Documento : <input type="checkbox" class="form-control" ng-model="cu.bDocumento" ng-init="cu.bDocumento = false">
                </div>
                <div class="col-2">
                    Perfil : <input type="checkbox" class="form-control" ng-model="cu.bPerfil" ng-init="cu.bPerfil = false">
                </div>
                <div class="col-2">
                    Edad : <input type="checkbox" class="form-control" ng-model="cu.bEdad" ng-init="cu.bEdad = false">
                </div>   
            </div>
            <div class="row">
                <div class="col-6" ng-if="cu.bNombre">
                    Buscar por Nombre
                    <input type="text" class="form-control" ng-model="cu.nombreUsuario">
                    <button type="button" class="btn btn-info mt-2" ng-click="cu.consultarPorNombre()">Consultar</button>
                </div>
                <div class="col-6" ng-if="cu.bDocumento" >
                    Buscar por Documento
                    <input type="text" class="form-control" ng-model="cu.documentoUsuario">
                    <button type="button" class="btn btn-info mt-2" ng-click="cu.consultarPorDocumento()">Consultar</button>
                </div>
            </div>
            <div class="row">
                <div class="col-6" ng-if="cu.bPerfil">
                    Buscar por Perfil
                    <input type="text" class="form-control" ng-model="cu.tipoPerfil">
                    <button type="button" class="btn btn-info mt-2" ng-click="cu.consultarPorPerfil()">Consultar</button>
                </div>
                <div class="col-6" ng-if="cu.bEdad">
                    Buscar por Edad
                    <input type="text" class="form-control" ng-model="cu.edad">
                    <button type="button" class="btn btn-info mt-2" ng-click="cu.consultarPorEdad()">Consultar</button>
                </div>
            </div>
            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id Usuario</th>
                            <th scope="col">nombre de Usuario</th>
                            <th scope="col">TDocumento</th>
                            <th scope="col">Documento</th>
                            <th scope="col">contraseña</th>
                            <th scope="col">Tipo de Perfil</th>
                            <th scope="col">Edad</th>
                            <th scope="col">usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="u in cu.Usuarios">
                            <td>{{u.idUsuario}}</td>
                            <td>{{u.nombreUsuario}}</td>
                            <td>{{u.tipoDocumento}}</td>
                            <td>{{u.documentoUsuario}}</td>
                            <td>{{u.contrasenia}}</td>
                            <td>{{u.tipoPerfil}}</td>
                            <td>{{u.edad}}</td>
                            <td>{{u.usuario}}</td>
                        </tr>
                    </tbody>
                </table>
            </div> 
        </div>
        <script>
            var app = angular.module('consultarUsuarios', []);
            app.controller('consultarUsuariosController', ['$http', controladorConsultarUsuarios]);
            function controladorConsultarUsuarios($http) {
                var cu = this;
                cu.consultarPorNombre = function () {
                    var parametros = {
                        proceso: 'consultarIndividualNombre',
                        nombreUsuario: cu.nombreUsuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cu.Usuarios = res.data.Usuarios;
                    });
                };
                cu.consultarPorDocumento = function () {
                    var parametros = {
                        proceso: 'consultarIndividualDocumento',
                        documentoUsuario: cu.documentoUsuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cu.Usuarios = res.data.Usuarios;
                    });
                };
                cu.consultarPorPerfil = function () {
                    var parametros = {
                        proceso: 'consultarIndividualPerfil',
                        tipoPerfil: cu.tipoPerfil
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cu.Usuarios = res.data.Usuarios;
                    });
                };
                cu.consultarPorEdad = function () {
                    var parametros = {
                        proceso: 'consultarIndividualEdad',
                        edad: cu.edad
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesConsultas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cu.Usuarios = res.data.Usuarios;
                    });
                };
            }
        </script> 
    </body>
</html>
