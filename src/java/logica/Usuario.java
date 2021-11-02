/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author Juan Rojas
 */
public class Usuario {

    private int idUsuario;
    private String nombreUsuario;
    private String tipoDocumento;
    private String documentoUsuario;
    private String contrasenia;
    private String tipoPerfil;
    private int edad;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombreUsuario, String tipoDocumento, String documentoUsuario, String contrasenia, String tipoPerfil, int edad) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.tipoDocumento = tipoDocumento;
        this.documentoUsuario = documentoUsuario;
        this.contrasenia = contrasenia;
        this.tipoPerfil = tipoPerfil;
        this.edad = edad;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getDocumentoUsuario() {
        return documentoUsuario;
    }

    public void setDocumentoUsuario(String documentoUsuario) {
        this.documentoUsuario = documentoUsuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getTipoPerfil() {
        return tipoPerfil;
    }

    public void setTipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombreUsuario=" + nombreUsuario + ", tipoDocumento=" + tipoDocumento + ", documentoUsuario=" + documentoUsuario + ", contrasenia=" + contrasenia + ", tipoPerfil=" + tipoPerfil + ", edad=" + edad + '}';
    }

    public List<Usuario> consultarUsuario() {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT idUsuario, nombreUsuario, tipoDocumento, documentoUsuario, contrasenia, tipoPerfil, edad\n"
                + "FROM c4b7grupo1.usuario;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuario u;
            while (rs.next()) {
                u = new Usuario();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombreUsuario(rs.getString("nombreUsuario"));
                u.setTipoDocumento(rs.getString("tipoDocumento"));
                u.setDocumentoUsuario(rs.getString("documentoUsuario"));
                u.setContrasenia(rs.getString("contrasenia"));
                u.setTipoPerfil(rs.getString("tipoPerfil"));
                u.setEdad(rs.getInt("edad"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public boolean guardarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO c4b7grupo1.usuario\n"
                + "(nombreUsuario, tipoDocumento, documentoUsuario, contrasenia, tipoPerfil, edad)\n"
                + "VALUES('" + this.nombreUsuario + "', '" + this.tipoDocumento + "', '" + this.documentoUsuario + "', '" + this.contrasenia + "', '" + tipoPerfil + "', " + this.edad + ");";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }



    public boolean actualizarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE c4b7grupo1.usuario \n"
                     + "SET nombreUsuario='"+this.nombreUsuario+"'," 
                     + "tipoDocumento='"+this.tipoDocumento+"',"
                     + "documentoUsuario='"+this.documentoUsuario+"',"
                     +"contrasenia='"+this.contrasenia+"'," 
                     +"tipoPerfil='"+this.tipoPerfil+"',"
                     +"edad="+this.edad+"\n"
                     +"WHERE idUsuario="+this.idUsuario+";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean eliminarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM c4b7grupo1.usuario\n"
                     + "WHERE idUsuario=" + this.idUsuario + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

}
