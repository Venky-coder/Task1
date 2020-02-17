

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String u_name=(String)session.getAttribute("u_name");
		String session_id=session.getId();
		
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			Timestamp DateTime = new java.sql.Timestamp(new java.util.Date().getTime());
			String sql="UPDATE login_history SET Log_out = ? WHERE User_name=? AND Session_id=?;";
			PreparedStatement  st=con.prepareStatement(sql);
			st.setTimestamp(1, DateTime);
			st.setString(2, u_name);
			st.setString(3, session_id);
			st.executeUpdate();
		}
		 catch (Exception e) {
				
				e.printStackTrace();
			}
	
		session.removeAttribute("u_name");
		session.invalidate();
   
		response.sendRedirect("Login.jsp");
     
   
    
		
	}

	
}
