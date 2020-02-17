

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
 * Servlet implementation class Delete
 */
@WebServlet("/DeleteL")
public class DeleteL extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

        String S_id=request.getParameter("S_id");
        int v=Integer.parseInt(S_id);
		String sql="DELETE FROM student WHERE S_id=?";
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
			
			st.setInt(1,v );
			
		st.executeUpdate();
								
			response.sendRedirect("S_list.jsp");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		
			}


}
