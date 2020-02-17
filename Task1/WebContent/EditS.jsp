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
	String S_id=request.getParameter("S_id");
	
//String uid="1";
	String sql="select * from student where S_id=?";
	String url="jdbc:mysql://localhost:3306/user" ;
	String username="root";
	String password="root";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,username,password);
		
		
	PreparedStatement  st=con.prepareStatement(sql);
		
		st.setString(1, S_id);
		
	st.executeQuery();
							
	ResultSet rs = st.executeQuery();
		
	if(rs.next()){

	
	%>

<div class="Addi" style="text-align: center">
	<h1>You can edit the information</h1>
	<form action="Student_History" method="post">
	    Student ID: <input type="text" name="S_id" 
	             value="<%=rs.getString("S_id")%>" readonly><br> <br>
		Enter the First Name: <input type="text" name="F_name"
				 value="<%=rs.getString("F_name")%>" required><br>
			<br> Enter the Last Name: <input type="text" name="L_name"
				 value="<%=rs.getString("L_name")%>" required><br>
			<br> Enter the mobilr number: <input type="text" name="S_mobile"
				 value="<%=rs.getString("S_mobile")%>" required><br>
			<br> Enter the Email Address: <input type="text" name="S_email"
				 value="<%=rs.getString("S_email")%>" required><br>
			<br> Enter the Address: <input type="text" name="S_address"
				 value="<%=rs.getString("S_address")%>" required><br>
			<br> <input type="submit" value="Update">
			</form>
</div>
<%
	
	}
	
	}
catch (Exception e) {
	
	e.printStackTrace();
} 
 
	%>
	
</body>
</html>