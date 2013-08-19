package com.lbp.jspclasses;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetColors
 */
public class GetColors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetColors() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			String bname=request.getParameter("bnamee");
			String [] colors={"CadetBlue","DarkTurquoise","White","Crimson","LightSalmon","LightSlateGrey","DarkSeaGreen"};
			ArrayList<String> al=new ArrayList<String>();
			ResultSet rs=st.executeQuery("select * from player_details where game_name='"+bname+"'");
			String str="";
			str=str+"<select name=\"die\" id=\"die\" class=\"required notDieDefault\">";
			str=str+"<option name=\"Default\" value=\"Default\">Select a Board Name</option>";
			while(rs.next()){
				al.add(""+rs.getString(3));
			}
			ArrayList<String> co=new ArrayList<String>();
			for(int i=0;i<colors.length;i++){
				if(!al.contains(colors[i])){
					co.add(colors[i]);
				}
			}
			for(int i=0;i<co.size();i++){
				str=str+"<option value="+co.get(i)+" class=\"span-"+co.get(i)+"\" >"+co.get(i)+"</option>";
			}
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			str=str+"</select>";
			out.println(""+str);
		}
		catch(Exception ex){
			ex.printStackTrace();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<option name=\"Default\" value=\"Default\">Select a Board Name</option>");
		}
	}
}
