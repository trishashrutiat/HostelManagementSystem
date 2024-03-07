<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
if(session.getAttribute("name")==null){
	
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Contact Us</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->

	


<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/HostelStyle.css">
<!-- Load font awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%@ include file="Views/Navigation.jspf" %>
<body >
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/ContactUs.jpg" alt="sing up image">
						</figure>
						

					</div><br><br>

					<div class="signin-form">
						<h2 class="form-title">Complaint Form</h2>
						<form method="post" action="complaint" class="register-form"
							id="login-form">
							<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<center><font color="red" size="5">Successfully Updated</font></center>
<%
}
%>
<%

if("invalid".equals(msg))
{%>
<center><font color="red" size="5">Something went wrong</font></center>
<%
}
%>
<%

if("deleted".equals(msg))
{%>
<center><font color="red" size="5">Successfully Deleted</font></center>
<%
}
%>
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
									<input type="text" name="name" id="name" value="<%=session.getAttribute("name") %>" readonly/>
							</div>
							
							<div class="form-group">
							<label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label> 
							<input type="text" id="email" name="email" value="<%=session.getAttribute("email") %>" readonly/>
							</div>
							<div>
								<select name="wname" id="wname" style="width:280px;Height:50px;font-family:Poppins;font-size:12px">
 							
 									<option value="" disabled selected>Select Warden</option>
 							<%
 								try{
 									// Initialize the database
 										Class.forName("oracle.jdbc.driver.OracleDriver");
 										Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
 										Statement st=con.createStatement();
 										String query="select uname from users where urole='warden'";
 												//get table data
 										ResultSet rs = st.executeQuery(query);
 										//get Warden name one by one
 										while(rs.next()){
 							%>
 							
 											<option><%=rs.getString("uname")%></option>
 											
 							<%
 														}
 									} catch(Exception e){
 														}
 							%>
 									
  								</select>
							
							</div>
							
							<br>
							
							<div class="form-group">
								<label for="message"><i
									class="zmdi "></i></label>
								<textarea type="text" id="content" name="content" rows="10" 
								cols="36" placeholder="Type your complaint" required="required"></textarea> 
									
									
							</div>
							<div class="form-group form-button">
								<input type="submit" name="submit" id="submit"
									class="form-submit" value="Submit" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
var status = document.getElementById("status").value;
if(status == "success"){
	swal("Hello", "Complaint Registred Successfully","success");
	
}
if(status == "failed"){
	swal("Sorry", "Something went wrong","error");
}
</script>
	
</body>
	<!-- Footer Location-->
	<%@ include file="Views/NewFooter.jspf" %>
</html>