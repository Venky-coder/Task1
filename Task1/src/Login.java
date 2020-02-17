
import java.io.IOException;
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

@WebServlet("/Login")
public class Login extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String u_name = request.getParameter("Username");
		String u_pass = request.getParameter("pass");
		Timestamp DateTime = new java.sql.Timestamp(new java.util.Date().getTime());
		
		Connect L = new Connect();
		int x = L.check(u_name, u_pass);
		String User_role = L.User_role;
		System.out.println("connect"+User_role);
		if (x == 1) {
			HttpSession session = request.getSession();
			if (User_role.equals("Admin")) {
				response.sendRedirect("Home.jsp");

				
				session.setAttribute("u_name", u_name);
			} else if (User_role.equals("Teacher")) {
				response.sendRedirect("Home1.jsp");
			
				session.setAttribute("u_name", u_name);

			} else {
				response.sendRedirect("Home2.jsp");
				
				session.setAttribute("u_name", u_name);

			}
			
			String url="jdbc:mysql://localhost:3306/user" ;
			String username="root";
			String password="root";
			
			try {
				String session_id=session.getId(); 
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(url,username,password);
				
				String sql="INSERT INTO login_history(Session_id,User_name,Login_Time) VALUES (?,?,?)";
				PreparedStatement  st=con.prepareStatement(sql);
				st.setString(1, session_id);
				st.setString(2, u_name);
				st.setTimestamp(3, DateTime);
				st.executeUpdate();
			}
			 catch (Exception e) {
					
					e.printStackTrace();
				}
			
		}

		else {
			response.sendRedirect("Login.jsp");
		}
	}
	

}
