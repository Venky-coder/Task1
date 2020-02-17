

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Signup")
public class Signup extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="INSERT INTO user1(Username,password,Mobile,Email,Address,User_role) VALUES (?, ?, ?, ?, ?, ?)";
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
	
		String U_name=request.getParameter("U_name");
		String U_pass=request.getParameter("U_pass");
		String U_mobile=request.getParameter("U_mobile");
		String U_email=request.getParameter("U_email");
		String U_address=request.getParameter("U_address");
		String U_userrole=request.getParameter("U_userrole");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			PreparedStatement  st=con.prepareStatement(sql);
			
			st.setString(1,U_name);
			st.setString(2,U_pass);
			st.setString(3,U_mobile);
			st.setString(4,U_email);
			st.setString(5,U_address);
			st.setString(6,U_userrole);
			
			
			
		   st.executeUpdate();
			
		   response.sendRedirect("Login.jsp");
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}
}
