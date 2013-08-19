<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<title>HomePage</title>
		
		<!--Styles -->
		<link rel="stylesheet" href="Styles/styles.css" type="text/css"></link>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Amatic+SC&subset=latin"></link>
		<link rel="stylesheet" href="Styles/jquery.ui.theme.css" type="text/css" />
		<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />

		<!--Scripts-->
		<script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
		<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
		<script src="Scripts/homeScript.js" type="text/javascript"></script>
		
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
				<h1>Little Big planet hosts the greatest online <br>Snake &amp; ladder game ! </h1>
			</div>
			<div id="main">
				<div id="navigation">
					<ul>
						<li style="background-image: none;" >
							<a href="how.jsp" id="nav1">
								<img src="Styles/images/nav-contact.png" alt="How to Play?" >
								<h3>How?</h3>
							</a>
						</li>
						<li>
							<a href="create.jsp" id="nav2">
								<img src="Styles/images/nav-folio.png" alt="Create Game">
								<h3>Create Game</h3>
							</a>
						</li>
						<li>
							<a href="join.jsp" id="nav3">
								<img src="Styles/images/nav-gallery.png" alt="Join Game">
								<h3>Join Game</h3>
							</a>
						</li>												
						<li>
							<a href="contact.jsp" id="nav4">
								<img src="Styles/images/nav-twitter.png" alt="Contact US">
								<h3>Contact US</h3>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="footer">
				<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
			</div>
		</div>
		
	</body>
</html>