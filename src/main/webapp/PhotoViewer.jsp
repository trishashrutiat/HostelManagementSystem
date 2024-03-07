<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>


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


<%
Blob image =null;
Connection con= null;
Statement st=null;
byte[] imgData = null;
ResultSet rs = null;
String id = "1";

try{
	
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
	st = con.createStatement();
	rs =st.executeQuery("select uimage from users where id='"+id+"' ");
	if(rs.next()) {
		image =rs.getBlob(1);
		imgData = image.getBytes(1, (int)image.length());
		
	} else{
	out.println("Display Blob Example");
	return;
	}
	response.setContentType("image/jpg");
	OutputStream o =response.getOutputStream();
	o.write(imgData);
	o.flush();
	o.close();
}catch(Exception e){
	out.println("Unable to display image");
	return;
} finally{
	try{
	rs.close();
	st.close();
	con.close();
		}catch(SQLException e){
		e.printStackTrace();
		}
	}



%>




<div class="main">
		
		<!-- Registration Form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
				
					<div class="signup-form">
						<h2 class="form-title">View Student Photo</h2>
						<form method="get" action="DisplayImage" class="register-form"	id="uploadphoto" enctype="multipart/form-data">
		
						<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
							<img width="200" height="180" src="PhotoViewer.jsp">
						
	
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