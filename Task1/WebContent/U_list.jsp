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
	<div align="right" class="head">${u_name}</div>
	<div>
		<h1>${message}</h1>
	</div>

	<p align="center">This is list of all students</p>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalited");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("u_name") == null) {
			response.sendRedirect("Login.jsp");
		}

		String U_name1=(String)session.getAttribute("u_name");
		String sql = "select * from user1 WHERE Username <> ?";
		String url = "jdbc:mysql://localhost:3306/user";
		String username = "root";
		String password = "root";
		int flag = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, U_name1);

			ResultSet rs = st.executeQuery();
	%>
	<table border="1" align="center">
		<tr>
			<th>ID</th>
			<th>Username</th>
			<th>password</th>
			<th>Mobile Number</th>
			<th>Email Address</th>
			<th>Address</th>
			<th>User_role</th>

			<th colspan="3" style="text-align: center;">Actions</th>

		</tr>
		<%
			while (rs.next()) {
					flag = 1;
		%>
		<tr>
			<td><%=rs.getString("U_id")%></td>
			<td><%=rs.getString("Username")%></td>
			<td><%=rs.getString("password")%></td>
			<td><%=rs.getString("Mobile")%></td>
			<td><%=rs.getString("Email")%></td>
			<td><%=rs.getString("Address")%></td>
			<td><%=rs.getString("User_role")%></td>
			<td><button name="button" >
					<a href="EditU.jsp?U_id=<%=rs.getString("U_id")%>" style="text-decoration: none;">edit</a>
				</button></td>
			<td><button name="button"
					style="margin-left: 5px; margin-right: 5px">
					<a href="Delete?F_id=<%=rs.getString("U_id")%>"
						style="text-decoration: none">Delete</a>
				</button></td>
			<td><button name="button">
					<a href="EditR.jsp?U_id=<%=rs.getString("U_id")%>" style="text-decoration: none">Role_edit</a>
				</button></td>
		</tr>
	
	<%
		}
			if (flag == 1) {

			} else {
				request.setAttribute("message", "Data is not found");
				request.getRequestDispatcher("Home1.jsp").forward(request, response);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
	<br>
	<div class="center">
		<button style="float: center">
			<a href="Logout" style="text-decoration: none;">LogOut</a>
		</button>
	</div>

</body>
</html>