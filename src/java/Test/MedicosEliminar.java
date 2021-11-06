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
public class MedicosEliminar {

    public static void main(String[] args) {
        Medicos m = new Medicos();
        m.setIdMedico(5);
        if (m.eliminarMedicos()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
