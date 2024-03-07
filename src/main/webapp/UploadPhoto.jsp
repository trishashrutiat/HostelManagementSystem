<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Photo</title>
<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/HostelStyle.css">

<!-- Load font awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<!-- Header and Navigation -->
<%@ include file="Views/Navigation.jspf" %>

<body>

		<div class="main">

		<!-- Registration Form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
				
					<div class="signup-form">
						<h2 class="form-title">Upload Photo</h2>
						<form method="post" action="uploadphoto" class="register-form"	id="uploadphoto" enctype="multipart/form-data">
							<input type="hidden" id="email" name="email" value="<%=session.getAttribute("email") %>">			
							<input type="hidden" id="id" name="id" value="<%=session.getAttribute("id") %>">	
					<div class="signin-image">
						<figure>
							<img src="images/ContactUs.jpg" width="600px" height="600px">
						</figure>
						<label for="image"><i class="zmdi zmdi-account "></i></label> 
						<input type="file" id="filename" name="filename"   ><br><br>
						<input type="submit" />
						</div>
						<div class="form-group form-button">
								<input type="submit" name="submit" id="submit"
									class="form-submit" value="Submit Image" />
									
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
	swal("Congrats", "Account Created Successfully","success");
}



  
</script>


</body>
<!-- Footer Location-->
<%@ include file="Views/NewFooter.jspf" %>
</html>