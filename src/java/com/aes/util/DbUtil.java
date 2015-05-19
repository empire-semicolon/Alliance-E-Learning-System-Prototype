/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aes.util;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

/**
 *
 * @author asi
 */
public class DbUtil {
    private Connection connection = null;
    
    public Connection getConnection(){
        if(connection!=null)
            return connection;
        else{
            try{
                Properties prop = new Properties();
                InputStream inputStream = DbUtil.class.getClassLoader().getResourceAsStream("/db.properties");
                prop.load(inputStream);
                
                String driver = prop.getProperty("driver");
                String url = prop.getProperty("url");
                String username = prop.getProperty("username");
                String password = prop.getProperty("password");
                Class.forName(driver);
                connection = (Connection) DriverManager.getConnection(url, username, password);
            }
            catch(ClassNotFoundException e){
                System.out.println("CLASS NOT FOUND");
                e.printStackTrace();
            }
            catch(SQLException e){
                System.out.println("SQL EXCEPTION");
                e.printStackTrace();
            }
            catch(FileNotFoundException e){
                System.out.println("FILE NOT FOUND");
                e.printStackTrace();
            }
            catch(IOException ex){
                System.out.println("IO EXCEPTION");
                ex.printStackTrace();
            }
            catch(Exception e){
                System.out.println("EXCEPTION");
                e.printStackTrace();
            }
            
            
            return connection;
        }
    }
    
    public boolean disconnect(){
        try{
            connection.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return true;
    }
}
