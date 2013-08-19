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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
			response.setContentType("text/html");
			
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Statement st=con.createStatement();
			
			String uname=request.getParameter("Email");
			String pass=request.getParameter("Password");
			ResultSet rs=st.executeQuery("select * from user_details where email='"+uname+"'");
			HttpSession s=request.getSession();
			s.removeAttribute("uname");
			s.removeAttribute("Name");
			
			if(rs.next()){
				rs=st.executeQuery("select * from user_details where email='"+uname+"' and password='"+pass+"'");
				if(rs.next()){
					s.setAttribute("uname", uname);
					s.setAttribute("Name", rs.getString(2)+" "+rs.getString(3));
					response.sendRedirect("CreateJoin.jsp");
				}
				else{
					String str="<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\">";
					str=str+"</span><strong>Alert :</strong>Invalid Username or Password.</p>";
					request.setAttribute("errorMsg",str);
					RequestDispatcher dispatcher=request.getRequestDispatcher("Login.jsp");
					if(dispatcher!=null){
						dispatcher.forward(request,response);
					}
				}
			}
			else{
				String str="<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\">";
				str=str+"</span><strong>Alert :</strong>The User does not exitst. To Sign UP<a href=\"signup.jsp\">Sign Up</a></p>";
				request.setAttribute("errorMsg",str);
				RequestDispatcher dispatcher=request.getRequestDispatcher("Login.jsp");
				if(dispatcher!=null){
					dispatcher.forward(request,response);
				}
			}						
		}
		catch(Exception ex){
			ex.printStackTrace();
			String str="<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\">";
			str=str+"</span><strong>Fatel Error : </strong> Please try later </p>";
			request.setAttribute("errorMsg",str);
			RequestDispatcher dispatcher=request.getRequestDispatcher("Login.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
		
	}

}
