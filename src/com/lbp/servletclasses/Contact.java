package com.lbp.servletclasses;

import com.lbp.jspclasses.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Contact
 */
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletrequestuest requestuest, HttpServletresponseponse responseponse)
	 */
	protected void doGet(HttpServletRequest requestuest, HttpServletResponse responseponse) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletrequestuest requestuest, HttpServletresponseponse responseponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection con=null;
			Statement st=null;			
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
			DBConnection db=new DBConnection();			
			con=db.getConnection();
			if(request.getParameter("email")==null){
				response.sendRedirect("contact.jsp");
			}
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String mess=request.getParameter("message");			
			st=con.createStatement();
			st.executeUpdate("insert into contact values('"+name+"','"+email+"','"+mess+"',curdate());");	
			String str="";
			str=str+"<div class=\"ui-widget\">";
			str=str+"<div class=\"ui-state-highlight ui-corner-all\" style=\"margin-top: 20px; padding: 0 .7em;\">";
			str=str+"<p><span class=\"ui-icon ui-icon-info\" style=\"float: left; margin-right: .3em;\"></span>";
			str=str+"<strong>Hey! </strong>";
			str=str+"Your Message has been Recorded Succesfully. We will get back to you soon";
			str=str+"</p></div></div>";
			
			
			request.setAttribute("errorMsg",str);
			RequestDispatcher dispatcher=request.getRequestDispatcher("contact.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
			String str="";
			str=str+"<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">";
			str=str+"<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>";
			str=str+"<strong>Fatel Error :</strong>Please Try Arain later.</p></div></div>";
			
			request.setAttribute("errorMsg",str);
			RequestDispatcher dispatcher=request.getRequestDispatcher("contact.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
	}

}
