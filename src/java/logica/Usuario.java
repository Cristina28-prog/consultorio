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
    private String usuario;

    public Usuario() {
    }

    public Usuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Usuario(int idUsuario, String nombreUsuario, String tipoDocumento, String documentoUsuario, String contrasenia, String tipoPerfil, int edad, String usuario) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.tipoDocumento = tipoDocumento;
        this.documentoUsuario = documentoUsuario;
        this.contrasenia = contrasenia;
        this.tipoPerfil = tipoPerfil;
        this.edad = edad;
        this.usuario = usuario;
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

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombreUsuario=" + nombreUsuario + ", tipoDocumento=" + tipoDocumento + ", documentoUsuario=" + documentoUsuario + ", contrasenia=" + contrasenia + ", tipoPerfil=" + tipoPerfil + ", edad=" + edad + '}';
    }

    public List<Usuario> consultarUsuario() {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario;";
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
                u.setUsuario(rs.getString("usuario"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public List<Usuario> consultarUsuarioPorNombre(String nombre) {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE nombreUsuario LIKE '%" + nombre + "%'";
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
                u.setUsuario(rs.getString("usuario"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public List<Usuario> consultarUsuarioPorDocumento(String documento) {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE documentoUsuario LIKE '%" + documento + "%'";
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
                u.setUsuario(rs.getString("usuario"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public List<Usuario> consultarUsuarioPorPerfil(String perfil) {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE tipoPerfil LIKE '%" + perfil + "%'";
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
                u.setUsuario(rs.getString("usuario"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Usuario consultarUsuarioPorUsuario(String user) {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE usuario=  '" + user + "'";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            while (rs.next()) {
                this.idUsuario = rs.getInt("idUsuario");
                this.nombreUsuario = rs.getString("nombreUsuario");
                this.tipoDocumento = rs.getString("tipoDocumento");
                this.documentoUsuario =rs.getString("documentoUsuario");
                this.contrasenia = rs.getString("contrasenia");
                this.tipoPerfil = rs.getString("tipoPerfil");
                this.edad = rs.getInt("edad");
                this.usuario = rs.getString("usuario");
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public List<Usuario> consultarUsuarioPorEdad(int edad) {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE edad= " + edad + "";
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
                u.setUsuario(rs.getString("usuario"));
                lista.add(u);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Usuario consultarUsuarioInd() {
        List<Usuario> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM usuario WHERE idusuario= " + this.idUsuario + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Usuario u;
            if (rs.next()) {
                this.nombreUsuario = rs.getString("nombreUsuario");
                this.tipoDocumento = rs.getString("tipoDocumento");
                this.documentoUsuario = rs.getString("documentoUsuario");
                this.tipoPerfil = rs.getString("tipoPerfil");
                this.contrasenia = rs.getString("contrasenia");
                this.edad = rs.getInt("edad");
                this.usuario = rs.getString("usuario");
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO usuario\n"
                + "(nombreUsuario, tipoDocumento, documentoUsuario, contrasenia, tipoPerfil, edad, usuario)\n"
                + "VALUES('" + this.nombreUsuario + "', '" + this.tipoDocumento + "', '" + this.documentoUsuario + "', '" + this.contrasenia + "', '" + this.tipoPerfil + "', " + this.edad + ", '" + this.usuario + "');";
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
        String sql = "UPDATE usuario \n"
                + "SET nombreUsuario='" + this.nombreUsuario + "',"
                + "tipoDocumento='" + this.tipoDocumento + "',"
                + "documentoUsuario='" + this.documentoUsuario + "',"
                + "contrasenia='" + this.contrasenia + "',"
                + "tipoPerfil='" + this.tipoPerfil + "',"
                + "edad=" + this.edad + ","
                + "usuario='" + this.usuario + "'\n"
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

    public boolean eliminarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM usuario\n"
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
