/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import logica.Usuario;

/**
 *
 * @author Juan Rojas
 */
public class UsuarioEliminar {

    public static void main(String[] args) {
        Usuario u = new Usuario();
        u.setIdUsuario(5);
        if (u.eliminarUsuario()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
