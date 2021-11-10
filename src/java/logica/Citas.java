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
public class Citas {

    private int idCitas;
    private int idUsuario;
    private String fecha;
    private int idMedico;
    private Usuario usuario;
    private Medicos medico;

    public Citas() {
    }

    public Citas(int idCitas) {
        this.idCitas = idCitas;
    }

    public Citas(int idCitas, int idUsuario, String fecha, int idMedico) {
        this.idCitas = idCitas;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
        this.idMedico = idMedico;
    }

    public int getIdCitas() {
        return idCitas;
    }

    public void setIdCitas(int idCitas) {
        this.idCitas = idCitas;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Medicos getMedico() {
        return medico;
    }

    public void setMedico(Medicos medico) {
        this.medico = medico;
    }
    
    

    @Override
    public String toString() {
        return "Citas{" + "idCitas=" + idCitas + ", idUsuario=" + idUsuario + ", fecha=" + fecha + ", idMedico=" + idMedico + '}';
    }

    public List<Citas> consultarCitas() {
        List<Citas> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT idCitas, idUsuario, fecha, idMedico\n"
                + "FROM c4b7grupo1.citas;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Citas c;
            while (rs.next()) {
                c = new Citas();
                c.setIdCitas(rs.getInt("idCitas"));
                c.setIdUsuario(rs.getInt("idUsuario"));
                c.setFecha(rs.getString("fecha"));
                c.setIdMedico(rs.getInt("idMedico"));
                Usuario u = new Usuario(c.getIdUsuario()).consultarUsuarioInd();      //Instancio la clase usuario y hago una consulta Con el metodo de consulta individual
                c.setUsuario(u);                                //Se hace el set del objeto usuario a la tabla c
                Medicos m = new Medicos(c.getIdMedico()).consultarMedicoInd();
                c.setMedico(m);
                lista.add(c);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Citas consultarCitasInd() {
        List<Citas> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM c4b7grupo1.citas WHERE idCitas= " + this.idCitas + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Citas c;
            if (rs.next()) {
                this.idUsuario = rs.getInt("idUsuario");
                this.fecha = rs.getString("fecha");
                this.idMedico = rs.getInt("idMedico");
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

    public boolean guardarCitas() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO c4b7grupo1.citas\n"
                + "(idUsuario, fecha, idMedico)\n"
                + "VALUES(" + this.idUsuario + ", '" + this.fecha + "', " + this.idMedico + ");";
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

    public boolean actualizarCitas() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE c4b7grupo1.citas\n"
                + "SET idUsuario= " + this.idUsuario + " ,"
                + "fecha= '" + this.fecha + "' ,"
                + "idMedico= " + this.idMedico + " \n"
                + "WHERE idCitas=" + this.idCitas + ";";
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

    public boolean eliminarCitas() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM c4b7grupo1.citas\n"
                + "WHERE idCitas=" + this.idCitas + ";";
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
