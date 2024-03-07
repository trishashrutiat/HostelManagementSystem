<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Update User</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
String id=request.getParameter("id");
try{
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
	Statement st = con.createStatement();
	ResultSet rs =st.executeQuery("select * from room where id='"+id+"'");
	while (rs.next()){

%>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>"> 

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Room Allocation</h2>
					
						<form method="post" action="allotroom" class="register-form" id="register-form">
							<input type="hidden" id="id" name="id" value="<%out.println(id); %>" >
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" value="<%=session.getAttribute("name") %>" readonly/>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" value="<%=session.getAttribute("email") %>" readonly/>
							</div>
							
							
							<div>
							
								<select name="unumber" id="unumber" style="width:275px;Height:50px;font-family:Poppins;font-size:12px">
 									
 									<option value="" disabled selected>Select Room</option>
 							<%
 								try{
 									// Initialize the database
 										Class.forName("oracle.jdbc.driver.OracleDriver");
 										Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
 										Statement ste=con1.createStatement();
 										String query="select unumber from room where ustatus='available'";
 												//get table data
 										ResultSet rs1 = ste.executeQuery(query);
 										//get Warden name one by one
 										while(rs1.next()){
 							%>
 							
 											<option><%=rs.getString("unumber")%></option>
 											
 							<%
 														}
 									} catch(Exception e){
 														}
 							%>
 									
  								</select>
							
							</div>
							
							
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Update User" />
							</div>
						</form>
					</div>
					
					<%
	}
	}
catch(Exception e)
{
System.out.println(e);	
}
%>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						
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
	swal("Congrats", "Room Allotted Successfully","success");
}
</script>


</body>

</html>