<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalited");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("u_name") == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	<div class="head">${u_name}</div>
	<%
		String U_id = request.getParameter("U_id");
		System.out.println(U_id);
		//String uid="1";
		String sql = "select * from user1 where U_id=?";
		String url = "jdbc:mysql://localhost:3306/user";
		String username = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, U_id);

			st.executeQuery();

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
	%>

	<div class="Addi" style="text-align: center">
		<h1>You can edit the information</h1>
		<form action="User_History" method="post">
			User ID: <input type="text" name="U_id"
				value="<%=rs.getString("U_id")%>" readonly><br> <br>
			Enter the Username: <input type="text" name="U_name"
				value="<%=rs.getString("Username")%>" required><br> <br>
			Enter the Password: <input type="text" name="U_pass"
				value="<%=rs.getString("password")%>" required><br> <br>
			Enter the mobilr number: <input type="text" name="U_mobile"
				value="<%=rs.getString("Mobile")%>" required><br> <br>
			Enter the Email Address: <input type="text" name="U_email"
				value="<%=rs.getString("Email")%>" required><br> <br>
			Enter the Address: <input type="text" name="U_address"
				value="<%=rs.getString("Address")%>" required><br> <br>
			Enter the User_role: <input type="text" name="U_userrole"
				value="<%=rs.getString("User_role")%>" required><br> <br>
			<input type="submit" value="Update">
		</form>
	</div>
	<%
		} else {

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	%>

</body>
</html>