<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div class="loginBox" style="text-align: center">
		<img src="images/img1.png" alt="Login" class="avatar">

		<form action="Login" method="post">
			<input type="text" name="Username" placeholder="Username" required>
			<br> <br> <input type="password" name="pass"
				placeholder="password" required><br> <br> <input
				type="submit" name="submit">
				<button><a style="text-decoration: none" href="Signup.jsp">SignUp</a></button><br><br>
			<a href="Forget_pass.jsp">Forget Pasword?</a>


		</form>
	</div>

</body>
</html>