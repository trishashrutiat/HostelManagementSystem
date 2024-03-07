package com.UserRegistration;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DbUtil.DbUtil;

@WebServlet("/uploadphoto")
@MultipartConfig
public class UploadPhoto extends HttpServlet {
	      
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		
		String id = request.getParameter("id");
		String uemail = request.getParameter("email");
		Part filePart = request.getPart("filename");
	    InputStream uimage= filePart.getInputStream();
		
	    PrintWriter out=response.getWriter();
		out.println(uemail);
		out.println(uimage);
		out.println(filePart);
		Connection con =null;
		try {
			// Initialize the database
           con = DbUtil.initializeDatabase();
			PreparedStatement pst = con.prepareStatement("update users set uimage=? where uemail=?" );
			pst.setBlob(1, uimage);
			pst.setString(2, uemail);
			pst.executeUpdate();
			response.sendRedirect("PhotoViewer.jsp");
			//request.setAttribute("id", id);
			//request.getRequestDispatcher("PhotoViewer.jsp").forward(request, response);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index.jsp");
		} 
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}

