import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Connect {

	private static final String PrepareStatement = null;
	public  String User_role = null;
		
	public int check(String uname, String pass) {
		String sql="select * from user1 where Username=? and password=?";
		String url="jdbc:mysql://localhost:3306/user" ;
		String username="root";
		String password="root";
		try {
	        System.out.println("in conn try");

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			
			PreparedStatement  st=con.prepareStatement(sql);
			
			st.setString(1,uname);
			st.setString(2,pass);
			
	        ResultSet rs=st.executeQuery();
			 
			if(rs.next())
			{
				User_role=rs.getString("User_role");
		        System.out.println("in conn if , user role="+ User_role);

				return 1;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return 0;
	}
}
