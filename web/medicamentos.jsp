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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Medicamentos</title>

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
                validar = function (tipoDeValidacion) {
                    var idMedicamento = mc.idMedicamento ? true : false;
                    var nombreMedicamento = mc.nombreMedicamento ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idMedicamento && nombreMedicamento) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloNombre') {
                        if (nombreMedicamento) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                    if (tipoDeValidacion === 'soloId') {
                        if (idMedicamento) {
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
                        url: 'peticionesMedicamento.jsp',
                        params: parametros
                    }).then(function (res) {
                        mc.Medicamentos = res.data.Medicamentos;
                    });
                };
                mc.guardar = function () {
                    if (validar('soloNombre')) {
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
                                    //alert('Guardó');
                                    swal({
                                        title: "Hecho",
                                        text: "Guardado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
                                } else {
                                    // alert('No guardó');
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
                        //alert('El campo nombre el obligatorio');
                        swal({
                            title: "No Ejecutado",
                            text: "El campo nombre es obligatorio",
                            icon: "warning",
                            button: "Cerrar"
                        });

                    }

                };
                mc.actualizar = function () {
                    if (validar('todosLosCampos')) {
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
                                    //alert('Actualizó');
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
                        //alert('Todos Los campos son obligatorios');
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
                            idMedicamento: mc.idMedicamento
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesMedicamento.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
                                    //alert('Eliminado');
                                    swal({
                                        title: "Hecho",
                                        text: "Eliminado Exitosamente!",
                                        icon: "success",
                                        button: "Volver"
                                    });
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
                        //alert('El campo ID es obligatorio');
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
                        idMedicamento: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesMedicamento.jsp',
                        params: parametros
                    }).then(function (res) {
                        mc.idMedicamento = res.data.Medicamento.idMedicamento;
                        mc.nombreMedicamento = res.data.Medicamento.nombreMedicamento;
                    });
                };
            }
        </script>    
    </body>
</html>
