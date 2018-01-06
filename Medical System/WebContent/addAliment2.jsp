<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	<style type="text/css"> 
.styled-button-9 {
	background: #00A0D1;
	background: -moz-linear-gradient(top,#00A0D1 0%,#008DB8 100%);
	background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,#00A0D1),color-stop(100%,#008DB8));
	background: -webkit-linear-gradient(top,#00A0D1 0%,#008DB8 100%);
	background: -o-linear-gradient(top,#00A0D1 0%,#008DB8 100%);
	background: -ms-linear-gradient(top,#00A0D1 0%,#008DB8 100%);
	background: linear-gradient(top,#00A0D1 0%,#008DB8 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00A0D1',endColorstr='#008DB8',GradientType=0);
	padding:8px 20px;
	color:#cfebf3;
	font-family:'Helvetica Neue',sans-serif;
	font-size:13px;
	border-radius:40px;
	-moz-border-radius:40px;
	-webkit-border-radius:40px;
	border:1px solid #095B7E
}
.styled-button-9:hover, 
.styled-button-9:focus {
    text-decoration: none;
    color: #fff;
}

.styled-button-9:active {
    transform: translate(0px,5px);
    -webkit-transform: translate(0px,5px);
    border-bottom: 1px solid;
}
       
</style>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi").datepicker({ maxDate: new Date(1985,12,31), minDate: new Date(1955,12,31) , changeMonth: true,  
        changeYear: true});
  });
  </script>
		<title>Spring MVC Form Handling</title>
	</head>
	<body>

		<form:form method="POST" action="ret2.html">
	   		<table>
	   		
	   		<tr>
			        <td><form:label path="userID">User ID:</form:label></td>
			        <td><form:input path="userID" required="required" value="${patientBean.userID}" readonly="true"/></td>
			    </tr>
		
			     <tr>
			        <td><form:label path="ailmentType" >Ailment Type :</form:label></td>
			        <td><form:select path="ailmentType" selected="selected">
			        <form:option value="${patientBean.ailmentType}" label="${patientBean.ailmentType}"/>
			       	 <form:option value="General Physician" label="General Physician" />
			       	 <form:option value="Cardiology" label="Cardiology" />
			       	  <form:option value="Dental" label="Dental" />
			       	  <form:option value="Gynecology " label="Gynecology " />
			          	<form:option value="Neurology " label="Neurology " />
			      		<form:option value="Orthopedic" label="Orthopedic" />
			            <form:option value="Oncology " label="Oncology " />
			              <form:option value="Psychology" label="Psychology" />
			               <form:option value="Radiology" label="Radiology" />
			             	<form:option value="Urology" label="Urology" />
			            
				       </form:select>
				       		
				       
                       </td>
			    <tr>
			        <td><form:label path="ailmentDetails">Ailment Details:</form:label></td>
			        <td><form:input path="ailmentDetails" size="35" maxlength="60" required="required"  value="${patientBean.ailmentDetails}"/></td>
			      <td><font color="red"><form:errors path="ailmentDetails"/></font></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="diagnosisHistory">Diagnosis History:</form:label></td>
                    <td><form:input  path="diagnosisHistory" size="35" maxlength="60" required="required" value="${patientBean.diagnosisHistory}"/></td>
			      <td><font color="red"><form:errors path="diagnosisHistory"/></font></td>
			    </tr>
			     																				
			    <tr>
			   <td>
			    </td>
			      <td ><input type="submit" class="styled-button-9" value="Submit"/></td>
			  <!--     <td ><input type="reset" class="styled-button-9" value="Reset"/></td> -->
			</table> 
		</form:form>

	</body>
</html>