<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>

<head>
<title>OCS</title>
<link rel="shortcut icon" href="online-clinic.jpg">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="script" href="js/bootstrap.min.js">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
var $jq = jQuery.noConflict();
$jq(function() {
	  var loc = new locationInfo();
	      loc.getStates(101);
	      $jq(".states").on("change", function(ev) {
	          var stateId = $jq("option:selected", this).attr('stateid');
	          if(stateId != ''){
	          loc.getCities(stateId);
	          }
	          else{
	              $jq(".cities option:gt(0)").remove();
	          }
	      });
	});
	
function ajaxCall() {
    this.send = function(data, url, method, success, type) {
      type = type||'json';
      var successRes = function(data) {
          success(data);
      }

      var errorRes = function(e) {
          console.log(e);
          alert("Error found \nError Code: "+e.status+" \nError Message: "+e.statusText);
          $jq('#loader').modal('hide');
      }
        $.ajax({
            url: url,
            type: method,
            data: data,
            success: successRes,
            error: errorRes,
            dataType: type,
            timeout: 60000
        });

      }

    }

function locationInfo() {
var rootUrl = "http://lab.iamrohit.in/php_ajax_country_state_city_dropdown/api.php";
var call = new ajaxCall();
this.getCities = function(id) {
    $jq(".cities option:gt(0)").remove();
    var url = rootUrl+'?type=getCities&stateId=' + id;
    var method = "post";
    var data = {};
    $jq('.cities').find("option:eq(0)").html("Please wait..");
    call.send(data, url, method, function(data) {
        $jq('.cities').find("option:eq(0)").html("Select City");
        if(data.tp == 1){
            $jq.each(data['result'], function(key, val) {
                var option = $jq('<option />');
                option.attr('value', val).text(val);
                 option.attr('cityid', key);
                $jq('.cities').append(option);
            });
            $jq(".cities").prop("disabled",false);
        }
        else{
             alert(data.msg);
        }
    });
};

this.getStates = function(id) {
    $jq(".states option:gt(0)").remove(); 
    $jq(".cities option:gt(0)").remove(); 
    var url = rootUrl+'?type=getStates&countryId=' + id;
    var method = "post";
    var data = {};
    $jq('.states').find("option:eq(0)").html("Please wait..");
    call.send(data, url, method, function(data) {
        $jq('.states').find("option:eq(0)").html("Select State");
        if(data.tp == 1){
            $jq.each(data['result'], function(key, val) {
                var option = $jq('<option />');
                    option.attr('value', val).text(val);
                    option.attr('stateid', key);
                $jq('.states').append(option);
            });
            $jq(".states").prop("disabled",false);
        }
        else{
            alert(data.msg);
        }
    }); 
};
}

</script>

<style>
    .error {
        color: red; font-weight: bold;
    }
    
    body{
	
	background-color:#add8e6;

	
}
    
</style>
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
body{
	margin:0;
	background-color:#fff;
	overflow:auto;
	background-image: url('1234.jpg');
	
	background-repeat: no-repeat;
	background-position: left center;

	
}
</style>
</head>
<body>
<H1 align="center"><b> NEW USER REGISTRATION</b></H1>

<form:form method="GET" action="registeruser.html" commandName="regiss">
	   		<table align="center">
	   		
	   		  <tr>
			        <td><b><form:label path="firstName">First Name :</form:label></td>
			        <td><form:input path="firstName" required="required" minlength="2" maxlength="15" value="${ProfileBean.firstName}"/></td>
			          <td><font color="red"><form:errors path="firstName"/></font></td>
			    </tr>
	   		
			    <tr>
			        <td><b><form:label path="lastName">Last Name :</form:label></td>
			        <td><form:input path="lastName" required="required" maxlength="15" value="${ProfileBean.lastName}"/></td>
			           <td><font color="red"><form:errors path="lastName"/></font></td>
			    </tr>
	   		
			    <tr>
			        <td><b><form:label path="dateOfBirth">Date Of Birth :</form:label></td>
			        <td><form:input path="dateOfBirth" required="required" id="doi" readonly="true" /></td>
			           <td><font color="red"><form:errors path="dateOfBirth"/></font></td>
			    </tr>
			    
			    <tr>
			        <td><b><form:label path="gender" required="required">Gender :</form:label></td>
                    <td><b><form:radiobutton path="gender" value="Male"/>MALE</td>
                    <td><b><form:radiobutton path="gender" value="Female"/>FEMALE</td>
                    <td><font color="red"><form:errors path="gender"/></font></td>
			    </tr>
			    
			     <tr>
			        <td><b><form:label path="street">Street :</form:label></td>
                    <td><form:input path="street" required="required" minlength="2" maxlength="15"  value="${ProfileBean.street}"/></td>
                       <td><font color="red"><form:errors path="street"/></font></td>
			    </tr>
			     <tr>
			        <td><b><form:label path="location">Location :</form:label></td>
                    <td><form:input path="location" required="required" minlength="3" maxlength="15"  value="${ProfileBean.location}"/></td>
                      <td><font color="red"><form:errors path="location"/></font></td>
			    </tr>
			     <tr class="input-txt">
			        <td><form:label path="state">Enter State:</form:label></td>
			        <td><form:select path="state" required="required" class="states form-control" id="stateId">
			        <form:option value="NONE" label="Select State"/>
			  
			        </form:select></td>
			    </tr>
			    
			     <tr class="input-txt">
			    
		
			    
			        <td><form:label path="city">Enter City:</form:label></td>
			        <td><form:select path="city" required="required" class="cities form-control" id="cityId">
			      
			    
			      
					<form:option value="">Select city</form:option>
					
					
			        
			        </form:select>
			        </td>
			  
			    </tr> 
			    <tr>
			 
			    
			     <tr>
			        <td><b><form:label path="pincode">Pin-code :</form:label></td>
                    <td><form:input path="pincode" required="required" minlength="6" maxlength="6"  value="${ProfileBean.pincode}"/></td>
                    <td><font color="red"><form:errors path="pincode"/></font></td>
			    </tr>
			    
			     <tr>
			        <td><b><form:label path="mobileNo">Mobile No :</form:label></td>
                    <td><form:input path="mobileNo" required="required" minlength="10" maxlength="10"  value="${ProfileBean.mobileNo}"/></td>
                    <td><font color="red"><form:errors path="mobileNo"/></font></td>
			    </tr>
			    
			       <tr>
			        <td><b><form:label path="emailID">Email ID :</form:label></td>
                    <td><form:input path="emailID" required="required" minlength="5" maxlength="30"  value="${ProfileBean.emailID}"/></td>
                       <td><font color="red"><form:errors path="emailID"/></font></td>
			    </tr>
			    
		      <tr>
			        <td><b><form:label path="password">Password :</form:label></td>
			        <td><form:input path="password" required="required" maxlength="8" type="password" value="${ProfileBean.password}"/></td>
			     <td><font color="red"><form:errors path="password"/></font></td>
			    </tr>
		      
		      
		       <tr>
			        <td><b><form:label path="confirm">Confirm Password :</form:label></td>
			        <td><form:input path="confirm" required="required" maxlength="8" type="password" value="${ProfileBean.confirm}"/></td>
			     <td><font color="red"><form:errors path="confirm"/></font></td>
			      <td><h4> ${store}</h4></td> 
			    </tr>
			    
			    <tr>
			    
			      <td><br></td>
			         <td><br></td>
			      </tr>
			      <tr>
			    
			     <td colspan="3"><center><input type="submit" class="styled-button-9" value="Submit"/></center></td>
			    
		      </tr>
		      <br>
			     <br>
		     
			</table> 
			 
		</form:form>
<form action="index123.jsp">
<center><input type="submit" class="styled-button-9" value="Cancel"></center>
</form>

</body>
</html>