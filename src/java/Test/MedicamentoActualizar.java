/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import logica.Medicamento;

/**
 *
 * @author Juan Rojas
 */
public class MedicamentoActualizar {

    public static void main(String[] args) {
        Medicamento m = new Medicamento();
        m.setIdMedicamento(7);
        m.setNombreMedicamento("Propoleo");
        if (m.actualizarMedicamento()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
