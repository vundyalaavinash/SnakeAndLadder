<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.lbp.jspclasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Contact Us</title>
		
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
		<style>
			table
			{
			border: 0.5px solid;
			}
			table,th, td
			{
			border: 0.5px solid;
			}
					</style>
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
					<h2>Need to get in touch? Use the form below or <a href="https://twitter.com/" target="_blank">@lbpSal</a> us!</h2>
				</div>
				<div id="contact-container">
					<div id="Game-form" class="clearfix">
						<form method="post" action="">
									<div id="leftcolumn">
										<% 
											GetPlayerNames gn=new GetPlayerNames();
											out.println(gn.getPlayerNames(session.getAttribute("bname").toString()));
										%>							
									</div>
									<div id="rightcolumn">
											<table width="500" height="498" Style="border: 1px solid white;" background="Styles/images/snakes_and_ladders smalp.jpg" border="3" border-color="White">
											  <tr height="46">
												<td width="44" id="c1">&nbsp;</td>
												<td width="45" id="c2">&nbsp;</td>
												<td width="47" id="c3">&nbsp;</td>
												<td width="43" id="c4">&nbsp;</td>
												<td width="46" id="c5">&nbsp;</td>
												<td width="49" id="c6">&nbsp;</td>
												<td width="45" id="c7">&nbsp;</td>
												<td width="46" id="c8">&nbsp;</td>
												<td width="45" id="c9">&nbsp;</td>
												<td id="c10">&nbsp;</td>
											  </tr>
											  <tr height="48">
												<td id="c20">&nbsp;</td>
												<td id="c19">&nbsp;</td>
												<td id="c18">&nbsp;</td>
												<td id="c17">&nbsp;</td>
												<td id="c16">&nbsp;</td>
												<td id="c15">&nbsp;</td>
												<td id="c14">&nbsp;</td>
												<td id="c13">&nbsp;</td>
												<td id="c12">&nbsp;</td>
												<td id="c11">&nbsp;</td>
											  </tr>
											  <tr height="48">
												<td id="c21" >&nbsp;</td>
												<td id="c22">&nbsp;</td>
												<td id="c23">&nbsp;</td>
												<td id="c24">&nbsp;</td>
												<td id="c25">&nbsp;</td>
												<td id="c26">&nbsp;</td>
												<td id="c27">&nbsp;</td>
												<td id="c28">&nbsp;</td>
												<td id="c29">&nbsp;</td>
												<td id="c30">&nbsp;</td>
											  </tr>
											  <tr height="47">
												<td id="c40">&nbsp;</td>
												<td id="c39">&nbsp;</td>
												<td id="c38">&nbsp;</td>
												<td id="c37">&nbsp;</td>
												<td id="c36">&nbsp;</td>
												<td id="c35">&nbsp;</td>
												<td id="c34">&nbsp;</td>
												<td id="c33">&nbsp;</td>
												<td id="c32">&nbsp;</td>
												<td id="c31">&nbsp;</td>
											  </tr>
											  <tr height="49">
												<td id="c41">&nbsp;</td>
												<td id="c42">&nbsp;</td>
												<td id="c43">&nbsp;</td>
												<td id="c44">&nbsp;</td>
												<td id="c45">&nbsp;</td>
												<td id="c46">&nbsp;</td>
												<td id="c47">&nbsp;</td>
												<td id="c48">&nbsp;</td>
												<td id="c49">&nbsp;</td>
												<td id="c50">&nbsp;</td>
											  </tr>
											  <tr height="47">
												<td id="c60">&nbsp;</td>
												<td id="c59">&nbsp;</td>
												<td id="c58">&nbsp;</td>
												<td id="c57">&nbsp;</td>
												<td id="c56">&nbsp;</td>
												<td id="c55">&nbsp;</td>
												<td id="c54">&nbsp;</td>
												<td id="c53">&nbsp;</td>
												<td id="c52">&nbsp;</td>
												<td id="c51">&nbsp;</td>
											  </tr>
											  <tr height="51">
												<td id="c61">&nbsp;</td>
												<td id="c62">&nbsp;</td>
												<td id="c63">&nbsp;</td>
												<td id="c64">&nbsp;</td>
												<td id="c65">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
											  </tr>
											  <tr height="47">
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
											  </tr>
											  <tr height="48">
												<td  id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
											  </tr>
											  <tr>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
												<td id="c">&nbsp;</td>
											  </tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>																			
										</td>
										<td></td>
									</tr>								
								</table>
								</div>
						</form>
					</div>					
				</div>
				<div id="footer">
					<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
				</div>
			</div>
		
	</body>
</html>