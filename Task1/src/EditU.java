

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditU
 */
@WebServlet("/EditU")
public class EditU extends HttpServlet {
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String U_id=(String)request.getAttribute("U_id");
		String U_name=(String)request.getAttribute("U_name");
		String U_pass=(String)request.getAttribute("U_pass");
		String U_mobile=(String) request.getAttribute("U_mobile");
		String U_email=(String)request.getAttribute("U_email");
		String U_address=(String)request.getAttribute("U_address");
		String U_userrole=(String)request.getAttribute("U_userrole");
		
		String sql="Update user1 set Username=?,password=?,Mobile=?,Email=?,Address=?,User_role=? where U_id="+U_id+"";
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			if(con != null)
			{
				System.out.println("connected");
			}
			
		PreparedStatement  st=con.prepareStatement(sql);
			
			
			st.setString(1, U_name);
			st.setString(2, U_pass);
			st.setString(3, U_mobile);
			st.setString(4, U_email);
			st.setString(5, U_address);
			st.setString(6, U_userrole);
					st.executeUpdate();
		
		request.setAttribute("message", "Data updated successfully");
		request.getRequestDispatcher("U_list.jsp").forward(request, response); 	
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		
	}


}
