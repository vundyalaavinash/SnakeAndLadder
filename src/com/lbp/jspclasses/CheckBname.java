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

/**
 * Servlet implementation class CheckBname
 */

public class CheckBname extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckBname() {
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
			String bname=request.getParameter("Bname");
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			response.setContentType("text/plain");
			PrintWriter out=response.getWriter();
			DBConnection db=new DBConnection();
			con=db.getConnection();
			st=con.createStatement();
			
			rs=st.executeQuery("select * from game_details where game_name='"+bname+"';");
			if(rs.next()){
				out.print("0");
			}
			else{
				out.print("1");
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}	
	}

}
