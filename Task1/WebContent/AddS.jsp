<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalited");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("u_name") == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	<div class="head">${u_name}</div>

	<div class="Addi" style="text-align: center">
		<h1>Enter the following information</h1>
		<form action="AddS" method="post">

			Enter the First Name: <input type="text" name="F_name"
				placeholder="Enter the First Name" required><br> <br>
			Enter the Last Name: <input type="text" name="L_pass"
				placeholder="Enter the Last Name" required><br> <br>
			Enter the mobilr number: <input type="text" name="S_mobile"
				placeholder="Enter the mobilr number" required><br> <br>
			Enter the Email Address: <input type="text" name="S_email"
				placeholder="Enter the Email Address" required><br> <br>
			Enter the Address: <input type="text" name="S_address"
				placeholder="Enter the Address" required><br> <br>
			<input type="submit" value="Submit">
		</form>
		<br>
		<br>
		<button style="float: center;">
			<a href="Logout" style="text-decoration: none;">LogOut</a>
		</button>
	</div>

</body>
</html>