
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/User_History")
public class User_History extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String U_id=request.getParameter("U_id");
		String U_name=request.getParameter("U_name");
		String U_pass=request.getParameter("U_pass");
		String U_mobile=request.getParameter("U_mobile");
		String U_email=request.getParameter("U_email");
		String U_address=request.getParameter("U_address");
		String U_userrole=request.getParameter("U_userrole");
		String U_name1=(String)session.getAttribute("u_name");
		System.out.println(U_name1);
		Timestamp DateTime = new java.sql.Timestamp(new java.util.Date().getTime());
		String sql="Select * from user1 where U_id=?";
		
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			
		PreparedStatement  st=con.prepareStatement(sql);
			
			
			st.setString(1, U_id);
			st.executeQuery();
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				String sqli="INSERT INTO user1_history(U_id,Username,password,Mobile,Email,Address,User_role,EditedBy,DateTime) VALUES (?,?,?,?, ?, ?, ?, ?,?)";
				PreparedStatement  sti=con.prepareStatement(sqli);
				sti.setString(1, rs.getString("U_id"));
				sti.setString(2, rs.getString("Username"));
				sti.setString(3, rs.getString("password"));
				sti.setString(4, rs.getString("Mobile"));
				sti.setString(5, rs.getString("Email"));
				sti.setString(6, rs.getString("Address"));
				sti.setString(7, rs.getString("User_role"));
				sti.setString(8, U_name1);
				sti.setTimestamp(9, DateTime);
				
				
				 sti.executeUpdate();
			}
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		request.setAttribute("U_id", U_id);
		request.setAttribute("U_name", U_name);
		request.setAttribute("U_pass", U_pass);
		request.setAttribute("U_mobile", U_mobile);
		request.setAttribute("U_email", U_email);
		request.setAttribute("U_address", U_address);
		request.setAttribute("U_userrole", U_userrole);
		
		request.getRequestDispatcher("EditU").forward(request, response); 	
			
	}
}

