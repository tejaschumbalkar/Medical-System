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
<form:form action="login.html" method="POST" commandName="hi">
<fieldset>
<legend>Login</legend><br>
<table>
<tr>
			        <td><form:label path="userID">Enter User name:</form:label></td>
			        <td><form:input path="userID" minlength="6" maxlength="6"  value="${CredentialsBean.userID}" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="password">Enter Password:</form:label></td>
			        <td><form:input path="password" minlength="1" maxlength="8"  value="${CredentialsBean.password}" /></td>
			    </tr>

<tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
</table>

<!--  Enter User name:<input type="text" name="userID"><br>
 Enter Password:<input type="text" name="password"><br>
 <input type="submit" value="Submit"/> -->
</fieldset>
</form:form>

</body>
</html>