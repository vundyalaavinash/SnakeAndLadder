<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.lbp.jspclasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Winner</title>
		
		<!--Styles -->
		<link rel="stylesheet" href="Styles/styles.css" type="text/css"></link>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Amatic+SC&subset=latin"></link>
		<link rel="stylesheet" href="Styles/jquery.ui.theme.css" type="text/css" />
		<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />

		<!--Scripts-->
		<script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
		<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
		<script src="Scripts/contactScript.js" type="text/javascript"></script>
		
	</head>
	<body>
		<div id="top"></div>
		<div id="container">
			<div id="header">
				<div id="login">
					<nav>
						<ul>
							<% 
							if(session.getAttribute("Name")==null){
								out.println("<li id=\"login\">");
								out.println("<a id=\"login-trigger\" href=\"#\">Log in <span>&#x25BC;</span>");
								out.println("</a>");
								out.println("<div id=\"login-content\">");
								out.println("<form action=\"Login\" method=\"post\">");
								out.println("<fieldset id=\"inputs\">");
								out.println("<input id=\"username\" type=\"text\" name=\"Email\" placeholder=\"Your email address\" required>");   
								out.println("<input id=\"password\" type=\"password\" name=\"Password\" placeholder=\"Password\" required>");
								out.println("</fieldset>");
								out.println("<fieldset id=\"actions\">");
								out.println("<input type=\"submit\" id=\"submit\" value=\"Log in\">");
								out.println("<label><input type=\"checkbox\" checked=\"checked\"> Keep me signed in</label>");
								out.println("</fieldset>");
								out.println("</form>");
								out.println("</div>");                     
								out.println("</li>");
								out.println("<li id=\"signup\">");
								out.println("<a href=\"signup.jsp\">Sign up</a>");
								out.println("</li>");
							}
							else{
								out.println("</li>");
								out.println("<li id=\"signup\">");
								out.println("<a href=\"account.jsp\">"+session.getAttribute("Name")+"</a>");
								out.println("</li>");
								out.println("<li id=\"signup\">");
								out.println("<a href=\"Logout\">Sign out</a>");
								out.println("</li>");
							}
							%>
						</ul>
					</nav>
				</div>
				<div id="logo">
					<a href="index.jsp">
						<img  src="Styles/images/logo.png" alt="LittleBigPlanet"/>
					</a>
				</div>
				<div id="navigation">
					<ul>
						<li style="background-image: none;">
							<a href="how.jsp" id="nav1">
								<img style="opacity: 1;" src="Styles/images/nav-contact.png" alt="How to Play?" >
								<span style="display: none;">
									<h3>Instructions</h3>
								</span>
							</a>
						</li>
						<li>
							<a href="create.jsp" id="nav2">
								<img style="opacity: 1;" src="Styles/images/nav-folio.png" alt="Create Game">
								<span style="display: none;">
									<h3>Create Game</h3>
								</span>
							</a>
						</li>
						<li>
							<a href="join.jsp" id="nav3">
								<img style="opacity: 1;" src="Styles/images/nav-gallery.png" alt="Join Game">
								<span style="display: none;">
									<h3>Join Game</h3>
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="main">
				 <div id="contact-intro">
					<h2>Cheers for the Winner !</h2>
				</div>
				<div id="contact-container">
					<%
						GetWinner gw=new GetWinner();
						out.println(gw.getWinner(session.getAttribute("bname").toString()));
					%>
				</div>
				</div>
				<div id="footer">
					<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
				</div>
			</div>
		
	</body>
</html>