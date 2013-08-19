import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Registration extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			DBConnection db=new DBConnection();
			
			con=db.getConnection();
			
			String email=req.getParameter("email");
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
			st.executeUpdate("insert into user_details values("+email+","+fname+","+lname+","+dob+","
				+gender+","+pass+","+add+","+que+","+ans+");");			
			request.sendRedirect("CreateJoin.html");
		}
		catch(Exception ex){
			string str="<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\">";
			str=str+"</span><strong>Error:</strong>Invalid Username or Password.</p>";
			req.setAttributes("errorMsg",str);
			RequestDispatcher dispatcher=req.getRequestDispatcher("signup.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
	}

}