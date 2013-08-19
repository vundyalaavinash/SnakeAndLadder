package com.lbp.SessionListenerClasses;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.lbp.jspclasses.DBConnection;

public class RemoveSession {

	public RemoveSession() {
		// TODO Auto-generated constructor stub
	}
	public void removeSession(String uname){
		try{	
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			DBConnection db=new DBConnection();
			con=db.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select game_name from game_details where player_name='"+uname+"';");
			if(rs.next()){
				st.executeQuery("delete from player_details where game_name='"+rs.getString(1)+"'");
				st.executeQuery("delete from game_details where game_name='"+rs.getString(1)+"'");
			}
			else{
				st.executeQuery("delete from player_details where player_name='"+uname+"'");
			}

		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
