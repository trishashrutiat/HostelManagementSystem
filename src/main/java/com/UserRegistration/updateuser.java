package com.UserRegistration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateuser")
public class updateuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String umobile = request.getParameter("contact");
		Connection con =null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
			PreparedStatement pst = con.prepareStatement("update users set uname=?,uemail=?,umobile=? where id=?");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, umobile);
			pst.setString(4, id);
			pst.executeUpdate();
			response.sendRedirect("ModifyUser.jsp?msg=valid");
						
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
			}

}
