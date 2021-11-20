<%-- 
    Document   : peticionesAsignacion
    Created on : 5/11/2021, 04:21:04 PM
    Author     : Juan Rojas
--%>

<%@page import="logica.Asignacion"%>
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
            int idCitas = Integer.parseInt(request.getParameter("idCitas"));
            int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            Asignacion asg = new Asignacion();
            asg.setIdMedicamento(idMedicamento);
            asg.setIdCitas(idCitas);
            asg.setCantidad(cantidad);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           
            if (asg.guardarAsignacion()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idCitas = Integer.parseInt(request.getParameter("idCitas"));
            Asignacion asg = new Asignacion();
            asg.setIdCitas(idCitas);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (asg.eliminarAsignacion()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Asignacion asg = new Asignacion();
                List<Asignacion> lista = asg.consultarAsignacion();
                respuesta += "\"" + proceso + "\": true,\"Asignaciones\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Asignaciones\":[]";
                Logger.getLogger(Asignacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idCitas = Integer.parseInt(request.getParameter("idCitas"));
                Asignacion asg = new Asignacion(idCitas).consultarAsignacionInd();
                respuesta += "\"" + proceso + "\": true,\"Asignacion\":"  + new Gson().toJson(asg);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Asignacion\": null";
                Logger.getLogger(Asignacion.class.getName()).log(Level.SEVERE, null, ex);

            }
        } else if (proceso.equals("actualizar")) {
            int idCitas = Integer.parseInt(request.getParameter("idCitas"));
            int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            Asignacion asg = new Asignacion();
            asg.setIdCitas(idCitas);
            asg.setIdMedicamento(idMedicamento);
            asg.setCantidad(cantidad);
            //creación de objeto y llamado al metodo actualizar
            if (asg.actualizarAsignacion()) {
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
