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
		<form:form method="POST" commandName="add">
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

		<c:forEach items="${ViewAll}" var="view">
			<tr>
				<td><c:out value="${view.doctorID}"/></td>
				<td><c:out value="${view.doctorName}"/></td>
				<td><c:out value="${view.dateOfBirth}"/></td>
				<td><c:out value="${view.dateOfJoining}"/></td>
				<td><c:out value="${view.gender}"/></td>
				<td><c:out value="${view.qualification}"/></td>
				<td><c:out value="${view.specialization}"/></td>
				<td><c:out value="${view.yearsOfExperience}"/></td>
				<td><c:out value="${view.street}"/></td>
				<td><c:out value="${view.location}"/></td>
				<td><c:out value="${view.city}"/></td>
				<td><c:out value="${view.state}"/></td>
				<td><c:out value="${view.pincode}"/></td>
				<td><c:out value="${view.contactNumber}"/></td>
				<td><c:out value="${view.emailID}"/></td>
				<td align="center"><a href="edit.html?doctorID=${view.doctorID}">Edit</a> | <a href="delete.html?doctorID=${view.doctorID}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
	</form:form>
</body>
</html>