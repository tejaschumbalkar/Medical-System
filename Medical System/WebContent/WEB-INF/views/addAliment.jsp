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
		<h2>Add Employee Data</h2>
		<form:form method="POST" action="save.html" >
	   		<table>
	   		<tr>
			        <td><form:label path="userID">userID:</form:label></td>
			        <td><form:input path="userID" value="${patientBean.userID}" readonly="true"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="patientID">patient id:</form:label></td>
			        <td><form:input path="patientID" value="${patientBean.patientID}" readonly="true"/></td>
			    </tr>
	   		
			    <tr>
			        <td><form:label path="appointmentDate">appointmentDate:</form:label></td>
			        <td><form:input path="appointmentDate" value="${patientBean.appointmentDate}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="ailmentType">ailmentType:</form:label></td>
			        <td>
			        <ul>  
            <form:select path="ailmentType">  
                <form:option value="fever">FEVER</form:option>  
                <form:option value="cold">cold</form:option>  
                <form:option selected="Diabetes" value="Diabetes">Diabetes</form:option>  
                <form:option value="cough">cough</form:option>  
            </form:select>  
        </ul>  
    </td>  
			    </tr>
			 
			    <tr>
			        <td><form:label path="ailmentDetails">ailmentDetails:</form:label></td>
			        <td><form:input path="ailmentDetails" value="${patientBean.ailmentDetails}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="diagnosisHistory">diagnosisHistory:</form:label></td>
                    <td><form:input path="diagnosisHistory" value="${patientBean.diagnosisHistory}"/></td>
			    </tr>
			    
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>

	</body>
</html>