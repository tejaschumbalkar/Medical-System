<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="js/TweenLite.min.js"></script>
<script type="text/javascript" src="js/TweenMax.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi").datepicker({minDate:0,changeMonth: true,changeYear: true});
  });
  </script>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi1").datepicker({ minDate:0,changeMonth: true,changeYear: true});
  });
  </script>
  

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
</head>

<body>
	
		<form:form method="POST" action="applyLeave.html" commandName="reg"  >
	   		<table align="center"> 
			    
			    <tr>
			    <br>
			     <br>
			      <br>
			    </tr>
			    
			    <tr>
			        <td><form:label path="doctorID" >Doctor ID:</form:label></td>
			        <td><form:input path="doctorID" required="required" minlength="4" maxlength="4" value="${LeaveBean.doctorID}" /></td>
			        <td><font color="red"><form:errors path="doctorID"/></font></td>
			        
			    </tr>
			    <tr>
		        <td><form:label path="leaveFrom">Leave From:</form:label></td>
			        <td><form:input path="leaveFrom" required="required" value="${LeaveBean.leaveFrom}" id="doi"/></td>
			   <td><font color="red"><form:errors path="leaveFrom"/></font></td>
			    </tr>
			    <tr>
			        <td><form:label path="leaveTo">Leave To:</form:label></td>
			        <td><form:input path="leaveTo" required="required" value="${LeaveBean.leaveTo}" id="doi1"/></td>
			         <td><font color="red"><form:errors path="leaveTo"/></font></td>
			        <td><h3>${store}</h3></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="reason">Reason:</form:label></td>
                    <td><form:textarea  path="reason"  rows="5" cols="30" minlength="5" maxlength="60" required="required" value="${LeaveBean.reason}"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="status">Status:</form:label></td>
                    <td><form:radiobutton path="status" value="0"/>Has No Appointments</td>
                    <td><form:radiobutton path="status" value="1"/>Has Appointments</td>
               
                    
			    </tr>
			    
			    <tr>
			      <td colspan="2"><input type="submit" class="styled-button-9" value="Apply Leave"/></td>
		      </tr>
			</table> 
		</form:form>
</body>

</html>