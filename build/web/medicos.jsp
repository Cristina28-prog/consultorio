<%-- 
    Document   : Medicos
    Created on : 5/11/2021, 04:32:19 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="heads.jsp"/>
        <title>Medicos</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> MEDICOS </h1>
        <div class="container-fluid" ng-app="medicos" ng-controller="medicosController as mc" >  
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>idMedico</label>
                            <input type="text" class="form-control" placeholder="id" ng-model="mc.idMedico">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de Medico</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="mc.nombreMedico">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Especialidad</label>
                            <select class="form-control" placeholder="Especialidad" ng-model="mc.especialidad">
                                <option>General</option>
                                <option>Pediatria</option>
                                <option>Cardiologia</option>
                                <option>Terapia</option>
                                <option>Oncologia</option>
                                <option>Neurologia</option>
                            </select>
                        </div>
                        <div class="col-3"> 
                            <label>contraseña</label>
                            <input type="text" class="form-control" placeholder="Contraseña" ng-model="mc.contrasenia">
                        </div>
                        <div class="col-3"> 
                            <label>usuario</label>
                            <input type="text" class="form-control" placeholder="Usuario" ng-model="mc.usuario">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="mc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="mc.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="mc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="mc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6"> 
                            <label>idMedico</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{mc.idMedico}}">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre de Medico</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{mc.nombreMedico}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label>especialidad</label>
                            <input type="text" class="form-control" placeholder="Especialidad" disabled="" value="{{mc.especialidad}}">
                        </div>
                        <div class="col-6"> 
                            <label>Contraseña</label>
                            <input type="text" class="form-control" placeholder="Contraseña" disabled="" value="{{mc.contrasenia}}">
                        </div>
                        <div class="col-3"> 
                            <label>usuario</label>
                            <input type="text" class="form-control" placeholder="Usuario" disabled="" value="{{mc.usuario}}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id Medico</th>
                            <th scope="col">nombre de Medico</th>
                            <th scope="col">Especialidad</th>
                            <th scope="col">contraseña</th>>
                            <th scope="col">Usuario</th>>
                            <th scope="col">-</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="m in mc.Medicos">
                            <td>{{m.idMedico}}</td>
                            <td>{{m.nombreMedico}}</td>
                            <td>{{m.especialidad}}</td>
                            <td>{{m.contrasenia}}</td>
                            <td>{{m.usuario}}</td>
                            <td>
                                <button type="button" class="btn btn-info" ng-click="mc.editar(m.idMedico)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('medicos', []);
            app.controller('medicosController', ['$http', controladorMedicos]);
            function controladorMedicos($http) {
                var mc = this;
                validar = function (tipoDeValidacion) {
                    var idMedico = mc.idMedico;
                    var nombreMedico = mc.nombreMedico;
                    var especialidad = mc.especialidad;
                    var contrasenia = mc.contrasenia;
                    var usuario = mc.usuario;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idMedico && nombreMedico && especialidad && contrasenia && usuario) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'datosSinId') {
                        if (nombreMedico && especialidad && contrasenia && usuario) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idMedico) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                };
                mc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicos.jsp',
                        params: parametros
                    }).then(function (res) {
                        mc.Medicos = res.data.Medicos;
                    });
                };
                mc.guardar = function () {
                    if (validar('datosSinId')) {
                        var parametros = {
                            proceso: 'guardar',
                            nombreMedico: mc.nombreMedico,
                            especialidad: mc.especialidad,
                            contrasenia: mc.contrasenia,
                            usuario: mc.usuario
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesMedicos.jsp',
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
                            text: "Los campos nombre, especialidad y contraseña son obligatorios",
                            icon: "warning",
                            button: "Cerrar"
                        });

                    }
                };
                mc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idMedico: mc.idMedico,
                            nombreMedico: mc.nombreMedico,
                            especialidad: mc.especialidad,
                            contrasenia: mc.contrasenia,
                            usuario: mc.usuario
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesMedicos.jsp',
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
                mc.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idMedico: mc.idMedico
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesMedicos.jsp',
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
                mc.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idMedico: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicos.jsp',
                        params: parametros
                    }).then(function (res) {
                        mc.idMedico = res.data.Medico.idMedico;
                        mc.nombreMedico = res.data.Medico.nombreMedico;
                        mc.especialidad = res.data.Medico.especialidad;
                        mc.contrasenia = res.data.Medico.contrasenia;
                        mc.usuario = res.data.Medico.usuario;
                    });
                };
            }
        </script> 
    </body>
</html>
