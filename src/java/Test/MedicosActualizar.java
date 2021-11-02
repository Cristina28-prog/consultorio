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
public class MedicosActualizar {

    public static void main(String[] args) {
        Medicos m = new Medicos();
        m.setIdMedico(4);
        m.setNombreMedico("Juliana Medellin");
        m.setEspecialidad("Terapia");
        m.setContrasenia("gatico5021");
        if (m.actualizarMedicos()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
