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

<meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div align="right" class="head">${u_name}</div>
	<%
		String F_name = request.getParameter("F_name");

		String sql = "select * from student where F_name= ?";
		String url = "jdbc:mysql://localhost:3306/user";
		String username = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement st = con.prepareStatement(sql);

			st.setString(1, F_name);

			ResultSet rs = st.executeQuery();
			if (rs.next()) {
	%>
	<table border="1" align="center">
		<tr>
			<th>ID</th>
			<th>First name</th>
			<th>Last info</th>
			<th>Mobile Number</th>
			<th>Email Address</th>
			<th>Address</th>
			<th>Action</th>
		</tr>
		<tr>
			<td><%=rs.getString("S_id")%></td>
			<td><%=rs.getString("F_name")%></td>
			<td><%=rs.getString("L_name")%></td>
			<td><%=rs.getString("S_mobile")%></td>
			<td><%=rs.getString("S_email")%></td>
			<td><%=rs.getString("S_address")%></td>
			<td><button>
					<a style="text-decoration: none" href="EditS.jsp?S_id=<%=rs.getString("S_id")%>">Edit</a>
				</button>
		</tr>


		<%
			} else {
				request.setAttribute("message", "Data is not found");
				request.getRequestDispatcher("S_info.jsp").forward(request, response);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<button style="float: left;">
			<a href="Logout" style="text-decoration: none;">LogOut</a>
		</button>
</body>
</html>