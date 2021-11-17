<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Usuario"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";
    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "consultarIndividualNombre",
        "consultarIndividualDocumento",
        "consultarIndividualPerfil",
        "consultarIndividualEdad"
    });
    String proceso = "" + request.getParameter("proceso");
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("consultarIndividualNombre")) {
            try {
                String nombre = request.getParameter("nombreUsuario");
                List<Usuario> lista = new Usuario().consultarUsuarioPorNombre(nombre);
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (proceso.equals("consultarIndividualDocumento")) {
            try {
                String documento = request.getParameter("documentoUsuario");
                List<Usuario> lista = new Usuario().consultarUsuarioPorDocumento(documento);
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualPerfil")) {
            try {
                String perfil = request.getParameter("tipoPerfil");
                List<Usuario> lista = new Usuario().consultarUsuarioPorPerfil(perfil);
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualEdad")) {
            try {
                int edad = Integer.parseInt(request.getParameter("edad"));
                List<Usuario> lista = new Usuario().consultarUsuarioPorEdad(edad);
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Usuarios\":[]";
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>


