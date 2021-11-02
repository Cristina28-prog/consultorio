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
public class Asignacion {
    private int idCitas;
    private int idMedicamento;

    public Asignacion() {
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


    
    
}
