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

<h2>Add Doctor Data</h2>
		<form:form method="POST" action="add1.html" commandName="add">
	   		<table>
			    <tr>
			        <td><form:label path="doctorID">Doctor ID:</form:label></td>
			        <td><form:input path="doctorID" value="${DoctorBean.doctorID}" readonly="true"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="doctorName">doctorName:</form:label></td>
			        <td><form:input path="doctorName" value="${DoctorBean.doctorName}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="dateOfBirth">dateOfBirth:</form:label></td>
			        <td><form:input path="dateOfBirth" value="${DoctorBean.dateOfBirth}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="dateOfJoining">dateOfJoining:</form:label></td>
			        <td><form:input path="dateOfJoining" value="${DoctorBean.dateOfJoining}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="gender">gender:</form:label></td>
                    <td><form:input path="gender" value="${DoctorBean.gender}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="qualification">qualification:</form:label></td>
                    <td><form:input path="qualification" value="${DoctorBean.qualification}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="specialization">specialization:</form:label></td>
			        <td><form:input path="specialization" value="${DoctorBean.specialization}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="yearsOfExperience">yearsOfExperience:</form:label></td>
                    <td><form:input path="yearsOfExperience" value="${DoctorBean.yearsOfExperience}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="street">street:</form:label></td>
                    <td><form:input path="street" value="${DoctorBean.street}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="location">location:</form:label></td>
			        <td><form:input path="location" value="${DoctorBean.location}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="city">City:</form:label></td>
                    <td><form:input path="city" value="${DoctorBean.city}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="state">State:</form:label></td>
                    <td><form:input path="state" value="${DoctorBean.state}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="pincode">pincode:</form:label></td>
			        <td><form:input path="pincode" value="${DoctorBean.pincode}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="contactNumber">contactNumber:</form:label></td>
                    <td><form:input path="contactNumber" value="${DoctorBean.contactNumber}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="emailID">emailID:</form:label></td>
                    <td><form:input path="emailID" value="${DoctorBean.emailID}"/></td>
			    </tr>
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>




</body>
</html>