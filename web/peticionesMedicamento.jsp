<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Medicamento"%>
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
            String nombreMedicamento = request.getParameter("nombreMedicamento");
            Medicamento med = new Medicamento();
            med.setNombreMedicamento(nombreMedicamento);

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar           
            if (med.guardarMedicamento()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
            Medicamento med = new Medicamento();
            med.setIdMedicamento(idMedicamento);
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            if (med.eliminarMedicamento()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                Medicamento med = new Medicamento();
                List<Medicamento> lista = med.consultarMedicamento();
                respuesta += "\"" + proceso + "\": true,\"Medicamentos\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Medicamentos\":[]";
                Logger.getLogger(Medicamento.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultaIndividual")) {
            try {
                int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
                Medicamento med = new Medicamento(idMedicamento).consultarMedicamentoInd();
                respuesta += "\"" + proceso + "\": true,\"Medicamento\":"  + new Gson().toJson(med);;

            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Medicamento\": null";
                Logger.getLogger(Medicamento.class.getName()).log(Level.SEVERE, null, ex);

            }
        } else if (proceso.equals("actualizar")) {
            int idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
            String nombreMedicamento = request.getParameter("nombreMedicamento");
            Medicamento med = new Medicamento();
            med.setIdMedicamento(idMedicamento);
            med.setNombreMedicamento(nombreMedicamento);
            //creación de objeto y llamado al metodo actualizar
            if (med.actualizarMedicamento()) {
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