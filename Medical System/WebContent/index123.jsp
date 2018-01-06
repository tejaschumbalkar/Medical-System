<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>OCS</title>
<link rel="shortcut icon" href="online-clinic.jpg">
<link rel="stylesheet" type="text/css" href="1.css">

</head>


	
	
	
<div class="body"></div>
		<div class="grad"></div>
		<div class="header">

			<div>Online<span>Clinic</span></div>
		</div>
		<br>
	
		
		<form:form action="login.html">
		<div class="login">
		<h3>${store}</h3>
				<input type="text" placeholder="username" minlength="6" maxlength="6" name="userID" value="${CredentialsBean.userID}"><br>
				<input type="password" placeholder="password" maxlength="8" name="password" value="${CredentialsBean.password}"><br>
				<input type="submit" value="Login" onclick="fun()"><br><br>
</form:form>
              Forgot Your Password?<a href="forgetpassword.html">click here to reset</a><br>


<p class="text--center">Not a member? <a href="register.html">Sign up now</a> <span class="fontawesome-arrow-right"></span></p>
	
	     
	


		</div>
	
</html>