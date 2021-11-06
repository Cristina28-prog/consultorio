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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="ac.idMedicamento">
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
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{ac.idCitas}}">
                        </div>
                        <div class="col-6"> 
                            <label>idMedicamento</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{ac.idMedicamento}}">
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
                            <th scope="col">-</th>                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="a in ac.Asignaciones">
                            <td>{{a.idCitas}}</td>
                            <td>-</td>
                            <td>{{a.idMedicamento}}</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="btn btn-info" ng-click="ac.editar(a.idCitas)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('asignacion', []);
            app.controller('asignacionController', ['$http', controladorAsignacion]);
            function controladorAsignacion($http) {
                var ac = this;
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
                };
                ac.actualizar = function () {
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
                };
                ac.eliminar = function () {
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
            }
        </script> 
    </body>
</html>
