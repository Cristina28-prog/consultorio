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
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <title>JSP Page</title>
        <style>div {border: dotted} </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1> MEDICAMENTOS <h1/>
        <div class="container-fluid" ng-app="medicamentos" ng-controller="medicamentosController as mc">  
            <div class="row" >
                
            </div> 
            <div class="row">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">idMedicamento</th>
                            <th scope="col">nombremedicamento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                        </tr>
                    </tbody>
                </table>
            </div>    
        </div>
        
        <script>
            var = app=angular.module('medicamentos', []);
            app.controller('medicamentoController', ['$http', controladorAutor])
            function controladorAutor($http){}
        </script>    
    </body>
</html>
