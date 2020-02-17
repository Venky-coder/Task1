
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


@WebServlet("/Student_History")
public class Student_History extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String S_id=request.getParameter("S_id");
		String F_name=request.getParameter("F_name");
		String L_name=request.getParameter("L_name");
		String S_mobile=request.getParameter("S_mobile");
		String S_email=request.getParameter("S_email");
		String S_address=request.getParameter("S_address");
		String U_name1=(String)session.getAttribute("u_name");
	
		Timestamp DateTime = new java.sql.Timestamp(new java.util.Date().getTime());
		String sql="Select * from student where S_id=?";
		
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			
		PreparedStatement  st=con.prepareStatement(sql);
			
			
			st.setString(1, S_id);
			st.executeQuery();
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				String sqli="INSERT INTO student_history(S_id,F_name,L_name,S_mobile,S_email,S_address,EditedBy,DateTime) VALUES (?,?,?, ?, ?, ?, ?,?)";
				PreparedStatement  sti=con.prepareStatement(sqli);
				sti.setString(1, rs.getString("S_id"));
				sti.setString(2, rs.getString("F_name"));
				sti.setString(3, rs.getString("L_name"));
				sti.setString(4, rs.getString("S_mobile"));
				sti.setString(5, rs.getString("S_email"));
				sti.setString(6, rs.getString("S_address"));
				sti.setString(7, U_name1);
				sti.setTimestamp(8, DateTime);
				
				sti.executeUpdate();
			}
				 
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		request.setAttribute("S_id", S_id);
		request.setAttribute("F_name", F_name);
		request.setAttribute("L_name", L_name);
		request.setAttribute("S_mobile", S_mobile);
		request.setAttribute("S_email", S_email);
		request.setAttribute("S_address", S_address);

		
		request.getRequestDispatcher("EditS").forward(request, response); 	
			
	}
}

