package com.lbp.jspclasses;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;


public class GetBnames {

	public GetBnames() {
		// TODO Auto-generated constructor stub
	}
	
	public String getBnames(){
		try{
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from game_details where max_players!=count;");
			String str="";
			str=str+"<option name=\"Default\" value=\"Default\">Select a Board Name</option>";
			while(rs.next()){
				str=str+"<option name=\""+rs.getString(1)+"\" value=\""+rs.getString(1)+"\" >"+rs.getString(1)+"</option>";
			}
			return str;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return "";
		}
	}

}
