

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditS
 */
@WebServlet("/EditS")
public class EditS extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String S_id=(String)request.getAttribute("S_id");
		String F_name=(String)request.getAttribute("F_name");
		String L_name=(String)request.getAttribute("L_name");
		String S_mobile=(String) request.getAttribute("S_mobile");
		String S_email=(String)request.getAttribute("S_email");
		String S_address=(String)request.getAttribute("S_address");
	
		String sql="Update student set F_name=?,L_name=?,S_mobile=?,S_email=?,S_address=? where S_id="+S_id+"";
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
		PreparedStatement  st=con.prepareStatement(sql);
			
			
			st.setString(1, F_name);
			st.setString(2, L_name);
			st.setString(3, S_mobile);
			st.setString(4, S_email);
			st.setString(5, S_address);
			
					st.executeUpdate();
		
		request.setAttribute("message", "Data updated successfully");
		request.getRequestDispatcher("S_list.jsp").forward(request, response); 	
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		

	}

}
