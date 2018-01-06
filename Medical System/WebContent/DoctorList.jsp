<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
a:link, a:visited {
  
    color:#228B22;
    text-align: center;	
    text-decoration: none;
    display: inline-block;
}


a:hover, a:active {
    content: attr(title);
    background-color: red;
}
table {
    border-collapse: collapse;
    width: 100%;
}
th {
    background-color: #8FBC8F;
    color: white;
    border-bottom: 1px solid #ddd;
}
tr:nth-child(even) {background-color: #f2f2f2}
 td {
    
    text-align: left;
    border-bottom: 1px solid #ddd;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

		<br>
		<form:form method="POST" commandName="add">
	<table align="left" border="1" bgcolor="white">
		<tr>
			<th>Doctor ID</th>
			<th>Doctor Name</th>
			<th colspan="4">Date_Of_Birth</th>
			<th colspan="4">Date_Of_Joining</th>
			<th>Gender</th>
			<th>Qualification</th>
			<th>Specialization</th>
			<th>Years Of Experience</th>
			<th>Street</th>
			<th>Location</th>
			<th>City</th>
			<th>State</th>
			<th>Pincode</th>
			<th>Contact Number</th>
			<th>Email-ID</th>
		</tr>

		<c:forEach items="${ViewAll}" var="view">
			<tr>
				<td><c:out value="${view.doctorID}"/></td>
				<td><c:out value="${view.doctorName}"/></td>
				<td colspan="4"><c:out value="${view.dateOfBirth}"/></td>
				<td colspan="4"><c:out value="${view.dateOfJoining}"/></td>
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
			</tr>
		</c:forEach>
	</table>
	</form:form>
</body>
</html>