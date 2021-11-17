<%-- 
    Document   : citas
    Created on : 5/11/2021, 06:07:23 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Citas</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> CITAS </h1>
        <div class="container-fluid" ng-app="citas" ng-controller="citasController as cc" >  
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>idCitas</label>
                            <input type="text" class="form-control" placeholder="id Cita" ng-model="cc.idCitas">
                        </div>
                        <div class="col-6"> 
                            <label>id Usuario</label>
                            <input type="text" class="form-control" placeholder="Usuario (id)" ng-model="cc.idUsuario">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Fecha</label>
                            <input type="text" class="form-control" placeholder="Fecha yyyy-mm-dd" ng-model="cc.fecha">
                        </div>
                        <div class="col-6"> 
                            <label>idMedico</label>
                            <input type="text" class="form-control" placeholder="Medico (id)" ng-model="cc.idMedico">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="cc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="cc.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="cc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="cc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6"> 
                            <label>idCitas</label>
                            <input type="text" class="form-control" placeholder="id Cita" disabled="" value="{{cc.idCitas}}">
                        </div>
                        <div class="col-6"> 
                            <label>idUsuario</label>
                            <input type="text" class="form-control" placeholder="Usuario (id)" disabled="" value="{{cc.idUsuario}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Fecha</label>
                            <input type="text" class="form-control" placeholder="Fecha yyyy-mm-dd" disabled="" value="{{cc.fecha}}">
                        </div>
                        <div class="col-6"> 
                            <label>idMedico</label>
                            <input type="text" class="form-control" placeholder="Medico (id)" disabled="" value="{{cc.idMedico}}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id Cita</th>
                            <th scope="col">idUsuario</th>
                            <th scope="col">Nombre de Usuario</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">idMedico</th>>
                            <th scope="col">Nombre de Medico</th>
                            <th scope="col">-</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="c in cc.Citas">
                            <td>{{c.idCitas}}</td>
                            <td>{{c.idUsuario}}</td>
                            <td>{{c.usuario.nombreUsuario}}</td>
                            <td>{{c.fecha}}</td>
                            <td>{{c.idMedico}}</td>
                            <td>{{c.medico.nombreMedico}}</td>
                            <td>
                                <button type="button" class="btn btn-info" ng-click="cc.editar(c.idCitas)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('citas', []);
            app.controller('citasController', ['$http', controladorCitas]);
            function controladorCitas($http) {
                var cc = this;
                validar = function (tipoDeValidacion) {
                    var idCitas = cc.idCitas;
                    var idUsuario = cc.idUsuario;
                    var fecha = cc.fecha;
                    var idMedico = cc.idMedico;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idCitas && idUsuario && fecha && idMedico) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'datosSinId') {
                        if (idUsuario && fecha && idMedico) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idCitas) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                };
                cc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCitas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cc.Citas = res.data.Citas;
                    });
                };
                cc.guardar = function () {
                    if (validar('datosSinId')) {
                        var parametros = {
                            proceso: 'guardar',
                            idUsuario: cc.idUsuario,
                            fecha: cc.fecha,
                            idMedico: cc.idMedico
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCitas.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                    alert('Guardó');
                                } else {
                                    alert('No guardó');
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
                            text: "Los campos idUsuario, Fecha, IdMedico son obligatorios",
                            icon: "warning",
                            button: "Cerrar"
                        });

                    }

                };
                cc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idCitas: cc.idCitas,
                            idUsuario: cc.idUsuario,
                            fecha: cc.fecha,
                            idMedico: cc.idMedico
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCitas.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.actualizar === true) {//verifica el resultado de la transaccion
                                    alert('Actualizó');
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
                cc.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idCitas: cc.idCitas
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCitas.jsp',
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
                cc.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idCitas: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCitas.jsp',
                        params: parametros
                    }).then(function (res) {
                        cc.idCitas = res.data.Cita.idCitas;
                        cc.idUsuario = res.data.Cita.idUsuario;
                        cc.fecha = res.data.Cita.fecha;
                        cc.idMedico = res.data.Cita.idMedico;

                    });
                };
            }
        </script> 
    </body>
</html>
