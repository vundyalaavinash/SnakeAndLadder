import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.io.*;


public class Login extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)  throws IOExcpetion, ServletException{
		res.setContentType("text/html");
		PrintWriter pw=req.getWriter();
		
		DBConnection db=new DBConnection();
		Connection con=db.getConnection();
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Statement st=con.createStatement();
		
		String uname=req.getParameter("uname");
		String pass=req.getParameter("pass");
		
		ResultSet rs=st.executeQuery("select * from user_details where email='"+uname+"' and password='"+pass+"'");
		
		if(rs.next()){
			request.sendRedirect("CreateJoin.jsp");
		}
		else{
			string str="<p><span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\">";
			str=str+"</span><strong>Error:</strong>Invalid Username or Password.</p>";
			req.setAttributes("errorMsg",str);
			RequestDispatcher dispatcher=req.getRequestDispatcher("Login.jsp");
			if(dispatcher!=null){
				dispatcher.forward(request,response);
			}
		}
	}
}