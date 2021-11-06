<%-- 
    Document   : peticionesCitas
    Created on : 5/11/2021, 04:07:27 PM
    Author     : Juan Rojas
--%>

<%@page import="logica.Citas"%>
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
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultaIndividual"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String fecha = request.getParameter("fecha");
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            Citas cit = new Citas();
            cit.setIdUsuario(idUsuario);
            cit.setFecha(fecha);
            cit.setIdMedico(idMedico);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           
            if (cit.guardarCitas()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idCitas = Integer.parseInt(request.getParameter("idCitas"));
            Citas cit = new Citas();
            cit.setIdCitas(idCitas);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (cit.eliminarCitas()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Citas cit = new Citas();
                List<Citas> lista = cit.consultarCitas();
                respuesta += "\"" + proceso + "\": true,\"Citas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Citas\":[]";
                Logger.getLogger(Citas.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idCitas = Integer.parseInt(request.getParameter("idCitas"));
                Citas cit = new Citas(idCitas).consultarCitasInd();
                respuesta += "\"" + proceso + "\": true,\"Cita\":"  + new Gson().toJson(cit);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Cita\": null";
                Logger.getLogger(Citas.class.getName()).log(Level.SEVERE, null, ex);

            }
        } else if (proceso.equals("actualizar")) {
            int idCitas = Integer.parseInt(request.getParameter("idCitas"));
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String fecha = request.getParameter("fecha");
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            Citas cit = new Citas();
            cit.setIdCitas(idCitas);
            cit.setIdUsuario(idUsuario);
            cit.setFecha(fecha);
            cit.setIdMedico(idMedico);
            //creación de objeto y llamado al metodo actualizar
            if (cit.actualizarCitas()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
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
