<%-- 
    Document   : index
    Created on : 2/11/2021, 08:24:42 AM
    Author     : Juan Rojas
    <style>div {border: dotted} </style>
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
    <body >
        <jsp:include page="menu.jsp"/>
        <h1> MEDICAMENTOS </h1>
        <div class="container-fluid" ng-app="medicamento" ng-controller="medicamentoController as mc" >  
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6"> 
                            <label>idMedicamento</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="mc.idMedicamento">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre Medicamento</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="mc.nombreMedicamento">
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
                            <label>idMedicamento</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{mc.idMedicamento}}">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre Medicamento</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{mc.nombreMedicamento}}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">id Medicamento</th>
                            <th scope="col">nombre Medicamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="m in mc.Medicamentos">
                            <td>{{m.idMedicamento}}</td>
                            <td>{{m.nombreMedicamento}}</td>
                            <td>
                                <button type="button" class="btn btn-info" ng-click="mc.editar(m.idMedicamento)">Editar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        <script>
            var app = angular.module('medicamento', []);
            app.controller('medicamentoController', ['$http', controladorMedicamento]);
            function controladorMedicamento($http) {
                var mc = this;
                mc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicamento.jsp',
                        params: parametros
                    }).then(function (res) {
                        mc.Medicamentos = res.data.Medicamentos;
                    });
                };
                mc.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        nombreMedicamento: mc.nombreMedicamento
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicamento.jsp',
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
                mc.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idMedicamento: mc.idMedicamento,
                        nombreMedicamento: mc.nombreMedicamento
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicamento.jsp',
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
                mc.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idMedicamento: mc.idMedicamento
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicamento.jsp',
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
                mc.editar=function(id){
                    var parametros={
                        proceso:'consultaIndividual',
                        idMedicamento:id
                    };
                    $http({
                        method:'POST',
                        url:'peticionesMedicamento.jsp',
                        params:parametros
                    }).then(function(res){
                        mc.idMedicamento=res.data.Medicamento.idMedicamento;
                        mc.nombreMedicamento=res.data.Medicamento.nombreMedicamento;
                    });
                };
            }
        </script>    
    </body>
</html>
