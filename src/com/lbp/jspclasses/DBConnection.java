package com.lbp.jspclasses;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;


public class DBConnection {

	public DBConnection() {
		// TODO Auto-generated constructor stub
	}
	public Connection getConnection(){
		try{
			//Properties  prop=new Properties();
			//prop.load(new FileInputStream("databaseConfig.properties"));
			//String db=prop.getProperty("database");
			//String dbuser=prop.getProperty("dbuser");
			//String dbpass=prop.getProperty("dbpassword");		
			
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
		
		
			Class.forName("com.mysql.jdbc.Driver").newInstance ();		
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/snakes_ladders","system","tiger");
			return con;		
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	
	public void closeConnection(Connection con){
		if(con!=null){
			try{
				con.close();
			}
			catch(Exception ex){
				
			}
		}
	}

}
