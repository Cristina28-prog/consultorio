/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author Juan Rojas
 */
public class Citas {
    private int idCitas;
    private int idUsuario;
    private String fecha;
    private int idMedico;

    public Citas() {
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

    @Override
    public String toString() {
        return "Citas{" + "idCitas=" + idCitas + ", idUsuario=" + idUsuario + ", fecha=" + fecha + ", idMedico=" + idMedico + '}';
    }
    
    
}
