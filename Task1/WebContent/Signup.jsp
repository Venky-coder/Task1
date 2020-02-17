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
<div class="Addi" style="text-align: center">
	<h1>Enter the following information</h1>
	<form action="Signup" method="post">
		Enter the Username: <input type="text" name="U_name"
			placeholder="Enter the Username" required><br> <br>
		Enter the Password: <input type="password" name="U_pass"
			placeholder="Enter the Password" required><br> <br>
		Enter the mobilr number: <input type="text" name="U_mobile"
			placeholder="Enter the mobilr number" required><br> <br>
		Enter the Email Address: <input type="text" name="U_email"
			placeholder="Enter the Email Address" required><br> <br>
		Enter the Address: <input type="text" name="U_address"
			placeholder="Enter the Address" required><br> <br>
			Enter the User_role: <input type="text" name="U_userrole"
			placeholder="Enter the Userrole" required><br> <br>
		<input type="submit" value="Submit">
			</form>
</div>
</body>
</html>