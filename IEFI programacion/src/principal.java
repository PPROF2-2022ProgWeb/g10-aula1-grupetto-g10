import java.sql.SQLException;
import java.sql.Connection;

public class principal {

    public static void main(String[] args) {
        
        // instanciamiento d ela clase creada conectar
        Conectar mi_conexion = new Conectar();
        
        try{
            System.out.println("IEFI PROGRAMACION GRUPO 10");
            
            Connection conexion = mi_conexion.conectar_db();     
            
            mi_conexion.insertar(1 ,"Matias", "Sacchi", 41523061);
            
            mi_conexion.insertar(2 ,"Camila", "Gil", 40102114);
            
            mi_conexion.insertar(3 ,"Julieta", "Battauz", 32930270);
            
            mi_conexion.insertar(4 ,"Pablo", "Nuñez", 33239222);
            
            mi_conexion.listar();
            
            mi_conexion.insertar(5 ,"Juan", "Perez", 123);
            
            mi_conexion.actualizar(5,"Juan","Perez", 456);
            
            mi_conexion.borrar(5);
            
        }
        catch(Exception e){
            System.out.println("error de conexion"); 
        }
    }    
}
