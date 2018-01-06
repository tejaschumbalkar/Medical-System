<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome To Login</title>
</head>
<body>
<form:form action="login.html" method="GET">
<fieldset>
<legend>Login</legend><br>
<table>
<tr>
			        <td><form:label path="userID">Enter User name:</form:label></td>
			        <td><form:input path="userID" value="${CredentialsBean.userID}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="password">Enter Password:</form:label></td>
			        <td><form:input path="password" value="${CredentialBean.password}" /></td>
			    </tr>

<tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
		      
		      <tr>
		      <td>
		      <a href="register.html">New User? Register Here</a>
		      </td></tr>
		      
		      <tr>
		      <td>
		      <a href="forgetpassword.html">Forget Password? Click Here</a>
		      </td></tr>
		      
</table>

</fieldset>
</form:form>

</body>
</html>