<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>User Room Allocation</title>
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
<style>
* {
    /* Change your font family */
    font-family: sans-serif;
}

.content-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    min-width: 400px;
    border-radius: 5px 5px 0 0;
    overflow: hidden;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
    font-weight: bold;
}

.content-table th,
.content-table td {
    padding: 12px 15px;
}

.content-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

.content-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
</style>
<body>
<!-- Navigation-->

<%@ include file="Views/Navigation.jspf" %>

<form action="modifyuser" method="post">
	<div class="main">
		<h2 align="center">User List - Edit and Delete</h2>
		
	</div>
	
<br>
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
<center>
<table class="content-table">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Number</th>
<th>Status</th>
<th>Action</th>
<th>Action</th>
</tr>
<tr>
<%
try{
	
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
	Statement st = con.createStatement();
	ResultSet rs =st.executeQuery("select * from room where ustatus='available'");
	while (rs.next()){
		
	

%>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><a href="AllotRoom.jsp?id=<%=rs.getString(1)%>" >Allot</a></td>
<td><a href="DeleteRoom.jsp?id=<%=rs.getString(1)%>" >Remove</a></td>
</tr>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
</center>
					
</form>
</body>
	<!-- Footer Location-->
	<%@ include file="Views/NewFooter.jspf" %>
</html>