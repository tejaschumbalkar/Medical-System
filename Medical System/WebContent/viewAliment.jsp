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

<form:form method="POST" action="/aviDelete.html">

<c:if test="${!empty patientBean}">
	<table align="left" border="1">
		<tr>
			<th>Patient ID</th>
			<th>User-ID</th>
			<th>Ailment Type</th>
			<th>Ailment Details</th>
			<th>Diagnosis History</th>

		</tr>

		
			<tr>
				<td><c:out value="${patientBean.patientID}"/></td>
				<td><c:out value="${patientBean.userID}"/></td>
				<td><c:out value="${patientBean.ailmentType}"/></td>
				<td><c:out value="${patientBean.ailmentDetails}"/></td>
				<td><c:out value="${patientBean.diagnosisHistory}"/></td>
		
			</tr>
		
			</table> 
			</c:if>
		</form:form>

</body>
</html>

