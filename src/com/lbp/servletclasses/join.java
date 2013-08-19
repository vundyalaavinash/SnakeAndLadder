package com.lbp.servletclasses;

import com.lbp.jspclasses.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class join
 */
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public join() {
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
			String bname=request.getParameter("bname");
			String die=request.getParameter("die");
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			HttpSession s=request.getSession();
			String name=s.getAttribute("uname").toString();			
			System.out.println("select * from game_details where game_name='"+bname+"' and max_players!=count ");
			ResultSet rs=st.executeQuery("select * from game_details where game_name='"+bname+"' and max_players!=count and Status='waiting'");
			if(rs.next()){
				System.out.println("select * from player_details where game_name='"+bname+"' and player_color='"+die+"';");
				rs=st.executeQuery("select * from player_details where game_name='"+bname+"' and player_color='"+die+"';");
				if(rs.next()){
					String str="";
					str=str+"<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">";
					str=str+"<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>";
					str=str+"<strong>Error :</strong>Color taken! Choose other</p></div></div>";
					request.setAttribute("errorMsg", str);
					RequestDispatcher dispatcher=request.getRequestDispatcher("join.jsp");
					if(dispatcher!=null){
						dispatcher.forward(request,response);
					}
				}
				else{
					rs=st.executeQuery("select count(*) from player_details where game_name='"+bname+"';");
					if(rs.next()){
						int a=Integer.parseInt(rs.getString(1))+1;
						st.addBatch("insert into player_details values('"+name+"','"+bname+"','"+die+"',0,"+a+");");
						st.addBatch("update game_details set count=count+1 where game_name='"+bname+"'");
						st.executeBatch();
						s.setAttribute("bname", bname);						
						response.sendRedirect("GameBoard.jsp");
					}
				}
			}
			else{
				String str="";
				str=str+"<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\">";
				str=str+"<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span>";
				str=str+"<strong>Error :</strong>Maximum Players Reached</p></div></div>";
				request.setAttribute("errorMsg", str);
				RequestDispatcher dispatcher=request.getRequestDispatcher("join.jsp");
				if(dispatcher!=null){
					dispatcher.forward(request,response);
				}
			}			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}		
}
