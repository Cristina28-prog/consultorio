/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import logica.Medicos;

/**
 *
 * @author Juan Rojas
 */
public class MedicosGuardar {

    public static void main(String[] args) {
        Medicos m = new Medicos();
        m.setNombreMedico("Luciana Ferrer");
        m.setEspecialidad("Terapia");
        m.setContrasenia("raton1452");
        if (m.guardarMedicos()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
