<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function prints(){
	window.print();
}
</script>
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


<form:form action="viewP.html" method="get">
<table align="left" border="1">
		<tr>
			<th>Appointment ID</th>
			<th>Patient ID</th>
			<th>Appointment Date</th>
			<th>Appointment Time</th>
			<th>Ailment Type</th>
			<th>Alignment Details</th>

		</tr>
<tr>
<%

List<String> list = new ArrayList<String>();

list =(List<String>) request.getAttribute("lis");

for(int i=0;i<list.size();i++){
	
	if(i!=0 && i%6==0){
		%>
		<tr></tr>
	<%}
	%>
	
	<TD><%=list.get(i)%></TD>
	
	<%

}

%>

</tr>

<TR><td colspan="6"><center><input type="submit" NAME="print" value="Print" onclick="prints()"></center></td></TR>

</table>
</form:form>


</body>
</html>