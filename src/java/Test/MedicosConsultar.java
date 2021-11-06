/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.List;
import logica.Medicos;

/**
 *
 * @author Juan Rojas
 */
public class MedicosConsultar {

    public static void main(String[] args) {
        Medicos m = new Medicos();
        List<Medicos> lista = m.consultarMedicos();
        for (Medicos dem : lista) {
            System.out.println(dem);
        }
    }
}
