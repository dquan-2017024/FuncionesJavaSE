/*
Nombre: Daniel Enrique Quán Cruz
Codigo técnico: IN5AM
Número de Carnet: 2017024
 */
package org.alumno.system;

import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.alumno.controller.EmpresaController;
import org.alumno.controller.MenuPrincipalController;

/**
 *
 * @author Pedro Armas
 */
public class Principal extends Application {
     private final String PAQUETE_VISTA = "/org/alumno/view/";
    private Stage escenarioPrincipal;
    private Scene escena;
    
    @Override
    public void start(Stage escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
        this.escenarioPrincipal.setTitle("Daniel Enrique Quán"); // Borre el texto y coloque lo que se le pide
        menuPrincipal();
        escenarioPrincipal.show();
    }

 public void menuPrincipal(){
        try{

            MenuPrincipalController menu = (MenuPrincipalController)cambiarEscena("MenuPrincipalView.fxml", 390,350);
            menu.setEscenarioPrincipal(this);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void ventanaEmpresas(){
        try{
            EmpresaController emp = (EmpresaController)cambiarEscena("ProgramadorView.fxml", 667, 415);
            emp.setEscenarioPrincipal(this);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }
    
    public Initializable cambiarEscena (String fxml,int ancho, int alto) throws Exception{
        Initializable resultado = null;
        FXMLLoader cargadorFXML = new FXMLLoader();
        InputStream archivo = Principal.class.getResourceAsStream(PAQUETE_VISTA+fxml);
        cargadorFXML.setBuilderFactory(new JavaFXBuilderFactory());
        cargadorFXML.setLocation(Principal.class.getResource(PAQUETE_VISTA+fxml));
        escena = new Scene((AnchorPane)cargadorFXML.load(archivo),ancho,alto);
        escenarioPrincipal.setScene(escena);
        escenarioPrincipal.sizeToScene();
        resultado = (Initializable)cargadorFXML.getController();        
        return resultado;
    }
    
}
