
package conexion.controlador;


import java.util.ArrayList;
import java.util.Iterator;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class ConexionMySQL {

    public Connection conexion;
    public Statement sentencia;
    public ResultSet resultado;
    private boolean connected=false;
    
    public boolean isConnected(){
        return connected;
    }

    public void ConectarBasedeDatos() {
        try {
            final String Controlador = "com.mysql.jdbc.Driver";
            Class.forName(Controlador);
            final String url_bd = "jdbc:mysql://localhost:3306/consultorio_online";
            conexion = DriverManager.getConnection(url_bd, "root", "root");
            sentencia = conexion.createStatement();
            connected= true;
        } catch (ClassNotFoundException | SQLException ex) {
            connected= false;
            
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error ", JOptionPane.ERROR_MESSAGE);
        }
    }
    public String executeSQL(String sql, ArrayList<Object> params){
        Iterator<Object> iP;
        Object oP;
        int index = 1;
        try {
            PreparedStatement pstm = conexion.prepareStatement(sql);
            iP = params.iterator();
            while(iP.hasNext()){
                oP = iP.next();
                if(oP.getClass() == String.class){
                    pstm.setString(index++, (String)oP);
                }
                if(oP.getClass() == Long.class){
                    pstm.setLong(index++, (Long)oP);
                }
                if(oP.getClass() == Integer.class){
                    pstm.setLong(index++, (Integer)oP);
                }
            }
            pstm.execute();
            return "";

        } catch (SQLException excepcion) {             
            excepcion.printStackTrace();
            return excepcion.getMessage();
        }   
    }
   public void DesconectarBasedeDatos() {
        try {
            if (conexion != null) {
                if (sentencia != null) {
                    sentencia.close();
                }
                conexion.close();
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            System.exit(1);
        }
    }

    public Connection getConnection() {
        return conexion;
    }
}
