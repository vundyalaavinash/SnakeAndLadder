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
 * Servlet implementation class CreateGame
 */
public class CreateGame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateGame() {
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
			
			String pass=request.getParameter("pass");
			String nop=request.getParameter("play");
			String die=request.getParameter("die");
			String bname=request.getParameter("bname");
			HttpSession s=request.getSession();
			String name=s.getAttribute("uname").toString();
			
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			
			Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from game_details where game_name='"+bname+"'");
			if(rs.next()){
				String str="";
				
				str=str+"<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">";
				str=str+"<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>";
				str=str+"<strong>Fatel Error :</strong>Board Name not available.</p></div></div>";
				request.setAttribute("errorMsg", str);
				RequestDispatcher dispatcher=request.getRequestDispatcher("create.jsp");
				if(dispatcher!=null){
					dispatcher.forward(request,response);
				}
			}
			String []queries={"insert into game_details values('"+bname+"','"+pass+"','"+nop+"','"+name+"',1,'1','waiting')",
					"insert into player_details values('"+name+"','"+bname+"','"+die+"',0,1)"};
			for (String query : queries) {
			    st.addBatch(query);
			}
			st.executeBatch();			
			s.setAttribute("bname", bname);
			s.setAttribute("CBname", "true");
			response.sendRedirect("GameBoard.jsp");
			
		}catch(Exception ex){
			ex.printStackTrace();
			String str="";
			str=str+"<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">";
			str=str+"<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>";
			str=str+"<strong>Fatel Error :</strong>Please Try Arain later.</p></div></div>";
			request.setAttribute("errorMsg", str);
			RequestDispatcher dispatcher=request.getRequestDispatcher("create.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
		
	}

}
