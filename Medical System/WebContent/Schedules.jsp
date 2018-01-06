<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi1").datepicker({ maxDate: new Date(2020,12,31), minDate: new Date(1985, 12, 31) , changeMonth: true,  
        changeYear: true});
  });
  </script>
<title>Insert title here</title>
<style>
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
<br><br>

		<form:form method="POST" action="add2.html" commandName="add" name="hh">
	   		
			    
			   
			        <b>Available Days :</b><br>
			          <form:checkbox path="password" value="Monday" />Monday<br>
			     <form:checkbox path="password" value="Tuesday" />Tuesday<br>
			      <form:checkbox path="password" value="Wednesday" />Wednesday<br>
			       <form:checkbox path="password" value="Thursday" />Thursday<br>
			       <form:checkbox path="password" value="Friday" />Friday<br>
			       <form:checkbox path="password" value="Saturday" />Saturday<br>
	
		 	    
			
<b><font color="red">${sed}</font></b><br><br>
		
		 	   
			   <form:label path=""><b>Slots :</form:label><br>
				<form:input path="confirm" required="required" maxlength="2" value="${ProfileBean.confirm}" /><br>
				<font color="red"><form:errors path="confirm"/></font><br>
				<br><b><font color="red">${sed1}</font></b><br><br>
			    
			     <input type="submit" class="styled-button-9" value="Submit"/>
		      
		</form:form>



</body>
</html>