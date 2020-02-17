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
<body align="center">
	<div align="right" class="head">${u_name}</div>
	<div>
		<h1>${message}</h1>
	</div>
	<div class="Add">
		<h1>######Perform the operations on database######</h1>
		<button>
			<a style="text-decoration: none" href="AddS.jsp">Add Student</a>
		</button>
		<br> <br>
		<button>
			<a style="text-decoration: none" href="S_info.jsp">Student
				Information</a>
		</button>
		<br> <br>
		<button>
			<a style="text-decoration: none" href="S_list.jsp">Student list</a>
		</button>
		<br> <br>
		<button>
			<a style="text-decoration: none" href="U_list.jsp">User list</a>
		</button>
		<br>
		<br>

		<button>
			<a href="Logout" style="text-decoration: none;">LogOut</a>
		</button>

	</div>
</body>
</html>