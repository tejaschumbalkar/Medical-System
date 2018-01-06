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
	<c:if test="${!empty DocsList}">
		<h2>List of Doctors</h2>
	<table align="left" border="1">
		<tr>
			<th>Doctor ID</th>
			<th>Name</th>
			<th>DOB</th>
			<th>DOJ</th>
			<th>Gender</th>
			<th>Qualification</th>
			<th>Specialization</th>
			<th>Years of Experience</th>
			<th>Street</th>
			<th>Location</th>
			<th>City</th>
			<th>State</th>
			<th>Pincode</th>
			<th>Contact No.</th>
			<th>email ID</th>
			
		</tr>

		<c:forEach items="${DocsList}" var="doc">
			<tr>
				<td><c:out value="${doc.doctorID}"/></td>
				<td><c:out value="${doc.doctorName}"/></td>
				<td><c:out value="${doc.dateOfBirth}"/></td>
				<td><c:out value="${doc.dateOfJoining}"/></td>
				<td><c:out value="${doc.gender}"/></td>
				<td><c:out value="${doc.qualification}"/></td>
				<td><c:out value="${doc.specialization}"/></td>
				<td><c:out value="${doc.yearsOfExperience}"/></td>
				<td><c:out value="${doc.street}"/></td>
				<td><c:out value="${doc.location}"/></td>
				<td><c:out value="${doc.city}"/></td>
				<td><c:out value="${doc.state}"/></td>
				<td><c:out value="${doc.pincode}"/></td>
				<td><c:out value="${doc.contactNumber}"/></td>
				<td><c:out value="${doc.emailID}"/></td>
				
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>