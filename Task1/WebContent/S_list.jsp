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

	<p align="center">This is list of all students</p>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalited");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("u_name") == null) {
			response.sendRedirect("Login.jsp");
		}

		String sql = "select * from student";
		String url = "jdbc:mysql://localhost:3306/user";
		String username = "root";
		String password = "root";
		int flag = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement(sql);

			ResultSet rs = st.executeQuery();
	%>
	<table border="1" align="center">
		<tr>
			<th>ID</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Mobile Number</th>
			<th>Email Address</th>
			<th>Address</th>
			<th colspan="2" style="text-align: center;">Actions</th>

		</tr>
		<%
			while (rs.next()) {
					flag = 1;
		%>
		<tr>
			<td><%=rs.getString("S_id")%></td>
			<td><%=rs.getString("F_name")%></td>
			<td><%=rs.getString("L_name")%></td>
			<td><%=rs.getString("S_mobile")%></td>
			<td><%=rs.getString("S_email")%></td>
			<td><%=rs.getString("S_address")%></td>
			<td><button type="button" name="button">
					<a href="EditS.jsp?S_id=<%=rs.getString("S_id")%>" style="text-decoration: none;">edit</a>
				</button></td>
			<td><button name="button" style="margin-left: 5px">
					<a href="DeleteL?S_id=<%=rs.getString("S_id")%>"
						style="text-decoration: none;">Delete</a>
				</button></td>
		</tr>

		<%
			}
				if (flag == 1) {

				} else {
					request.setAttribute("message", "Data is not found");
					request.getRequestDispatcher("Home.jsp").forward(request, response);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<br>
	<button style="float: center;">
		<a href="Logout" style="text-decoration: none;">LogOut</a>
	</button>
</body>
</html>