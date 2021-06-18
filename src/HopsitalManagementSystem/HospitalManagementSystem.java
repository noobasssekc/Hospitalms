





package HopsitalManagementSystem;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;





























import java.sql.*;
import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Sameer
 */
public class HospitalManagementSystem{

    
//     static int Age=getDateOfBirth();

   
    public static void main(String[] args) throws Exception {
//        createTable();
  
        
//        post();
//          get();
//          

        
        
        
    }
    
    public static Connection getConnection()throws Exception{
            
        try{
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://127.0.0.1:3306/HospitalMS";
            String username = "root";
            String password = "12345";
            Class.forName(driver);
            
         Connection conn = DriverManager.getConnection(url,username,password);
            return conn;
        }
        
        catch(Exception e){
            System.out.println(e);
        }
        
       return null;
    }
    
    public static void createTable() throws Exception{
        try{
           Connection con= getConnection();
            PreparedStatement create = con.prepareStatement("CREATE TABLE IF NOT EXISTS Patient(patient_id int NOT NULL AUTO_INCREMENT, First_name TINYTEXT,Last_name TINYTEXT, Gender TINYTEXT,Age INT,  Mobile_num varchar(255), Disease TINYTEXT,doctor_id int,centre_id int,record_id int,Room_request TINYTEXT, PRIMARY KEY(patient_id),FOREIGN KEY(doctor_id)REFERENCES DOCTOR(doctor_id),FOREIGN KEY(centre_id)REFERENCES medicalcentre(centre_id),FOREIGN KEY (record_id) REFERENCES medicalrecord(record_id))");
            create.executeUpdate();
           PreparedStatement create1 = con.prepareStatement("CREATE TABLE IF NOT EXISTS MedicalRecord(record_id int NOT NULL AUTO_INCREMENT, Symptoms TINYTEXT,Diagnosis TINYTEXT,patient_id int,RecordDate DATE, RecordTime TIME,PRIMARY KEY(record_id),FOREIGN KEY patient_id REFERENCES Patient(patient_id)");
            create1.executeUpdate();
           PreparedStatement create2 = con.prepareStatement("CREATE TABLE IF NOT EXISTS DOCTOR (doctor_id int NOT NULL AUTO_INCREMENT,doctor_fname TINYTEXT,doctor_lname TINYTEXT,doctor_salary INT,doctor_address TINYTEXT, PRIMARY KEY(doctor_id))");
           create2.executeUpdate();
           PreparedStatement create3 = con.prepareStatement("CREATE TABLE IF NOT EXISTS MedicalCentre (centre_id int NOT NULL AUTO_INCREMENT,centre_rooms int,center_address TINYTEXT, PRIMARY KEY(centre_id))");
           create3.executeUpdate();
        }
        
        
                
    
        catch(Exception e){
            System.out.println(e);
        }
       
    
   
}
    
   
 
    
    
    public static  void postPatient(String first_name,String last_name,String gender,String age,String contact_num,String previous_dis)throws Exception{
        
        try{
            
            Connection conn=getConnection();
            PreparedStatement posted = conn.prepareStatement("INSERT INTO Patient(first_name,last_name,Gender,Age,Mobile_num,Disease) VALUES ('"+first_name+"','"+last_name+"','"+gender+"','"+age+"','"+contact_num+"','" +previous_dis+ "')");
            posted.executeUpdate();
            JOptionPane.showMessageDialog(null, "The record has been successfully submitted");
            
        }
        catch(Exception e){
            System.out.println(e);
          
        }
        
        
    }
    
     public static  void postPatientRecord(String patient_id, String Symptoms ,String Diagnosis,String Room_req,String doctor_name )throws Exception{
        
        try{
            System.out.println(patient_id);
            System.out.println(Symptoms);
            System.out.println(Diagnosis);
            System.out.println(Room_req);
            Connection conn=getConnection();
            PreparedStatement postedRec = conn.prepareStatement("INSERT INTO MedicalRecord(patient_id,Symptoms,Diagnosis ,Room_req,RecordDate,RecordTime,doctor_name) VALUES ('"+patient_id+"','"+Symptoms+"','"+Diagnosis+"','"+Room_req+"',curdate(), curtime(),'"+doctor_name+"' )");
            postedRec.executeUpdate();
            
            
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "The record for this patient has already been generated");
          
        }
        
        
    }
    
    public static ArrayList<String> get() throws Exception{
        try{
            Connection conn= getConnection();
            PreparedStatement statement= conn.prepareStatement("SELECT Patient_id,first_name,last_name,Age,Mobile_num,Disease FROM Patient ORDER BY Patient_id asc");
            
            ResultSet result = statement.executeQuery();
            
            ArrayList<String> arr=new ArrayList<String>();
  
            while(result.next()){
                
                System.out.print(result.getInt("Patient_id"));
                System.out.print(" ");
                System.out.print(result.getString("first_name"));
                System.out.print(" ");
                
                System.out.print(result.getString("last_name"));
                System.out.print(" ");
                System.out.print(result.getString("Age"));
                System.out.print(" ");
                System.out.print(result.getString("Mobile_num"));
                System.out.print(" ");
                 System.out.println(result.getString("Disease"));
                System.out.println(" ");
             
             
            }
            System.out.println("All records have been printed");
            return arr;
        }
        catch(Exception e){
            System.out.println(e);
            return null;
        }
        
    }

    public static void UpdatePatient(String patient_id,String first_name, String last_name, String gender, String age, String contact_num, String previous_dis) {
        
        try{
            Connection con= getConnection();
            PreparedStatement update = con.prepareStatement("UPDATE Patient SET First_name='"+first_name+"',Last_name='"+last_name+"',Gender='"+gender+"',Age='"+age+"',Mobile_num='"+contact_num+"',Disease='"+previous_dis+"'WHERE patient_id='"+patient_id+"'" );
            update.executeUpdate();
            JOptionPane.showMessageDialog(null, "Successfully updated");
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Please fill all the columns correctly");
            
        }
    }
}

    
