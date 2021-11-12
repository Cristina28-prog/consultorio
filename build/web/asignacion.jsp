<%-- 
    Document   : asignacion
    Created on : 5/11/2021, 07:06:29 PM
    Author     : Juan Rojas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Asignacion</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> ASIGNACION </h1>
        <div class="container-fluid" ng-app="asignacion" ng-controller="asignacionController as ac" >  
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>idCitas</label>
                            <input type="text" class="form-control" placeholder="id" ng-model="ac.idCitas">
                        </div>
                        <div class="col-6"> 
                            <label>id Medicamento</label>
                            <input type="text" class="form-control" placeholder="Medicamento (id)" ng-model="ac.idMedicamento">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3"> 
                            <button type="button" class="btn btn-success" ng-click="ac.guardar()">Guardar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-primary" ng-click="ac.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="ac.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-danger" ng-click="ac.eliminar()">Eliminar</button>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6"> 
                            <label>idCitas</label>
                            <input type="text" class="form-control" placeholder="id" disabled="" value="{{ac.idCitas}}">
                        </div>
                        <div class="col-6"> 
                            <label>idMedicamento</label>
                            <input type="text" class="form-control" placeholder="Medicamento (id)" disabled="" value="{{ac.idMedicamento}}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id Cita</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">idMedicamento</th>
                            <th scope="col">Nombre Medicamento</th>>
                            <th scope="col">Funciones</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="a in ac.Asignaciones">
                            <td>{{a.idCitas}}</td>
                            <td>{{a.usuario.nombreUsuario}}</td>
                            <td>{{a.idMedicamento}}</td>
                            <td>{{a.medicamento.nombreMedicamento}}</td>
                            <td>
                                <div class="row">
                                    <div class="col-6">
                                        <button type="button" class="btn btn-primary" ng-click="ac.editar(a.idCitas)">Editar</button>
                                    </div>
                                    <div class="col-6">
                                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#verMasModal" ng-click="ac.verMas(a.idCitas)">Detalles</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div> 

            <!-- Modal Detalles__Muestra datos llaves foraneas-->
            <div class="modal fade" id="verMasModal" tabindex="-1" aria-labelledby="verMasModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="verMasModalLabel">Detalles de cita</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-6"> 
                                    <label>Nombre de Usuario</label>
                                    <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{ac.usuario.nombreUsuario}}">
                                </div>
                                <div class="col-6">
                                    <label>Edad</label>
                                    <input type="text" class="form-control" placeholder="Edad" disabled="" value="{{ac.usuario.edad}}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6"> 
                                    <label>Tipo Documento</label>
                                    <input type="text" class="form-control" placeholder="Tipo Documento" disabled="" value="{{ac.usuario.tipoDocumento}}">
                                </div>
                                <div class="col-6"> 
                                    <label>Numero Documento</label>
                                    <input type="text" class="form-control" placeholder="Documento" disabled="" value="{{ac.usuario.documentoUsuario}}">
                                </div>
                            </div>
                            <br/><br/>
                            <div class="row">
                                <div class="col-6"> 
                                    <label>Medico</label>
                                    <input type="text" class="form-control" placeholder="Contraseña" disabled="" value="{{ac.medico.nombreMedico}}">
                                </div>
                                <div class="col-6"> 
                                    <label>Especialidad</label>
                                    <input type="text" class="form-control" placeholder="Tipo de Usuario" disabled="" value="{{ac.medico.especialidad}}">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script>
            var app = angular.module('asignacion', []);
            app.controller('asignacionController', ['$http', controladorAsignacion]);
            function controladorAsignacion($http) {
                var ac = this;
                validar = function (tipoDeValidacion) {
                    var idCitas = ac.idCitas;
                    var idMedicamento = ac.idMedicamento;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idCitas && idMedicamento) {
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
                ac.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAsignacion.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.Asignaciones = res.data.Asignaciones;
                    });
                };
                ac.guardar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'guardar',
                            idCitas: ac.idCitas,
                            idMedicamento: ac.idMedicamento
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAsignacion.jsp',
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
                    } else {
                        alert('Todos los campos son necesarios');
                    }

                };
                ac.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idCitas: ac.idCitas,
                            idMedicamento: ac.idMedicamento
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAsignacion.jsp',
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
                    } else {
                        alert('Todos los campos son necesarios');
                    }
                };
                ac.eliminar = function () {
                    if (validar('soloId')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idCitas: ac.idCitas
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAsignacion.jsp',
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
                    } else {
                        alert('El campo ID es necesario');
                    }
                };
                ac.editar = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idCitas: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAsignacion.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.idCitas = res.data.Asignacion.idCitas;
                        ac.idMedicamento = res.data.Asignacion.idMedicamento;
                    });
                };
                ac.verMas = function (id) {
                    var parametros = {
                        proceso: 'consultaIndividual',
                        idCitas: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAsignacion.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.idCitas = res.data.Asignacion.idCitas;
                        ac.usuario = res.data.Asignacion.usuario;
                        ac.medico = res.data.Asignacion.medico;
                    });
                };
            }
        </script> 
    </body>
</html>
