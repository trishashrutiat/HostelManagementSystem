package com.UserRegistration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import the DB connectivity class
import com.DbUtil.DbUtil;

@WebServlet("/biodata")
public class Biodata extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//Get all the string values from jsp page
		String uemail = request.getParameter("email");
		String ufname = request.getParameter("fname");
		String ugender = request.getParameter("gender");
		String uemobile = request.getParameter("emobile");
		String udob = request.getParameter("dob");  
		String udepartment = request.getParameter("department");
		String uyear = request.getParameter("year");
		String uaddress = request.getParameter("address");
		Connection con =null;
		try {
			// Initialize the database
            con = DbUtil.initializeDatabase();
            
			PreparedStatement pst = con.prepareStatement("update users set ufname=?,ugender=?,uemobile=?,udepartment=?,uyear=?,uaddress=?,udob=? where uemail=?");
			pst.setString(1, ufname);
			pst.setString(2, ugender);
			pst.setString(3, uemobile);
			pst.setString(4, udepartment);
			pst.setString(5, uyear);
			pst.setString(6, uaddress);
			pst.setDate(7, java.sql.Date.valueOf(udob));//Convert the string value to date
			pst.setString(8, uemail);
			pst.executeUpdate();
			response.sendRedirect("BioData.jsp");
						
		} catch (Exception e) {
			response.sendRedirect("Index.jsp");
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
