<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel = "stylesheet" type = "text/css" href= "tcal.css"/>
	<script type = "text/javascript" src="tcal.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="changePassword1.html"  method="GET">
		<table border="3" align="center"  width="75%">
		<tr>
				
				<td>User ID:</td>
				<td><input type="text" name="userID" maxlength="6" placeholder="User-Id"/></td>
			</tr>
	
			<tr>
				<td>Please Enter your Street Name:</td>
				<td><input type="text" name="street" placeholder="Street Name Only" size="25" /></td>
			</tr>
			<tr>
				<td>Enter Mobile No:</td>
				<td><input type="text" name="mobileNo" placeholder="Same no which was used to register user" size="40" maxlength="10" /></td>
			</tr>
			
			<tr>
				<td></td>

				<td><input type="submit" value="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>