<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Apply for Leave</h2>
		<form:form method="POST" action="applyLeave.html" commandName="reg">
	   		<table>
			    <tr>
			        <td><form:label path="leaveID">Leave ID:</form:label></td>
			        <td><form:input path="leaveID" value="${LeaveBean.leaveID}" readonly="true"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="doctorID">Doctor ID:</form:label></td>
			        <td><form:input path="doctorID" value="${LeaveBean.doctorID}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="leaveFrom">Leave From:</form:label></td>
			        <td><form:input path="leaveFrom" value="${LeaveBean.leaveFrom}"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="leaveTo">Leave To:</form:label></td>
			        <td><form:input path="leaveTo" value="${LeaveBean.leaveTo}"/></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="reason">Reason:</form:label></td>
                    <td><form:input path="reason" value="${LeaveBean.reason}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="status">Status:</form:label></td>
                    <td><form:input path="status" value="${LeaveBean.status}"/></td>
			    </tr>
			    
			    <tr>
			      <td colspan="2"><input type="submit" value="Apply Leave"/></td>
		      </tr>
			</table> 
		</form:form>
</body>
</html>