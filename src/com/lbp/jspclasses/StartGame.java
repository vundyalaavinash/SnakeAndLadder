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
 * Servlet implementation class StartGame
 */

public class StartGame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StartGame() {
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
			String bname= s.getAttribute("bname").toString();
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			response.setContentType("text/plain");
			PrintWriter out=response.getWriter();
			DBConnection db=new DBConnection();
			con=db.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select count(*) from player_details where game_name='"+bname+"';");
			if(rs.next()){
				int max=Integer.parseInt(rs.getString(1));
				System.out.println(""+max);
				if(max>1){
					st.addBatch("update game_details set Status='started' where game_name='"+bname+"';");
					st.addBatch("update game_details set max_players="+max+" where game_name='"+bname+"';");
					st.executeBatch();
					out.print("1");
				}
				else{
					out.print("0");
				}
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
