<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="com.lbp.jspclasses.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Join Game</title>
		
		<!--Styles -->
		<link rel="stylesheet" href="Styles/styles.css" type="text/css"></link>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Amatic+SC&subset=latin"></link>
		<link rel="stylesheet" href="Styles/jquery.ui.theme.css" type="text/css" />
		<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />
		<!--Scripts-->
		<script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
		<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
		<script src="Scripts/jquery.additional-methods.js" type="text/javascript"></script>
		<script src="Scripts/join.js" type="text/javascript"></script>
		
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
								response.sendRedirect("Login.jsp");
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
							<a href="contact.jsp" id="nav3">
								<img style="opacity: 1;" src="Styles/images/nav-twitter.png" alt="contact us">
								<span style="display: none;">
									<h3>Contact US</h3>
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="main">
				 <div id="contact-intro">
					<h2>Join a game and compete with your friends!</h2>
				</div>
				<div id="contact-container">
					<div id="contact-form" class="clearfix">
						<form method="post" action="join" id="joinForm">
						<% 
							if(request.getAttribute("errorMsg")!=null){
								out.println(request.getAttribute("errorMsg"));
							}
						%>
							<label for="bname">Select Board: <span class="requireds">*</span></label>
							<select name="bname" id="bname">
							<%
								GetBnames gn=new GetBnames();
								String str=gn.getBnames();
								out.println(str);
							%>
							</select>
							<label for="pass">Passphrase: <span class="requireds">*</span></label>
							<input id="pass" name="pass" class="required passwordUnder passPhrase" placeholder="Tell this phase to your friend" type="text" required/>
														
							<label for="die" class="disNone" id="diel">Die Color: <span class="requireds">*</span></label>
														
							<input value="Join GAME" id="submit-button" type="submit">
							<p id="req-field-desc"><span class="requireds">*</span> indicates a required field</p>
						</form>
					</div>
					<div id="contact-hero">
						
					</div>
				</div>
				<div id="footer">
					<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
				</div>
			</div>
		</div>		
	</body>
</html>