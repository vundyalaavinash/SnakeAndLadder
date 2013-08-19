package com.lbp.servletclasses;

import com.lbp.jspclasses.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */

public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Registration() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
			DBConnection db=new DBConnection();
			
			con=db.getConnection();
			if(req.getParameter("email")==null){
				res.sendRedirect("signup.jsp");
			}
			String email1=req.getParameter("email");
			String fname=req.getParameter("fname");
			String lname=req.getParameter("lname");
			String dob=req.getParameter("dob");
			String gender=req.getParameter("gender");
			String pass=req.getParameter("pass");
			String add=req.getParameter("address");
			String que=req.getParameter("que");
			String ans=req.getParameter("ans");
			
			String[]d=dob.split("/");
			
			dob=d[2]+"/"+d[1]+"/"+d[0];
			st=con.createStatement();
			st.executeUpdate("insert into user_details values('"+email1+"','"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+pass+"','"+add+"','"+que+"','"+ans+"');");			
			res.sendRedirect("CreateJoin.jsp");
		}
		catch(Exception ex){
			ex.printStackTrace();		
			req.setAttribute("errorMsg","Fatel Error ! Please Try Arain later");
			RequestDispatcher dispatcher=req.getRequestDispatcher("signup.jsp");
			if(dispatcher!=null){
				dispatcher.forward(req,res);
			}
		}
	}

}
