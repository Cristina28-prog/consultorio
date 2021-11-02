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
public class UsuarioGuardar {

    public static void main(String[] args) {
        Usuario u = new Usuario();
        u.setNombreUsuario("Tatiana Santamaria");
        u.setTipoDocumento("TI");
        u.setDocumentoUsuario("145687952");
        u.setContrasenia("0000");
        u.setTipoPerfil("PACIENTE");
        u.setEdad(14);
        if (u.guardarUsuario()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }
}
