<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("name")==null){
	
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/HostelStyle.css">
<!-- Load font awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>HMS-Index</title>
</head>

<!-- Header and Navigation -->
<%@ include file="Views/Navigation.jspf" %>


  <div id="main">
    <article>
    
    
    
    
    </article>
  </div>
  <!-- Footer Location-->
	<%@ include file="Views/NewFooter.jspf" %>
</body>

</html>