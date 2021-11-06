<%-- 
    Document   : index
    Created on : 2/11/2021, 08:24:42 AM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> USUARIOS </h1>
        <div class="container-fluid" ng-app="usuario" ng-controller="usuarioController as uc" >  
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>idUsuario</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="uc.idUsuario">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de Usuario</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="uc.nombreUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Tipo Documento</label>
                            <select class="form-control" ng-model="uc.tipoDocumento">
                                <option>CC</option>
                                <option>TI</option>
                                <option>CE</option>
                            </select>
                        </div>
                        <div class="col-6"> 
                            <label>Numero Documento</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="uc.documentoUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>contraseña</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="uc.contrasenia">
                        </div>
                        <div class="col-6"> 
                            <label>Tipo de Usuario</label>
                            <select class="form-control" ng-model="uc.tipoPerfil">
                                <option>ADMINISTRADOR</option>
                                <option>SECRETARIA</option>
                                <option>PACIENTE</option>
                            </select>
                        </div>
                        <div class="col-6"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="uc.edad">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="uc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="uc.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="uc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="uc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6"> 
                            <label>idUsuario</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.idUsuario}}">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de Usuario</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.nombreUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Tipo Documento</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.tipoDocumento}}">
                        </div>
                        <div class="col-6"> 
                            <label>Numero Documento</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.documentoUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>contraseña</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.contrasenia}}">
                        </div>
                        <div class="col-6"> 
                            <label>Tipo de Usuario</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.tipoPerfil}}">
                        </div>
                        <div class="col-6"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{uc.edad}}">
                        </div>
                    </div>
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
                            <th scope="col">-</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="u in uc.Usuarios">
                            <td>{{u.idUsuario}}</td>
                            <td>{{u.nombreUsuario}}</td>
                            <td>{{u.tipoDocumento}}</td>
                            <td>{{u.documentoUsuario}}</td>
                            <td>{{u.contrasenia}}</td>
                            <td>{{u.tipoPerfil}}</td>
                            <td>{{u.edad}}</td>
                            <td>
                                <button type="button" class="btn btn-info" ng-click="uc.editar(u.idUsuario)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('usuario', []);
            app.controller('usuarioController', ['$http', controladorUsuario]);
            function controladorUsuario($http) {
                var uc = this;
                uc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.Usuarios = res.data.Usuarios;
                    });
                };
                uc.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        nombreUsuario: uc.nombreUsuario,
                        tipoDocumento: uc.tipoDocumento,
                        documentoUsuario: uc.documentoUsuario,
                        contrasenia: uc.contrasenia,
                        tipoPerfil: uc.tipoPerfil,
                        edad: uc.edad
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {//verificar si el proceso existe
                            if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                alert('Guardó');
                            } else {
                                alert('No guardó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                uc.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idUsuario: uc.idUsuario,
                        nombreUsuario: uc.nombreUsuario,
                        tipoDocumento: uc.tipoDocumento,
                        documentoUsuario: uc.documentoUsuario,
                        contrasenia: uc.contrasenia,
                        tipoPerfil: uc.tipoPerfil,
                        edad: uc.edad
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {//verificar si el proceso existe
                            if (res.data.actualizar === true) {//verifica el resultado de la transaccion
                                alert('Actualizó');
                            } else {
                                alert('No Actualizó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                uc.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idUsuario: uc.idUsuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.eliminar === true) {
                                alert('Eliminado');
                            } else {
                                alert('No Eliminado');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                uc.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idUsuario: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        uc.idUsuario = res.data.Usuario.idUsuario;
                        uc.nombreUsuario = res.data.Usuario.nombreUsuario;
                        uc.tipoDocumento = res.data.Usuario.tipoDocumento;
                        uc.documentoUsuario = res.data.Usuario.documentoUsuario;
                        uc.contrasenia = res.data.Usuario.contrasenia;
                        uc.tipoPerfil = res.data.Usuario.tipoPerfil;
                        uc.edad = res.data.Usuario.edad;
                    });
                };
            }
        </script> 

    </body>
</html>
