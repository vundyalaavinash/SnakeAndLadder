import java.io.*;
import java.sql.*;
import java.util.*;

public class DBConnection{

	public Connection getConnection(){
		try{
			Properties  prop=new Properties();
			prop.load(new FileInputStream("databaseConfig.properties"));
			String db=prop.getProperty("database");
			String dbuser=prop.getProperty("dbuser");
			String dbpass=prop.getProperty("dbpassword");		
			
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
		
		
			Class.forName("com.mysql.jdbc.Driver").newInstance ();		
			con=DriverManager.getConnection(db,dbuser,dbpass);
			return con;		
		}
		catch(Exception ex){
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