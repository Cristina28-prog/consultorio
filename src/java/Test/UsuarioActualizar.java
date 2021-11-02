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
public class UsuarioActualizar {

    public static void main(String[] args) {
        Usuario u = new Usuario();
        u.setIdUsuario(3);
        u.setNombreUsuario("Catalina arciniegas");
        u.setTipoDocumento("TI");
        u.setDocumentoUsuario("1456897545");
        u.setContrasenia("0000");
        u.setTipoPerfil("PACIENTE");
        u.setEdad(71);
        if (u.actualizarUsuario()) {
            System.out.println("Ejecutada");
        } else {
            System.out.println("No ejecutada");
        }
    }

}
