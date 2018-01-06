<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Spring MVC Form Handling</title>
	</head>
	<body>
		<h2>BOOK APPOINTMENT</h2>
		<form:form method="POST" action="saveappointment.html">
	   		<table>
	   		
	   		 <tr>
			        <td><form:label path="appointmentID">appointmentID:</form:label></td>
			        <td><form:input path="appointmentID" value="${AppointmentBean.appointmentID}"/></td>
			    </tr>
	   		
	   		 <tr>
			        <td><form:label path="doctorID">doctorID</form:label></td>
			        <td><form:input path="doctorID" value="${AppointmentBean.doctorID}" /></td>
			    </tr>
	   		 <tr>
			        <td><form:label path="patientID">patientID</form:label></td>
			        <td><form:input path="patientID" value="${AppointmentBean.patientID}" /></td>
			    </tr>
			   
			    <tr>
			        <td><form:label path="appointmentDate">appointmentDate:</form:label></td>
			        <td><form:input path="appointmentDate" value="${AppointmentBean.appointmentDate}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="appointmentTime">appointmentTime</form:label></td>
			        <td><form:input path="appointmentTime" value="${AppointmentBean.appointmentTime}"/></td>
			    </tr>
			 
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>

	</body>
</html>