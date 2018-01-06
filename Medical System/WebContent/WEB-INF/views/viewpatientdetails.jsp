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
function printing(){
	window.print();
}

</script>
<form:form>
<%

List<String> list = new ArrayList<String>();

list =(List<String>) request.getAttribute("lis");

for(int i=0;i<list.size();i++){
	
	if(i!=0 && i%6==0){
		%>
		<br>
	<%}
	%>
	
	<%=list.get(i)%>
	<%
}

%>

<input type="submit" value="Print" onclick="printing()">
</form:form>
</body>
</html>