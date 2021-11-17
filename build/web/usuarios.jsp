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
        <jsp:include page="heads.jsp"/>
        <title>Usuarios</title>
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
                            <input type="text" class="form-control" placeholder="Id" ng-model="uc.idUsuario">
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
                            <input type="text" class="form-control" placeholder="Documento" ng-model="uc.documentoUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>contraseña</label>
                            <input type="text" class="form-control" placeholder="Contraseña" ng-model="uc.contrasenia">
                        </div>
                        <div class="col-3"> 
                            <label>Tipo de Usuario</label>
                            <select class="form-control" ng-model="uc.tipoPerfil">
                                <option>ADMINISTRADOR</option>
                                <option>SECRETARIA</option>
                                <option>PACIENTE</option>
                            </select>
                        </div>
                        <div class="col-2"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="Edad" ng-model="uc.edad">
                        </div>
                        <div class="col-2"> 
                            <label>Usuario</label>
                            <input type="text" class="form-control" placeholder="usuario" ng-model="uc.usuario">
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
                            <input type="text" class="form-control" placeholder="Id" disabled="" value="{{uc.idUsuario}}">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de Usuario</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{uc.nombreUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Tipo Documento</label>
                            <input type="text" class="form-control" placeholder="Tipo Documento" disabled="" value="{{uc.tipoDocumento}}">
                        </div>
                        <div class="col-6"> 
                            <label>Numero Documento</label>
                            <input type="text" class="form-control" placeholder="Documento" disabled="" value="{{uc.documentoUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3"> 
                            <label>contraseña</label>
                            <input type="text" class="form-control" placeholder="Contraseña" disabled="" value="{{uc.contrasenia}}">
                        </div>
                        <div class="col-6"> 
                            <label>Tipo de Usuario</label>
                            <input type="text" class="form-control" placeholder="Tipo de Usuario" disabled="" value="{{uc.tipoPerfil}}">
                        </div>
                        <div class="col-2"> 
                            <label>Edad</label>
                            <input type="text" class="form-control" placeholder="Edad" disabled="" value="{{uc.edad}}">
                        </div>
                        <div class="col-2"> 
                            <label>Usuario</label>
                            <input type="text" class="form-control" placeholder="usuario" disabled="" value="{{uc.usuario}}">
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
                            <th scope="col">Usuario</th>
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
                            <td>{{u.usuario}}</td>
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
                validar = function (tipoDeValidacion) {
                    var idUsuario = uc.idUsuario ? true : false;
                    var nombreUsuario = uc.nombreUsuario ? true : false;
                    var tipoDocumento = uc.tipoDocumento ? true : false;
                    var documentoUsuario = uc.documentoUsuario ? true : false;
                    var contrasenia = uc.contrasenia ? true : false;
                    var tipoPerfil = uc.tipoPerfil ? true : false;
                    var edad = uc.edad ? true : false;
                    var usuario = uc.usuario ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idUsuario && nombreUsuario && tipoDocumento && documentoUsuario && contrasenia && tipoPerfil && edad && usuario) {
                            return true;
                        } else {
                            return false;
                        }

                    }
                    if (tipoDeValidacion === 'datosSinId') {
                        if (nombreUsuario && tipoDocumento && documentoUsuario && contrasenia && tipoPerfil && edad && usuario) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idUsuario) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                };
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
                    if (validar('datosSinId')) {
                        var parametros = {
                            proceso: 'guardar',
                            nombreUsuario: uc.nombreUsuario,
                            tipoDocumento: uc.tipoDocumento,
                            documentoUsuario: uc.documentoUsuario,
                            contrasenia: uc.contrasenia,
                            tipoPerfil: uc.tipoPerfil,
                            edad: uc.edad, 
                            usuario: uc.usuario
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                    swal({
                                        title: "Hecho",
                                        text: "Guardado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    swal({
                                        title: "Error",
                                        text: "No guardado!",
                                        icon: "error",
                                        button: "Volver"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "No Ejecutado",
                            text: "Los campos son obligatorios",
                            icon: "warning",
                            button: "Cerrar"
                        });

                    }

                };
                uc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idUsuario: uc.idUsuario,
                            nombreUsuario: uc.nombreUsuario,
                            tipoDocumento: uc.tipoDocumento,
                            documentoUsuario: uc.documentoUsuario,
                            contrasenia: uc.contrasenia,
                            tipoPerfil: uc.tipoPerfil,
                            edad: uc.edad, 
                            usuario: uc.usuario
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesUsuario.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.actualizar === true) {//verifica el resultado de la transaccion
                                    swal({
                                        title: "Hecho",
                                        text: "Actualizado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    alert('No Actualizó');
                                }
                            } else {
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "No Ejecutado",
                            text: "Todos los campos son obligatorios",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }

                };
                uc.eliminar = function () {
                    if (validar('soloId')) {
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
                                swal({
                                    title: "Error",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Volver"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "No Ejecutado",
                            text: "El campo ID es obligatorio",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }

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
                        uc.usuario = res.data.Usuario.usuario;
                    });
                };
            }
        </script> 
    </body>
</html>
