<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<form action="changePass1.html"  method="GET">
		<table border="0" align="center" >
		
		<tr>
		
		<td><h3>${sss}</h3></td>
		
		</tr>
		
		<tr>
				<td><b>Old Password :</b></td>
				<td><input type="password" required="required" maxlength="8" name="oldPassword" /></td>
			</tr>
	
			<tr>
				<td><b>New Password :</b></td>
				<td><input type="password" required="required" maxlength="8" name="newPassword" /></td>
			</tr>
			<tr>
				<td><b>Confirm new Password :</b></td>
				<td><input type="password" required="required" maxlength="8" name="confirmPassword" /></td>
			</tr>
			
			<tr>
				<td></td>

				<td><input type="submit" class="styled-button-9" value="update" /></td>
			
			</tr>
		</table>
		
		<br><br>

	</form>
	
	<form action="reporter.jsp">
<center><input type="submit" class="styled-button-9" value="Home"></center>
</form>
<br><br>
</body>
</html>