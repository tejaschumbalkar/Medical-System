<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">window.history.forward(1);</script>
<script type="text/javascript" src="js/TweenLite.min.js"></script>
<script type="text/javascript" src="js/TweenMax.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<title>OCS</title>
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
body{
	margin:0;
	background-color:#127453;
	overflow:auto;
	background-image: url('online-clinic.jpg');
	background-repeat: no-repeat;
	background-position: left center;
}

#btn1{
	background:#06F;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	left:900px;
	cursor:pointer;
	background:url('9.jpg');
	background-repeat:no-repeat;
    color:#000000;
	font-size:20px;
	
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:10px;
	text-align:left;
	
	
}
#btn2{
	background:#C30;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	left:900px;
	cursor:pointer;
	background:url('10.jpg') ;
	background-repeat:no-repeat;
	color:#000000;
	
	font-size:20px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:10px;
	text-align:left;
}

#btn3{
	background:#F60;
	border-color:#F60;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	left:900px;
	cursor:pointer;
	background:url('11.jpg');
	color:#000000;
	font-size:20px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:10px;
	text-align:left;
}

#btn4{
	background:#C3C;
	border-color:#F60;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	margin-top:30px;
	left:900px;
	cursor:pointer;
	background:url('12.jpg');
	color:#000000;
	font-size:20px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:10px;
	text-align:left;
	white-space: normal;
	
}
#btn5{
	background:#F36;
	border-color:#F60;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	margin-top:30px;
	left:900px;
	cursor:pointer;
	background:url('13.jpg');
	color:#000000;
	font-size:20px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:10px;
	text-align:left;
	white-space: normal;
	
}

#btn6{
	background:#6C0;
	height:200px;
	width:200px;
	position:relative;
	margin-left:10px;
	margin-top:30px;
	left:900px;
	cursor:pointer;
	background:url('14.png');
	color:#000000;
	font-size:20px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
	line-height:300px;
	padding-left:2px;
	text-align:left;
	white-space:nowrap;
	
}

#content{
	background:#45a56a;
	height:680px;
	width:850px;
	position:relative;
	top:500px;
	z-index:0;
}

#backbutton{
	position:relative;
	top:20px;
	left:760px;
	cursor:pointer;
}

#caption{
	position:relative;
	top:-60px;
	
	color:#FFF;
	font-size:25px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
}

#pagecaption{
	position:relative;
	top:-60px;
	
	color:#FFF;
	font-size:25px;
	font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif;
}
#foo1{
position:fixed;
top:0;
right:0; 



}
#foo2{
position:relative;
top:0;
right:-600px; 



}
#foo3{
position:relative;
bottom:55px;
left:30px;



}
#foo4{
position:relative;
bottom:90px;
right:-600px;




}
</style>
</head>

<body link="#FFFFFF">
<!--header-->
<div style="width:100%; height:80px; overflow:hidden; margin: 0 auto; background-color:#333">

  <div style="width:750px; height:80px; margin: 0 auto; overflow:hidden; position:relative">
		
        <div id="caption" style="height:44px; margin-top:20px;float:left; margin-left:12px; position:absolute">Online Clinic </div>
        
        <div id="backbutton" style="height:44px; width:44px; margin-top:15px; float:left; position:absolute"> <img src="123.png" width="44" height="44" /> </div>
      <form action="logout.html" method="get">
        <div id="foo1"><input type="submit" class="styled-button-9" value="Log Out" /> </div>
        </form>
         <form action="forgetpassword2.html" method="get">
         <div id="foo2"><input type="submit" class="styled-button-9" value="Change Password" /> </div>
         </form>
       <div id="pagecaption" style="height:44px; margin-top:20px;float:left; margin-left:12px; position:absolute"> Health is Wealth</div>
  </div>

</div>

<!--buttons-->
<div style="width:750px; height:450px; overflow:hidden; margin: 0 auto; position:relative; margin-top:35px;">

	<a href="addPatient.html" target="main"><div id="btn1" style="float:left"> <p> <b>Add Ailments Details</p> </div> </a>
    <a href="modifyPatient.html" target="main"><div id="btn2" style="float:left"> <p> <b> Modify Ailments Details</p> </div> </a>
    <a href="viewPatient.html" target="main"><div id="btn3" style="float:left"> <p> <b>View Ailments Details</p> </div> </a>
    <a href="list_of_doctorsMain.html" target="main"><div id="btn4" style="float:left"> <p> <b>List Of Doctors </p> </div> </a>
    <a href="requestappointment.html" target="main"><div id="btn5" style="float:left"> <p> <b>Appointment</p> </div> </a>
     <a href="viewP.html" target="main"><div id="btn6" style="float:left"><p> <b>Appointment Details</p> </div> </a>
    <div id="content" style="position:absolute"> <iframe name="main" frameborder=0 height=450 width=750></iframe>  </div>
    
</div>

<!--footer-->
<div style="width:100%; height:220px; overflow:hidden; margin: 0 auto; background-color:#333; margin-top:20px;">
    <div style="width:750px; height:80px; margin: 0 auto;">
    <p style="text-align:center; color:#FFF; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif; font-size:x-small">Group 11 RLL @2016 All rights reserved. </p>
    <p style="text-align:center; color:#CCC; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif; font-size:x-small"> Online Clinic System </p>
     <form action="contactus.html" method="get">
         <div id="foo3"><input type="submit" class="styled-button-9" value="Contact Us" /> </div>
         </form>
         <form action="ABOUT.html" method="get">
          <div id="foo4"><input type="submit" class="styled-button-9" value="About Us" /> </div>
        </form>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
  TweenLite.to($("#caption"),2,{css:{top:0},delay:1, ease:Power2.easeOut});
  TweenLite.to($("#btn1"),2,{css:{left:0},delay:2, ease:Power2.easeOut});
  TweenLite.to($("#btn2"),2,{css:{left:20},delay:2.5, ease:Power2.easeOut});
  TweenLite.to($("#btn3"),2,{css:{left:40},delay:3, ease:Power2.easeOut});
  TweenLite.to($("#btn4"),2,{css:{left:0},delay:3.5, ease:Power2.easeOut});
  TweenLite.to($("#btn5"),2,{css:{left:20},delay:4, ease:Power2.easeOut});
  TweenLite.to($("#btn6"),2,{css:{left:40},delay:4.5, ease:Power2.easeOut});
  
  });
  
  
  $("#btn1").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("Add Ailments");
	 
  });
  
  $("#btn2").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("Modify Ailments");
	 
  });
  
  $("#btn3").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("View Ailments");
	 
  });
  
  $("#btn4").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("List Of Doctors");
	 
  });
  
  $("#btn5").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("Request For Appointment");
	 
  });
  
   $("#btn6").click(function(){
	  TweenLite.to($("#content"),0.5,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#backbutton"),1,{css:{left:650, rotation:-180}, ease:Power2.easeOut});
	  TweenLite.to($("#pagecaption"),1,{css:{top:0}, ease:Power2.easeOut});
	  TweenLite.to($("#caption"),1,{css:{top:90}, ease:Power2.easeOut});
	  $("#pagecaption").text("Appointment Details");
	 
  });
  
  
   $("#backbutton").click(function(){
	    TweenLite.to($("#content"),1,{css:{top:500}, ease:Power2.easeIn});
		TweenLite.to($("#backbutton"),1,{css:{left:760, rotation:0}, ease:Power2.easeIn});
		TweenLite.to($("#pagecaption"),1,{css:{top:-60}, ease:Power2.easeOut});
		TweenLite.to($("#caption"),1,{css:{top:0}, ease:Power2.easeOut});
	});   
</script>	

</body>
</html>
