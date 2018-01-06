<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="changePass.html"  method="GET">
		<table border="3" align="center" bgcolor="skyblue">
		<tr>
				
				<td>User ID:</td>
				<td><input type="text" name="userID" value="${user}"  readonly="true"/></td>
			</tr>
	
			<tr>
				<td>New Password</td>
				<td><input type="password" name="newPassword" /></td>
			</tr>
			<tr>
				<td>Confirm new Password</td>
				<td><input type="password" name="confirmPassword" /></td>
			</tr>
			<tr>
				<td></td>

				<td><input type="submit" value="update" /></td>
			</tr>
		</table>
	</form>
</body>
</html>