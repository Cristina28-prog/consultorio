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
public class Medicos {

    private int idMedico;
    private String nombreMedico;
    private String especialidad;
    private String contrasenia;

    public Medicos() {
    }

    public Medicos(int idMedico) {
        this.idMedico = idMedico;
    }

    public Medicos(int idMedico, String nombreMedico, String especialidad, String contrasenia) {
        this.idMedico = idMedico;
        this.nombreMedico = nombreMedico;
        this.especialidad = especialidad;
        this.contrasenia = contrasenia;
    }

    public int getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    @Override
    public String toString() {
        return "Medicos{" + "idMedico=" + idMedico + ", nombreMedico=" + nombreMedico + ", especialidad=" + especialidad + ", contrasenia=" + contrasenia + '}';
    }

    public List<Medicos> consultarMedicos() {
        List<Medicos> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT idMedico, nombreMedico, especialidad, contrasenia\n"
                + "FROM c4b7grupo1.medicos;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Medicos m;
            while (rs.next()) {
                m = new Medicos();
                m.setIdMedico(rs.getInt("idMedico"));
                m.setNombreMedico(rs.getString("nombreMedico"));
                m.setEspecialidad(rs.getString("especialidad"));
                m.setContrasenia(rs.getString("contrasenia"));
                lista.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Medicos consultarMedicoInd() {
        List<Medicos> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM c4b7grupo1.medicos WHERE idMedico= " + this.idMedico + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Medicos m;
            if (rs.next()) {
                this.nombreMedico = rs.getString("nombreMedico");
                this.especialidad = rs.getString("especialidad");
                this.contrasenia = rs.getString("contrasenia");
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

    public boolean guardarMedicos() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO c4b7grupo1.medicos\n"
                + "(nombreMedico, especialidad, contrasenia)\n"
                + "VALUES('" + this.nombreMedico + "', '" + this.especialidad + "', '" + this.contrasenia + "');";
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

    public boolean actualizarMedicos() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE c4b7grupo1.medicos\n"
                + "SET nombreMedico= '" + this.nombreMedico + "' ,"
                + "especialidad= '" + this.especialidad + "' ,"
                + "contrasenia= '" + this.contrasenia + "' \n"
                + "WHERE idMedico=" + this.idMedico + ";";
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

    public boolean eliminarMedicos() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM c4b7grupo1.medicos\n"
                + "WHERE idMedico=" + this.idMedico + ";";
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
