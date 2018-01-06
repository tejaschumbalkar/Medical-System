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

		<h2>List Employees</h2>
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

		<c:forEach items="${ViewAll}" var="ViewAll">
			<tr>
				<td><c:out value="${ViewAll.doctorID}"/></td>
				<td><c:out value="${ViewAll.doctorName}"/></td>
				<td><c:out value="${ViewAll.dateOfBirth}"/></td>
				<td><c:out value="${ViewAll.dateOfJoining}"/></td>
				<td><c:out value="${ViewAll.gender}"/></td>
				<td><c:out value="${ViewAll.qualification}"/></td>
				<td><c:out value="${ViewAll.specialization}"/></td>
				<td><c:out value="${ViewAll.yearsOfExperience}"/></td>
				<td><c:out value="${ViewAll.street}"/></td>
				<td><c:out value="${ViewAll.location}"/></td>
				<td><c:out value="${ViewAll.city}"/></td>
				<td><c:out value="${ViewAll.state}"/></td>
				<td><c:out value="${ViewAll.pincode}"/></td>
				<td><c:out value="${ViewAll.contactNumber}"/></td>
				<td><c:out value="${ViewAll.emailID}"/></td>
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>