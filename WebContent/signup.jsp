<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<title>Sign UP</title>
		
		<!--Styles -->
		<link rel="stylesheet" href="Styles/styles.css" type="text/css"></link>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Amatic+SC&subset=latin"></link>
		<link rel="stylesheet" href="Styles/jquery.ui.theme.css" type="text/css" />
		<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />

		<!--Scripts-->
		<script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="Scripts/jquery-ui.js" type="text/javascript"></script>
		<script src="Scripts/jquery.validate.js" type="text/javascript"></script>
		<script src="Scripts/signup.js" type="text/javascript"></script>
		
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
					<a href="index.html">
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
					<h2>Sign up now!</h2>
				</div>
				<div id="contact-container">
					<div id="contact-form" class="clearfix">
					<% if(request.getAttribute("errorMsg")!=null)
						{
						out.println("<div class=\"ui-widget\"><div class=\"ui-state-error ui-corner-all\" style=\"padding: 0 .7em;\"><p>");
						out.println("<span class=\"ui-icon ui-icon-alert\" style=\"float: left; margin-right: .3em;\"></span><strong>Alert:</strong>");
						out.println(request.getAttribute("errorMsg"));
						out.println("</p></div></div>");					
					}%>
						<form method="post" action="reg" id="signupForm">
							<label for="fname">First Name: <span class="requireds">*</span></label>
							<input id="fname" name="fname" placeholder="Your First Name" class="required" maxlength="20" type="text" required/><!-- title="<span class='redd'>Enter First Name</span>" />-->
							
							<label for="lname">Last Name: <span class="requireds">*</span></label>
							<input id="lname" name="lname" placeholder="Your First Name" class="required" type="text" required maxlength="20"/><!-- title="<span class='redd'>Enter Last Name</span>" />-->
							
							<label for="email">Email ID : <span class="requireds">*</span></label>
							<input id="email" name="email" placeholder="email@example.com" class="required email uniqueUname" type="text" required/><!--  title="<span class='redd'>Enter e-Mail ID</span>" /> -->
							
							<label for="reemail">Re-type Email ID: <span class="requireds">*</span></label>
							<input id="reemail" name="reemail" placeholder="email@example.com" class="required matchemail" type="text" required/><!--title="<span class='redd'>Retype valid e-mail ID</span>" />-->
							
							<label for="dob">Date of Birth: <span class="requireds">*</span></label>
							<input name="dob" id="datepicker" placeholder="(DD/MM/YYYY)" class="required dateITA" type="text" required/><!--title="<span class='redd'>Enter Valid Date</span>" />-->
							
							<label for="gender">Gender: <span class="requireds">*</span></label>
							<select name="gender" class="required notGenderDefault"><!-- title="<span class='redd'>Select a gender</span>" >-->
								<option value='Default'>Select your Gender</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
							
							<label for="pass">Password : <span class="requireds">*</span></label>
							<input id="pass" name="pass" placeholder="Password" class="required minLength passwordUnder" type="password" required/><!-- title="<span class='redd'>Enter Valid Password(Mininum 5 Characters)</span>" />	-->						
							
							<label for="repass">Re-type Password : <span class="requireds">*</span></label>
							<input id="repass" name="repass" placeholder="Re-type Password" class="required matchpass" type="password" required/><!-- title="<span class='redd'>Retype Valid Password(Should match with password)</span>" />-->
							
							<label for="address">Address: <span class="requireds">*</span></label>
							<textarea id="address" name="address" placeholder="Your Address" class="required minLength" required></textarea><!-- title="<span class='redd'>Enter valid Address</span>" />-->
							
							<label for="que">Secret Question : <span class="requireds">*</span></label>
							<input id="que" name="que" placeholder="Enter Secret Question" class="required minLength" type="text" required/><!-- title="<span class='redd'>Enter valid Question</span>" />-->
							
							<label for="ans">Answer : <span class="requireds">*</span></label>
							<input id="ans" name="ans" placeholder="Enter Answer" class="required" type="text"/><!-- required title="<span class='redd'>Enter valid Answer</span>" />-->

							<input value="SEND" id="submit-button" type="submit">
							<p id="req-field-desc"><span class="requireds">*</span> &nbsp;&nbsp;&nbsp; indicates a required field</p>
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