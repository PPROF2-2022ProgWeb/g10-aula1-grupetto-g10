import java.sql.*;
import javax.swing.JOptionPane;

public class Conectar {
    public static final String URL = "jdbc:mysql://localhost:3306/iefi";
    public static final String USER = "root";
    public static final String CLAVE = "";
    
    public Connection conectar_db() throws SQLException{
        
        Connection conexion = null;
        
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Cargado Con Exito");
            } catch (Exception e){
                System.out.println("Error de carga");
            }  
            
            try{
                conexion = DriverManager.getConnection(URL,USER,CLAVE);
                JOptionPane.showMessageDialog(null, "Conexion Exitosa con IEFI");
            }
            catch(Exception e){
                JOptionPane.showMessageDialog(null, "Conexion fallida con IEFI");
            }
            return conexion;
    }
    
    public void listar()throws SQLException{
        try{
            Connection listar = conectar_db();
            //creamos objeto statemnet
            Statement consulta = listar.createStatement();
            /*Creamos objeto result, es una tabla virtual en memoria con el resultado */
            ResultSet resultado = consulta.executeQuery("SELECT * FROM Alumnos");
            
            while(resultado.next()){
                System.out.println( "id: "+ resultado.getInt("id_alumno")+" "+ resultado.getString("nombre")+ " "+resultado.getString("apellido")+ " dni: " + resultado.getString("dni") );
            }
        }
        catch(Exception e){
            System.out.println("Error en listar db" + e.getMessage());
        }
   
    }
    
    public void insertar(int id, String nombre, String apellido , int dni){
        String sql = "INSERT INTO `alumnos` (`id_alumno`, `nombre`, `apellido`, `dni`) VALUES ('"+ id +"', '"+ nombre + "', '"+ apellido +"', '"+ dni +"')";
        
        try{
        
            Connection insertar = conectar_db();
            
            Statement consulta = insertar.createStatement();
            
            consulta.executeUpdate(sql);
        
            listar();
            
        }catch(Exception e){
        
             System.out.println("Error en listar db" + e.getMessage());
        }
    }
    
    public void actualizar(int id ,String nombre, String apellido , int dni){
        
        String sql = "UPDATE Alumnos SET nombre='"+ nombre +"'" 
                + ",apellido='"+ apellido +"'"
                + ",dni='"+ dni +"' "
                +" WHERE id_alumno = '"+ id +"'"
                ;
    
        //UPDATE Alumnos SET nombre='Pablo' WHERE id_alumno = '69';
        
        
        try{
            Connection actualizar = conectar_db();
            
            Statement consulta = actualizar.createStatement();
            
            consulta.executeUpdate(sql);
            
            listar();
        }
        catch(Exception e){
            System.out.println("Error en listar db" + e.getMessage());
        }
    
    }
    
    public void borrar(int id){
  
        String sql = "DELETE FROM Alumnos WHERE id_alumno = '"+ id +"' ";
    
        try{
            Connection borrar = conectar_db();
            
            Statement consulta = borrar.createStatement();
            
            consulta.executeUpdate(sql);
            
            listar();
        }
        catch(Exception e){
            System.out.println("Error en listar db" + e.getMessage());
        }
    }
}
