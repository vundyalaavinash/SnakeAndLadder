<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Login IN</title>
		
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
							<li id="signup">
								<a href="contact.jsp">Contact US</a>
							</li>
							<li id="signup">
								<a href="signup.jsp">Sign up</a>
							</li>
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
					<h2>Need to get in touch? Use the form below or <a href="https://twitter.com/" target="_blank">@lbpSal</a> us!</h2>
				</div>
				<div id="contact-container">
					<% if(request.getAttribute("errorMsg")!=null)
					{
						out.println("<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\"><p>");
						out.println(request.getAttribute("errorMsg"));
						out.println("</p></div></div>");					
					}%>
					<form class="form-1" action="Login" method="post">
						<p class="field">
							<input type="text" name="Email" placeholder="email@example.com" width='280px' />
							<i class="icon-user icon-large"></i>
						</p>
							<p class="field">
							<input type="password" name="Password" placeholder="Password" width='280px' / >
							<i class="icon-lock icon-large"></i>
						</p>        
						<p class="submit">
							<button type="submit" name="submit"><i class="icon-arrow-right icon-large"></i></button>
						</p>
					</form>
					</div>
				</div>
				<div id="footer">
					<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
				</div>
			</div>
		
	</body>
</html>