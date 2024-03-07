package Management;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/complaint")
public class Complaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String ucontent = request.getParameter("content");
		String wname = request.getParameter("wname");
		Connection con =null;
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","core","core");
			PreparedStatement pst = con.prepareStatement("insert into complaint (uname,uemail,ucontent,wname) values (?,?,?,?)" );
			
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, ucontent);
			pst.setString(4, wname);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Complaint.jsp");
			
			if (rowCount > 0) {
				request.setAttribute("status", "success");
								
			}else	{
				request.setAttribute("status", "failed");
			}
		dispatcher.forward(request, response);
			
						
		} catch (Exception e) {
			e.printStackTrace();
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
