/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.List;
import logica.Usuario;

/**
 *
 * @author Juan Rojas
 */
public class UsuarioConsulta {

    public static void main(String[] args) {
        Usuario d = new Usuario();
        List<Usuario> lista = d.consultarUsuario();
        for (Usuario dem : lista) {
            System.out.println(dem);
        }
    }

}
