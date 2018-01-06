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

		<h2>Appointment Details</h2>
	<table align="left" border="1">
		<tr>
			<th>APPOINTMENTID</th>
			<th>DOCTORID</th>
			<th>PATIENTID</th>
			<th>APPOINTMENT_DATE</th>
			<th>APPOINTMENT_TIME</th>
		</tr>

		
			<tr>
				<td><c:out value="${beans.appointmentID}"/></td>
				<td><c:out value="${beans.doctorID}"/></td>
				<td><c:out value="${beans.patientID}"/></td>
				<td><c:out value="${beans.appointmentDate}"/></td>
				<td><c:out value="${beans.appointmentTime}"/></td>
			</tr>
		
	</table>

</body>
</html>