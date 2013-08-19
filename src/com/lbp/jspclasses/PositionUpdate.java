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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PositionUpdate
 */

public class PositionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionUpdate() {
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
			PrintWriter out=response.getWriter();
			DBConnection db=new DBConnection();
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			
			HttpSession hs=request.getSession();
			
			String curr=request.getParameter("curr");
			String prev=request.getParameter("prev");			
			String uname=hs.getAttribute("uname").toString();
			String bname=hs.getAttribute("bname").toString();
			ResultSet rs=st.executeQuery("select count(*) from player_details where game_name='"+bname+"';");
			if(rs.next()){
				int max=Integer.parseInt(rs.getString(1));
				st.addBatch("update player_details set current_position="+curr+" where player_name='"+uname+"' and game_name='"+bname+"';");
				st.addBatch("update player_details set orderNo=orderNo-1 where game_name='"+bname+"';");
				st.addBatch("update player_details set orderNo="+max+" where orderNo=0 and game_name='"+bname+"';");
				st.executeBatch();
				GetPlayerNames gn=new GetPlayerNames();
				out.print(gn.getPlayerNames(bname));
			}
		}
		catch(Exception ex){
			ex.printStackTrace();

		}
	}
}
