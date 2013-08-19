<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.lbp.jspclasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Board</title>
		
		<!--Styles -->
		<link rel="stylesheet" href="Styles/styles.css" type="text/css"></link>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Amatic+SC&subset=latin"></link>
		<link rel="stylesheet" href="Styles/jquery.ui.theme.css" type="text/css" />
		<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />

		<!--Scripts-->
		<script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
		<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
		<script src="Scripts/GameBoard.js" type="text/javascript"></script>
		<style>
			.tablea
			{
			border: 1px solid;
			}
			.tablea th td
			{
			Style="border: 1px solid;"
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
					<h2>Enjoy your Game!</h2>
				</div>
				<div id="contact-container">
					<div id="Game-form" class="clearfix">
						<form method="post" action="">
									<div id="leftcolumn">

										<table style="border:none;" id="dice">
											<tr>												
												<td width="100px"><img id="rollimg" src="Styles/dice/dice6.gif" width="70px"/></td>
												<td width="150px" height="100px">
													<input type="submit" value="Roll Dice" id="rollDice" />
													<%
													 	if(session.getAttribute("CBname")!=null){
													 		out.println("<input type=\"submit\" value=\"Start Game\" id=\"startgame\" />");
													 	}
													%>
												</td>												
											</tr>
											<tr>
												<td colspan="3"><h2 style="font-size:24px" id="msg"></h2></td>
												
											</tr>
										</table>
													
									</div>
									<div id="rightcolumn">
										<table class="tablea" width="500" height="498" Style="border: 1px solid white;" background="Styles/images/snakes_and_ladders smalp.jpg" border="3" border-color="White">
										  <tr height="46" Style="border: 1px solid;">
											<td width="44" id="c100" Style="border: 1px solid;">&nbsp;</td>
											<td width="45" id="c99" Style="border: 1px solid;">&nbsp;</td>
											<td width="47" id="c98" Style="border: 1px solid;">&nbsp;</td>
											<td width="43" id="c97" Style="border: 1px solid;">&nbsp;</td>
											<td width="46" id="c96" Style="border: 1px solid;">&nbsp;</td>
											<td width="49" id="c95" Style="border: 1px solid;">&nbsp;</td>
											<td width="45" id="c94" Style="border: 1px solid;">&nbsp;</td>
											<td width="46" id="c93" Style="border: 1px solid;">&nbsp;</td>
											<td width="45" id="c92" Style="border: 1px solid;">&nbsp;</td>
											<td id="c91" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="48" Style="border: 1px solid;">
											<td id="c81" Style="border: 1px solid;">&nbsp;</td>
											<td id="c82" Style="border: 1px solid;">&nbsp;</td>
											<td id="c83" Style="border: 1px solid;">&nbsp;</td>
											<td id="c84" Style="border: 1px solid;">&nbsp;</td>
											<td id="c85" Style="border: 1px solid;">&nbsp;</td>
											<td id="c86" Style="border: 1px solid;">&nbsp;</td>
											<td id="c87" Style="border: 1px solid;">&nbsp;</td>
											<td id="c88" Style="border: 1px solid;">&nbsp;</td>
											<td id="c89" Style="border: 1px solid;">&nbsp;</td>
											<td id="c90" Style="border: 1px solid;">&nbsp;</td>
										  </tr >
										  <tr height="48" Style="border: 1px solid;">
											<td id="c80" Style="border: 1px solid;" >&nbsp;</td>
											<td id="c79" Style="border: 1px solid;">&nbsp;</td>
											<td id="c78" Style="border: 1px solid;">&nbsp;</td>
											<td id="c77" Style="border: 1px solid;">&nbsp;</td>
											<td id="c76" Style="border: 1px solid;">&nbsp;</td>
											<td id="c75" Style="border: 1px solid;">&nbsp;</td>
											<td id="c74" Style="border: 1px solid;">&nbsp;</td>
											<td id="c73" Style="border: 1px solid;">&nbsp;</td>
											<td id="c72" Style="border: 1px solid;">&nbsp;</td>
											<td id="c71" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="47">
											<td id="c61" Style="border: 1px solid;">&nbsp;</td>
											<td id="c62" Style="border: 1px solid;">&nbsp;</td>
											<td id="c63" Style="border: 1px solid;">&nbsp;</td>
											<td id="c64" Style="border: 1px solid;">&nbsp;</td>
											<td id="c65" Style="border: 1px solid;">&nbsp;</td>
											<td id="c66" Style="border: 1px solid;">&nbsp;</td>
											<td id="c67" Style="border: 1px solid;">&nbsp;</td>
											<td id="c68" Style="border: 1px solid;">&nbsp;</td>
											<td id="c69" Style="border: 1px solid;">&nbsp;</td>
											<td id="c70" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="49">
											<td id="c60" Style="border: 1px solid;">&nbsp;</td>
											<td id="c59" Style="border: 1px solid;">&nbsp;</td>
											<td id="c58" Style="border: 1px solid;">&nbsp;</td>
											<td id="c57" Style="border: 1px solid;">&nbsp;</td>
											<td id="c56" Style="border: 1px solid;">&nbsp;</td>
											<td id="c55" Style="border: 1px solid;">&nbsp;</td>
											<td id="c54" Style="border: 1px solid;">&nbsp;</td>
											<td id="c53" Style="border: 1px solid;">&nbsp;</td>
											<td id="c52" Style="border: 1px solid;">&nbsp;</td>
											<td id="c51" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="47">
											<td id="c41" Style="border: 1px solid;">&nbsp;</td>
											<td id="c42" Style="border: 1px solid;">&nbsp;</td>
											<td id="c43" Style="border: 1px solid;">&nbsp;</td>
											<td id="c44" Style="border: 1px solid;">&nbsp;</td>
											<td id="c45" Style="border: 1px solid;">&nbsp;</td>
											<td id="c46" Style="border: 1px solid;">&nbsp;</td>
											<td id="c47" Style="border: 1px solid;">&nbsp;</td>
											<td id="c48" Style="border: 1px solid;">&nbsp;</td>
											<td id="c49" Style="border: 1px solid;">&nbsp;</td>
											<td id="c50" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="51">
											<td id="c40" Style="border: 1px solid;">&nbsp;</td>
											<td id="c39" Style="border: 1px solid;">&nbsp;</td>
											<td id="c38" Style="border: 1px solid;">&nbsp;</td>
											<td id="c37" Style="border: 1px solid;">&nbsp;</td>
											<td id="c36" Style="border: 1px solid;">&nbsp;</td>
											<td id="c35" Style="border: 1px solid;">&nbsp;</td>
											<td id="c34" Style="border: 1px solid;">&nbsp;</td>
											<td id="c33" Style="border: 1px solid;">&nbsp;</td>
											<td id="c32" Style="border: 1px solid;">&nbsp;</td>
											<td id="c31" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="47">
											<td id="c21" Style="border: 1px solid;">&nbsp;</td>
											<td id="c22" Style="border: 1px solid;">&nbsp;</td>
											<td id="c23" Style="border: 1px solid;">&nbsp;</td>
											<td id="c24" Style="border: 1px solid;">&nbsp;</td>
											<td id="c25" Style="border: 1px solid;">&nbsp;</td>
											<td id="c26" Style="border: 1px solid;">&nbsp;</td>
											<td id="c27" Style="border: 1px solid;">&nbsp;</td>
											<td id="c28" Style="border: 1px solid;">&nbsp;</td>
											<td id="c29" Style="border: 1px solid;">&nbsp;</td>
											<td id="c30" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr height="48">
											<td id="c20" Style="border: 1px solid;">&nbsp;</td>
											<td id="c19" Style="border: 1px solid;">&nbsp;</td>
											<td id="c18" Style="border: 1px solid;">&nbsp;</td>
											<td id="c17" Style="border: 1px solid;">&nbsp;</td>
											<td id="c16" Style="border: 1px solid;">&nbsp;</td>
											<td id="c15" Style="border: 1px solid;">&nbsp;</td>
											<td id="c14" Style="border: 1px solid;">&nbsp;</td>
											<td id="c13" Style="border: 1px solid;">&nbsp;</td>
											<td id="c12" Style="border: 1px solid;">&nbsp;</td>
											<td id="c11" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										  <tr>
											<td id="c1" Style="border: 1px solid;">&nbsp;</td>
											<td id="c2" Style="border: 1px solid;">&nbsp;</td>
											<td id="c3" Style="border: 1px solid;">&nbsp;</td>
											<td id="c4" Style="border: 1px solid;">&nbsp;</td>
											<td id="c5" Style="border: 1px solid;">&nbsp;</td>
											<td id="c6" Style="border: 1px solid;">&nbsp;</td>
											<td id="c7" Style="border: 1px solid;">&nbsp;</td>
											<td id="c8" Style="border: 1px solid;">&nbsp;</td>
											<td id="c9" Style="border: 1px solid;">&nbsp;</td>
											<td id="c10" Style="border: 1px solid;">&nbsp;</td>
										  </tr>
										</table>
								</div>
						</form>
						<p id="hide"></p>
					</div>					
				</div>
				<div id="footer">
					<h5>Copyright &#169; 2013 Avinash. All Rights Reserved.</h5>
				</div>
			</div>
			</div>
		
	</body>
</html>