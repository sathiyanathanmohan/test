package com.ennvee.ProjectManagement.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseManagement {
	static Properties prop = new Properties();
	static InputStream input = null;

//    private static String connectionUrl = "jdbc:sqlserver://ennvee5:1433;" +
//			"databaseName=projectmangementtools";
//    private static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   
//    private static String username="sa";
//    private static String password="root";
    private static Connection con;
    public static Connection getConnection() {
        
    	try {

    		String filename = "config.properties";
    		input = DatabaseManagement.class.getClassLoader().getResourceAsStream(filename);
    		if(input==null){
    	            System.out.println("Sorry, unable to find " + filename);
    		    
    		}

    		//load a properties file from class path, inside static method
    		prop.load(input);

                //get the property value and print it out
//                System.out.println(prop.getProperty("database"));
//    	        System.out.println(prop.getProperty("username"));
//    	        System.out.println(prop.getProperty("password"));
//    	        System.out.println(prop.getProperty("driverName"));

    	} catch (IOException ex) {
    		ex.printStackTrace();
        } finally{
        	if(input!=null){
        		try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        	}
        }
    	
    	
    	
    	try {
            Class.forName(prop.getProperty("driverName"));
            try {
                con = DriverManager.getConnection(prop.getProperty("database"),prop.getProperty("username"),prop.getProperty("password"));
            } catch (SQLException ex) {
               
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return con;
    }
}