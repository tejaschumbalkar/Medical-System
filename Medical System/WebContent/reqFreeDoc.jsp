<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi").datepicker({changeMonth: true,changeYear: true});
  });
  </script>
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" action="viewDoctors.html" commandName="reg">
		<table align="center">
		<tr>
		<br>
		<br>
		</tr>
			<tr>
			        <td><form:label path="leaveFrom">Enter Date:</form:label></td>
			        <td><form:input path="leaveFrom" value="${LeaveBean.leaveFrom}" id="doi"/></td>
			    </tr>
			    
			     <tr>
			      <td colspan="2"><input type="submit" value="View"/></td>
		      </tr>
			    
		</table>
	</form:form>
</body>
</html>