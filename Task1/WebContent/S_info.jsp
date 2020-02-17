<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		response.setHeader("cache-control", "no-cache,no-store,must-revalited");

		response.setHeader("pragma", "no-cache");

		response.setHeader("Expires", "0");

		if (session.getAttribute("u_name") == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	<div style="text-align: center">
		<h1>${message}</h1>
	</div>


	<div class="Add">
	
	
		<form align="center" action="S_inf.jsp">
			Enter the student NAME: <input type="text" name="F_name"><br>
			<br> <input type="submit">
		</form>
		<br>
		<form action="Logout" align="center"">
			<input type="submit" value="Logout">
		</form>

	</div>



</body>
</html>