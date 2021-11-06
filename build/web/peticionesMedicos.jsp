<%-- 
    Document   : peticionesMedicos
    Created on : 5/11/2021, 03:03:16 PM
    Author     : Juan Rojas
--%>

<%@page import="logica.Medicos"%>
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
            String nombreMedico = request.getParameter("nombreMedico");
            String especialidad = request.getParameter("especialidad");
            String contrasenia = request.getParameter("contrasenia");
            Medicos med = new Medicos();
            med.setNombreMedico(nombreMedico);
            med.setEspecialidad(especialidad);
            med.setContrasenia(contrasenia);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           

            if (med.guardarMedicos()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            Medicos med = new Medicos();
            med.setIdMedico(idMedico);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (med.eliminarMedicos()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Medicos med = new Medicos();
                List<Medicos> lista = med.consultarMedicos();
                respuesta += "\"" + proceso + "\": true,\"Medicos\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Medicos\":[]";
                Logger.getLogger(Medicos.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idMedico = Integer.parseInt(request.getParameter("idMedico"));
                Medicos med = new Medicos(idMedico).consultarMedicoInd();
                respuesta += "\"" + proceso + "\": true,\"Medico\":" + new Gson().toJson(med);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Medico\": null";
                Logger.getLogger(Medicos.class.getName()).log(Level.SEVERE, null, ex);

            }

        } else if (proceso.equals("actualizar")) {
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            String nombreMedico = request.getParameter("nombreMedico");
            String especialidad = request.getParameter("especialidad");
            String contrasenia = request.getParameter("contrasenia");
            Medicos med = new Medicos();
            med.setIdMedico(idMedico);
            med.setNombreMedico(nombreMedico);
            med.setEspecialidad(especialidad);
            med.setContrasenia(contrasenia);
            //creación de objeto y llamado al metodo actualizar
            if (med.actualizarMedicos()) {
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
