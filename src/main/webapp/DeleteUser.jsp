<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
String id = request.getParameter("id");
Connection con =null;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
	Statement pst = con.createStatement();
	pst.executeUpdate("delete from users where id='"+id+"'");
	response.sendRedirect("ModifyUser.jsp?msg=deleted");
				
} catch (Exception e) {
	response.sendRedirect("ModifyUser.jsp?msg=invalid");
} 
finally {
	try {
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>