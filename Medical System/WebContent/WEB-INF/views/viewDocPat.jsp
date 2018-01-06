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
<form:form method="POST" action="list_of_doctors1.html">
	   		<table>
	   		
	   		 <tr>
			        <td><form:label path="specialization">specialization:</form:label></td>
			        <td><form:input path="specialization" value="${DoctorBean.specialization}"/></td>
			    </tr>
	   		
	   		 <tr>
			        <td><form:label path="dateOfJoining">Appointment Date:</form:label></td>
			        <td><form:input path="dateOfJoining" value="${DoctorBean.dateOfJoining}" /></td>
			    </tr>
	   		 <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			  </table>
			  </form:form> 





</body>
</html>