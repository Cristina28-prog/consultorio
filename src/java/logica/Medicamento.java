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
public class Medicamento {

    private int idMedicamento;
    private String nombreMedicamento;

    public Medicamento() {
    }

    public Medicamento(int idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    public Medicamento(int idMedicamento, String nombreMedicamento) {
        this.idMedicamento = idMedicamento;
        this.nombreMedicamento = nombreMedicamento;
    }

    public int getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(int idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    public String getNombreMedicamento() {
        return nombreMedicamento;
    }

    public void setNombreMedicamento(String nombreMedicamento) {
        this.nombreMedicamento = nombreMedicamento;
    }

    @Override
    public String toString() {
        return "Medicamento{" + "idMedicamento=" + idMedicamento + ", nombreMedicamento=" + nombreMedicamento + '}';
    }

    public List<Medicamento> consultarMedicamento() {
        List<Medicamento> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT idMedicamento, nombreMedicamento\n" + "FROM c4b7grupo1.medicamento;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Medicamento m;
            while (rs.next()) {
                m = new Medicamento();
                m.setIdMedicamento(rs.getInt("idMedicamento"));
                m.setNombreMedicamento(rs.getString("nombreMedicamento"));
                lista.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Medicamento consultarMedicamentoInd() {
        List<Medicamento> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM c4b7grupo1.medicamento WHERE idMedicamento= " + this.idMedicamento + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombreMedicamento = rs.getString("nombreMedicamento");
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

    public boolean guardarMedicamento() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO c4b7grupo1.medicamento\n"
                + "(nombreMedicamento)\n"
                + "VALUES('" + this.nombreMedicamento + "');";
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

    public boolean actualizarMedicamento() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE c4b7grupo1.medicamento\n"
                + "SET nombreMedicamento='" + this.nombreMedicamento + "'\n"
                + "WHERE idMedicamento=" + this.idMedicamento + ";";
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

    public boolean eliminarMedicamento() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM c4b7grupo1.medicamento\n"
                + "WHERE idMedicamento=" + this.idMedicamento + ";";
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
