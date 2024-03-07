<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Data</title>
<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/HostelStyle.css">

<!-- Load font awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script>

</script>
<!-- Header and Navigation -->
<%@ include file="Views/Navigation.jspf" %>

<body>
 <div class="main">

		<!-- Registration Form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
				
					<div class="signup-form">
						<h2 class="form-title">Student Bio Data</h2>
					
						<form method="post" action="biodata" class="register-form"	id="register-form">
					
						
						
							<div class="form-group">
							<label for="email"><i class="zmdi zmdi-account material-icons-name"></i></label> 
							<input type="text" id="email" name="email" value="<%=session.getAttribute("email") %>" readonly/>
							</div>
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
									<input type="text" name="name" id="name" value="<%=session.getAttribute("name") %>" readonly/>
							</div>
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="fname" id="fname" placeholder="Father Name" required="required"/>
							</div>
							
							<div>
							
								<select name="gender" id="gender" style="width:415px;Height:30px;font-family:Poppins;font-size:12px">
 									 <option value="male" style="font-family:Poppins;font-size:12px">Male</option>
  									<option value="female" style="font-family:Poppins;font-size:12px">Female</option>
  									
  								</select>
							
							</div>
							<div class="form-group">
								<label for="birthday">DOB:</label>
  									<input type="date" id="dob" name="dob">
  						</div>
							
							
							<div class="form-group">
								<label for="Econtact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="emobile" id="emobile"
									placeholder="Emergency Contact no" required="required"/>
							</div>
							<div class="form-group">
								<label for="Address"><i
									class="zmdi " ></i></label>
								<textarea type="text" id="address" name="address" rows="3" 
								cols="36" placeholder="Full Address" style="width:415px;font-family:Poppins;font-size:12px"></textarea> 
									
									
							</div>
							
							<div class="form-group">
								<label for="Department"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="department" id="department"
									placeholder="Department" required="required"/>
							</div>
							<div class="form-group">
								<label for="Year"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="year" id="year"
									placeholder="Year" required="required"/>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
							
 					
					</div>
					<div class="signin-image">
						<figure>
							<img src="images/ContactUs.jpg" width="600px" height="600px">
						</figure>
						<label for="image"><i class="zmdi zmdi-account "></i></label> 
						<input type="file" id="filename" name="filename" onchange="alertFilename()" value="alert" >
						
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


function alertFilename()
{
    var filename = document.getElementById('filename');
    
}
  
  
</script>


</body>
<!-- Footer Location-->
<%@ include file="Views/NewFooter.jspf" %>
</html>