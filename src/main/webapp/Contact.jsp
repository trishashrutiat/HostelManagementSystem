<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Contact Us</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/HostelStyle.css">
<!-- Load font awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%@ include file="Views/Navigation.jspf" %>
<body >

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
						<h2 class="form-title">Contact Us</h2>
						<form method="post" action="contactus" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" required="required"
									placeholder="Full Name" />
							</div>
							<div class="form-group">
								<label for="email"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="email" id="email" required="required"
									placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="mobile"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="mobile" id="mobile" required="required"
									placeholder="Your Mobile" />
							</div>
							<div class="form-group">
								<label for="message"><i
									class="zmdi  "></i></label>
								<textarea type="text" id="text" name="message" rows="3" 
								cols="36" placeholder="Your message"></textarea> 
									
									
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
	
	
</body>
	<!-- Footer Location-->
	<%@ include file="Views/NewFooter.jspf" %>
</html>