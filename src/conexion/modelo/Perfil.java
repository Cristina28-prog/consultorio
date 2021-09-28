

package conexion.modelo;


public class Perfil {
    private String tipoDocumento;
    private String numeroDocumento;
    private String tipoPerfil;
    private String nombre;
    private String contrasenia;
    
    
    public Perfil(String tipoDocumento,String numeroDocumento,String tipoPerfil,String nombre,String contrasenia){
        this.tipoDocumento=tipoDocumento;
        this.numeroDocumento=numeroDocumento;
        this.tipoPerfil=tipoPerfil;
        this.nombre=nombre;
        this.contrasenia=contrasenia;
        
       
    }
    
    public String gettipoDocumento() {
        return tipoDocumento;
    }

    public void settipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getnumeroDocumento() {
        return numeroDocumento;
    }

    public void setnumeroDocumento(String numeroDocumento) {
        this.numeroDocumento= numeroDocumento;
    }

    public String gettipoPerfil() {
        return tipoPerfil;
    }

    public void settipoPerfil(String tipoPerfil) {
        this.tipoPerfil = tipoPerfil;
    }

    public String getnombre() {
        return nombre;
    }

    public void setnombre(String nombre) {
        this.nombre = nombre;
    }
    
       
    public void setcontrasenia (String contrasenia){
        this.contrasenia = contrasenia;
    }
    
    public String getcontrasenia() {
        return contrasenia;
    
    
    
}
}