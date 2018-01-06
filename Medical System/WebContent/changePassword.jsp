<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCS</title>
<link rel="shortcut icon" href="online-clinic.jpg">

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
  <script>
  $(document).ready(function() {
    $("#doi").datepicker({changeMonth: true,  
        changeYear: true});
  });
  </script>
<title>Insert title here</title>
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
      body{
	margin:0;
	background-color:#fff;
	overflow:auto;
	background-image: url('987.jpg') ;
	background-size:cover;
	background-repeat: no-repeat;
	

	
}  
</style>

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>


	<form action="changePassword1.html"  method="GET">
		<table border="0" align="center"  width="75%">
		
		<tr>
		
			<td><h3>${store}</h3></td>
		</tr>
		
		<tr>
			
				<td><b>User ID:</td>
				<td><input type="text" name="userID" required="required" minlength="6" maxlength="6" placeholder="User-Id"/></td>
			</tr>
	
	<tr>
				<td><b>Street :</td>
				<td><input type="text" name="street" required="required" minlength="2" maxlength="15" placeholder="Enter Street" size="25"/></td>
			</tr>
			
	
			<tr>
				<td><b>Date of Birth :</td>
				<td><input type="text" name="dob" required="required" placeholder="DOB" size="25" id="doi"/></td>
			</tr>
			
			<tr>
				<td></td>

				<td><input type="submit" class="styled-button-9" value="submit" /></td>
			</tr>
			
			

		</table>
	</form>
	
	<form action="index123.jsp">
    <center><input type="submit" class="styled-button-9" value="Home"></center>
   </form>
</body>
</html>