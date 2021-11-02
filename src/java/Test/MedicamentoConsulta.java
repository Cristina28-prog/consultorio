/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.List;
import logica.Medicamento;

/**
 *
 * @author Juan Rojas
 */
public class MedicamentoConsulta {

    public static void main(String[] args) {
        Medicamento m = new Medicamento();
        List<Medicamento> lista = m.consultarMedicamento();
        for (Medicamento dem : lista) {
            System.out.println(dem);
        }
    }
}
