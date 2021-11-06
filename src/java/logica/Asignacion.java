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
public class Asignacion {
    private int idCitas;
    private int idMedicamento;

    public Asignacion() {
    }

    public Asignacion(int idCitas) {
        this.idCitas = idCitas;
    }
    
    

    public Asignacion(int idCitas, int idMedicamento) {
        this.idCitas = idCitas;
        this.idMedicamento = idMedicamento;
    }


    public int getIdCitas() {
        return idCitas;
    }

    public void setIdCitas(int idCitas) {
        this.idCitas = idCitas;
    }

    public int getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(int idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    @Override
    public String toString() {
        return "Asignacion{" + "idCitas=" + idCitas + ", idMedicamento=" + idMedicamento + '}';
    }

    public List<Asignacion> consultarAsignacion() {
        List<Asignacion> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT idCitas, idMedicamento\n"
                + "FROM c4b7grupo1.asignacion;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Asignacion a;
            while (rs.next()) {
                a = new Asignacion();
                a.setIdCitas(rs.getInt("idCitas"));
                a.setIdMedicamento(rs.getInt("idMedicamento"));
                lista.add(a);
            }
        } catch (SQLException ex) {
            System.out.println("Error" + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return lista;
    }

    public Asignacion consultarAsignacionInd() {
        List<Asignacion> lista = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM c4b7grupo1.asignacion WHERE idCitas= " + this.idCitas + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Asignacion a;
            if (rs.next()) {
                this.idMedicamento = rs.getInt("idMedicamento");
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

    public boolean guardarAsignacion() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO c4b7grupo1.asignacion\n"
                + "(idCitas, idMedicamento)\n"
                + "VALUES(" + this.idCitas +  " , " + this.idMedicamento +  ");";
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

    public boolean actualizarAsignacion() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE c4b7grupo1.asignacion\n"
                + "SET idMedicamento= " + this.idMedicamento + " \n"
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

    public boolean eliminarAsignacion() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM c4b7grupo1.asignacion\n"
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
