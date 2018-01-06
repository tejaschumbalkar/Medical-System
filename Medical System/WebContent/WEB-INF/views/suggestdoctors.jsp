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
<c:if test="${!empty doctors}">
		<h2>List doctors</h2>
	<table align="left" border="1">
		<tr>
			<th>doctorID</th>
			<th>doctorName</th>
			<th>dateOfBirth</th>
			<th>dateOfJoining</th>
			<th>gender</th>
			<th>qualification</th>
			<th>specialization</th>
			<th>yearsOfExperience</th>
			<th>street</th>
			<th>location</th>
			<th>city</th>
			<th>state</th>
			<th>pincode</th>
			<th>contactNumber</th>
			<th>emailID</th>
		</tr>

		<c:forEach items="${doctors}" var="doctors">
			<tr>
				<td><c:out value="${doctors.doctorID}"/></td>
				<td><c:out value="${doctors.doctorName}"/></td>
				<td><c:out value="${doctors.dateOfBirth}"/></td>
				<td><c:out value="${doctors.dateOfJoining}"/></td>
				<td><c:out value="${doctors.gender}"/></td>
				<td><c:out value="${doctors.qualification}"/></td>
				<td><c:out value="${doctors.specialization}"/></td>
				<td><c:out value="${doctors.yearsOfExperience}"/></td>
				<td><c:out value="${doctors.street}"/></td>
				<td><c:out value="${doctors.location}"/></td>
				<td><c:out value="${doctors.city}"/></td>
				<td><c:out value="${doctors.state}"/></td>
				<td><c:out value="${doctors.pincode}"/></td>
				<td><c:out value="${doctors.contactNumber}"/></td>
				<td><c:out value="${doctors.emailID}"/></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>