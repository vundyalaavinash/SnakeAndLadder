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
 * Servlet implementation class GetDetails
 */
public class GetDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDetails() {
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
			HttpSession s=request.getSession();			
			String uname=s.getAttribute("uname").toString();
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			response.setContentType("text/plain");
			PrintWriter out=response.getWriter();
			DBConnection db=new DBConnection();
			con=db.getConnection();
			st=con.createStatement();
			
			rs=st.executeQuery("select * from player_details where player_name='"+uname+"';");
			if(rs.next()){
				out.print(rs.getString(1)+" "+rs.getString(3)+" "+rs.getString(4));
			}
			else{
				out.print("none");
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}	
	}

}
