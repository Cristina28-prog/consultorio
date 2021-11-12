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
    private Citas cita;
    private Usuario usuario;
    private Medicamento medicamento;
    private Medicos medico;

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

    public Citas getCita() {
        return cita;
    }

    public void setCita(Citas cita) {
        this.cita = cita;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Medicamento getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(Medicamento medicamento) {
        this.medicamento = medicamento;
    }

    public Medicos getMedico() {
        return medico;
    }

    public void setMedico(Medicos medico) {
        this.medico = medico;
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
                Medicamento m = new Medicamento(a.getIdMedicamento()).consultarMedicamentoInd();
                a.setMedicamento(m);
                Citas c = new Citas(a.getIdCitas()).consultarCitasInd();
                a.setCita(c);
                Usuario u = new Usuario(c.getIdUsuario()).consultarUsuarioInd();
                a.setUsuario(u);
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
                Medicamento m = new Medicamento(this.getIdMedicamento()).consultarMedicamentoInd();
                this.setMedicamento(m);
                Citas c = new Citas(this.getIdCitas()).consultarCitasInd();
                this.setCita(c);
                Usuario u = new Usuario(c.getIdUsuario()).consultarUsuarioInd();
                this.setUsuario(u);
                Medicos med = new Medicos(c.getIdMedico()).consultarMedicoInd();
                this.setMedico(med);
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
                + "VALUES(" + this.idCitas + " , " + this.idMedicamento + ");";
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
