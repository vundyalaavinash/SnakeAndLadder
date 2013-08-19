package com.lbp.jspclasses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Chance
 */

public class Chance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Chance() {
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
			response.setContentType("text/plain");
			PrintWriter out=response.getWriter();
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			HttpSession s=request.getSession();
			
			String bname=s.getAttribute("bname").toString();
			String uname=s.getAttribute("uname").toString();
			ResultSet rs=st.executeQuery("select * from player_details where player_name='"+uname+"' and orderNo=1 and game_name='"+bname+"';");
			if(rs.next()){
				out.print("1");
			}
			else{
				out.print("0");
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		
	}

}
