<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Forgot Password</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="main">

		<!-- Change Password  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/NewPassword.jpg" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						
						<form method="post" action="ForgotPassword" class="register-form"
							id="login-form">
							<div>
							<h2 class="form-title">Reset Password</h2>
							</div>
							<div class="form-group">
								<label for="email"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="email" id="email" required="required"
									placeholder="Enter registered email id" />
									
							</div>
														
							<div class="form-group form-button">
								<input type="submit" name="GetNewPassword" id="GetNewPassword"
									class="form-submit" value="Get New Password" />
							</div>
							<div class="form-group">
								<a href="login.jsp">Go to Login Page</a>
							</div>
							<div>
							
							<a>Change your password in three easy steps.</a><br>
							<a>1. Enter your registered email and click submit.</a><br>
							<a>2. Our system will send an OTP to your email.</a><br>
							<a>3. Enter OTP on next page.</a><br>
							
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

</html>