

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditR")
public class EditR extends HttpServlet {
	
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String U_id=request.getParameter("U_id");
			String U_name=request.getParameter("U_name");
			String U_userrole=request.getParameter("U_userrole");
			String sql="Update user1 set User_role=? where U_id="+U_id+"";
			String url="jdbc:mysql://localhost:3306/user" ;
			String username="root";
			String password="root";
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection(url,username,password);
				
				
			PreparedStatement  st=con.prepareStatement(sql);
				
				
		
				st.setString(1, U_userrole);
						st.executeUpdate();
			
			request.setAttribute("message", "Data updated successfully");
			request.getRequestDispatcher("U_list.jsp").forward(request, response); 	
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		

	}

}
