package com.UserRegistration;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.System.Logger.Level;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;

import com.DbUtil.DbUtil;


@WebServlet("/DisplayImage")
public class DisplayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		{ 
			    Statement stmt=null;
			    String sql=null;
			BufferedInputStream bin=null;
			 BufferedOutputStream bout=null;
		 InputStream in =null;

			 response.setContentType("image/jpeg");  
		  ServletOutputStream out;  
			  out = response.getOutputStream();  
			 Connection con =null;
			
			    
			        try {
			        	// Initialize the database
				         try {
							con = DbUtil.initializeDatabase();
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
			        	 
			        	String id = request.getParameter("id");
			        	stmt = con.createStatement();
			            sql = "SELECT uimage FROM users WHERE id='"+id+"'";
			            ResultSet result = stmt.executeQuery(sql);
			           	            
			            
			            
			   if(result.next()){
			    in=result.getBinaryStream(13);//Since my data was in thirteenth column of table.
			         }
			         bin = new BufferedInputStream(in);  
			        bout = new BufferedOutputStream(out);  
			         int ch=0;   
			       while((ch=bin.read())!=-1)  
			         {  
			           bout.write(ch);  
			          }  

			        } catch (SQLException ex) {
			            
			        }
			     finally{
			       try{
			           if(bin!=null)bin.close();  
			         if(in!=null)in.close();  
			         if(bout!=null)bout.close();  
			          if(out!=null)out.close();
			            if(con!=null)con.close();
			       }catch(IOException | SQLException ex){
			         System.out.println("Error : "+ex.getMessage());
			      }
			    }
		
		
	}

	}
}


