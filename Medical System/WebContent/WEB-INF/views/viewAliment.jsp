<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form:form method="POST" action="/aviDelete.html">

<c:if test="${!empty patientBean}">
	<table align="left" border="1">
		<tr>
			<th>patientID</th>
			<th>userID</th>
			<th>appointmentDate</th>
			<th>ailmentType</th>
			<th>ailmentDetails</th>
			<th>diagnosisHistory</th>

		</tr>

		
			<tr>
				<td><c:out value="${patientBean.patientID}"/></td>
				<td><c:out value="${patientBean.userID}"/></td>
				<td><c:out value="${patientBean.appointmentDate}"/></td>
				<td><c:out value="${patientBean.ailmentType}"/></td>
				<td><c:out value="${patientBean.ailmentDetails}"/></td>
				<td><c:out value="${patientBean.diagnosisHistory}"/></td>
		
			</tr>
		
			</table> 
			</c:if>
		</form:form>

</body>
</html>

