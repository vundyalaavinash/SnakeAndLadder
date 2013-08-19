package com.lbp.jspclasses;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

public class GetWinner {

	public GetWinner() {
		// TODO Auto-generated constructor stub
	}
	public String getWinner(String bname){
		try{	
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			DBConnection db=new DBConnection();
			con=db.getConnection();
			st=con.createStatement();
			System.out.println("select * from player_details where game_name='"+bname+"' order by current_position desc;");
			rs=st.executeQuery("select * from player_details where game_name='"+bname+"' order by current_position desc;");
			String str="";
			str=str+"<table>";
			str=str+"<tr>";
			str=str+"<th><h2>Player</h2></th>";
			str=str+"<th><h2>Final Position</h2></th>";
			str=str+"<th></th>";
			str=str+"</tr>";
			int i=1;
			while(rs.next()){
				str=str+"<tr id='"+rs.getString(1)+"'>";	
				if(rs.getString(3).equals("White"))
				{
					str=str+"<td> <p Style=\"color:'Black'; background-color:"+rs.getString(3)+"; border-radius:25px; border-color:White; border: 2px solid; padding:10px;\">"+rs.getString(1)+"</p></td>";
				}
				else{
					str=str+"<td><p Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:25px; border-color:Black; border: 2px solid; padding:10px;\">"+rs.getString(1)+"</p></td>";
				}				
				str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">"+rs.getString(4)+"</p></td>";
				if(i==1){
					str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">1st</p></td>";
				}
				else if(i==2){
					str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">2nd</p></td>";
				}
				else if(i==3){
					str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">3rd</p></td>";
				}
				else{
					str=str+"<td align=\"center\" style=\"padding:30px; font-size='22px' font-weight:bold;\"><p class='score' Style=\"color:'White'; background-color:"+rs.getString(3)+";  border-radius:999px; border-color:Black; border: 2px solid; padding:10px;\">4th</p></td>";
				}
				str=str+"</tr>";
				i++;
			}
			str=str+"</table>";
			return str;
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return "";
	}
}
