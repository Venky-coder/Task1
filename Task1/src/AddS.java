

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


@WebServlet("/AddS")
public class AddS extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="INSERT INTO student(F_name,L_name,S_mobile,S_email,S_address) VALUES (?, ?, ?, ?, ?)";
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
	
		String F_name=request.getParameter("F_name");
		String L_name=request.getParameter("L_name");
		String S_mobile=request.getParameter("S_mobile");
		String S_email=request.getParameter("S_email");
		String S_address=request.getParameter("S_address");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			PreparedStatement  st=con.prepareStatement(sql);
			
			st.setString(1,F_name);
			st.setString(2,L_name);
			st.setString(3,S_mobile);
			st.setString(4,S_email);
			st.setString(5,S_address);
			
			
		   st.executeUpdate();
			
		   response.sendRedirect("Home.jsp");
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}
}
