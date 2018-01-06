<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel = "stylesheet" type = "text/css" href= "tcal.css"/>
	<script type = "text/javascript" src="tcal.js"></script> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1> NEW USER REGISTRATION</H1>

<form:form method="GET" action="registeruser.html">
	   		<table>
	   		
	   		  <tr>
			        <td><form:label path="firstName">firstName:</form:label></td>
			        <td><form:input path="firstName" value="${ProfileBean.firstName}"/></td>
			    </tr>
	   		
			    <tr>
			        <td><form:label path="lastName">lastName:</form:label></td>
			        <td><form:input path="lastName" value="${ProfileBean.lastName}"/></td>
			    </tr>
	   		<tr>
			        <td><form:label path="userID">userID:</form:label></td>
			        <td><form:input path="userID" value="${ProfileBean.userID}" readonly="true"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="password">password:</form:label></td>
			        <td><form:input path="password" type="password" value="${ProfileBean.userID}"/></td>
			    </tr>
			
			    <tr>
			        <td><form:label path="dateOfBirth">dateOfBirth</form:label></td>
			        <td><form:input path="dateOfBirth" value="${ProfileBean.dateOfBirth}" class="tcal" readonly="true"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="gender">gender:</form:label></td>
                    <td><form:radiobutton path="gender" value="Male"/>MALE</td>
                    <td><form:radiobutton path="gender" value="Female"/>FEMALE</td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="street">street:</form:label></td>
                    <td><form:input path="street" value="${ProfileBean.street}"/></td>
			    </tr>
			     <tr>
			        <td><form:label path="location">location:</form:label></td>
                    <td><form:input path="location" value="${ProfileBean.location}"/></td>
			    </tr>
			     <tr>
			        <td><form:label path="city">city:</form:label></td>
                    <td><form:input path="city" value="${ProfileBean.city}"/></td>
			    </tr>
			     <tr>
			        <td><form:label path="state">state:</form:label></td>
                    <td><form:input path="state" value="${ProfileBean.state}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="pincode">pincode:</form:label></td>
                    <td><form:input path="pincode" value="${ProfileBean.pincode}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="mobileNo">mobileNo:</form:label></td>
                    <td><form:input path="mobileNo" value="${ProfileBean.mobileNo}"/></td>
			    </tr>
			    
			       <tr>
			        <td><form:label path="emailID">emailID:</form:label></td>
                    <td><form:input path="emailID" value="${ProfileBean.emailID}"/></td>
			    </tr>
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>


</body>
</html>