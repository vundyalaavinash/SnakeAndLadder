package com.lbp.jspclasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class GetPlayerNames {

	public GetPlayerNames() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPlayerNames(String name){
		try{
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from player_details where game_name='"+name+"' order by current_position desc;");
			String str="";
			str="<table style=\"border:none;\" id='players'>";
			str=str+"<tr>";
			str=str+"<th colspan=\"2\"><h2>Player</h2></th>";
			str=str+"<th><h2>Position</h2></th>";
			str=str+"</tr>";
			while(rs.next()){
				str=str+"<tr id='"+rs.getString(1)+"'>";
				if(rs.getString(3).equals("White"))
				{
					str=str+"<td colspan=\"2\"> <p Style=\"color:'Black'; background-color:"+rs.getString(3)+"; border-radius:25px; border-color:White; border: 2px solid; padding:10px;\">"+rs.getString(1)+"</p></td>";
				}
				else{
					str=str+"<td colspan=\"2\"><p Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:25px; border-color:Black; border: 2px solid; padding:10px;\">"+rs.getString(1)+"</p></td>";
				}				
				str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">"+rs.getString(4)+"</p></td>";
				str=str+"</tr>";
			}
			str=str+"</table>";
			return str;
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return name;
	}

}
