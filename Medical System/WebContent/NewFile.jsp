
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register customer</title>
<link rel="stylesheet" href="css/reset1.css">
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="script" href="js/bootstrap.min.js">
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $("#dob").datepicker({  minDate: new Date(1934,5,4) , changeMonth: true,  
        changeYear: true, yearRange:"-100:+0"});
  });
</script>
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
</style>
</head>

<body>
<div align="left" style="float: right; margin-top: 0px; margin-right: 10px;">
			<button class="btn btn-warning"><a href="index1.jsp" style="color: white;text-decoration: none "float: right";">Click Here To Login</a></button>
</div>
<h1 class="login-heading2" align="center" style="margin-left: 110px;">Register New User</h1>	
<div align="center">
		<form:form method="POST" action="addUser.html">
	   		<table>
			    <tr class="input-txt">
			        <td><form:label path="firstName">Enter First Name:</form:label></td>
			        <td><form:input path="firstName" maxlength="20" minlength="2" size="30"/></td>
			        <td><form:errors path="firstName" cssClass="error"/></td>
			    </tr>
			    <tr class="input-txt">
			        <td><form:label path="lastName">Enter Last Name:</form:label></td>
			        <td><form:input path="lastName" maxlength="20" size="30" /></td>
			        <td><form:errors path="lastName" cssClass="error"/></td>
			    </tr>
			    <tr class="input-txt">
			        <td><form:label path="dateOfBirth">Enter Date Of Birth:</form:label></td>
			        <td><form:input path="dateOfBirth" id="dob" required="required" size="30"/></td>
			        <td><form:errors path="dateOfBirth" cssClass="error"/></td>
			    </tr>
			    
			    <tr class="input-txt"><td><form:label path="gender">Gender:</form:label>
	<td><form:select path="gender" class="form-control">
    <form:option value="Male">Male</form:option>
    <form:option value="Female">Female</form:option></td>
	</form:select>
	</td>
	</tr>
			    <tr class="input-txt">
			        <td><form:label path="street">Enter Street:</form:label></td>
			        <td><form:input path="street"  maxlength="30" size="30"/></td>
			        <td><form:errors path="street" cssClass="error"/></td>
			    </tr>
			    <tr class="input-txt">
			        <td><form:label path="location">Enter location:</form:label></td>
			        <td><form:input path="location"  maxlength="20" size="30"/></td>
			        <td><form:errors path="location" cssClass="error"/></td>
			    </tr>
			     <tr class="input-txt">
			        <td><form:label path="state">Enter State:</form:label></td>
			        <td><form:select path="state" class="states form-control" id="stateId">
			        <form:option value="NONE" label="Select Statw"/>
			  
			        </form:select></td>
			    </tr>
			    
			     <tr class="input-txt">
			    
		
			    
			        <td><form:label path="city">Enter City:</form:label></td>
			        <td><form:select path="city" class="cities form-control" id="cityId">
			      
			    
			      
					<form:option value="">Select city</form:option>
					
					
			        
			        </form:select>
			        </td>
			  
			    </tr> 
			    <tr class="input-txt">
			        <td><form:label path="pincode">Enter Pincode:</form:label></td>
			        <td><form:input path="pincode" maxlength="6" size="30"/></td>
			        <td><form:errors path="pincode" cssClass="error"/></td>
			    </tr>
			    
			    <tr class="input-txt">
			         <td><form:label path="mobileNo">Enter Mobile No:</form:label></td>
			        <td><form:input path="mobileNo" maxlength="10" size="30" /></td>
			        <td><form:errors path="mobileNo" cssClass="error"/></td>
			    </tr>
			    <tr class="input-txt">
			        <td><form:label path="emailID">Enter Email Id:</form:label></td>
			        <td><form:input path="emailID" maxlength="30" size="30" /></td>
			        <td><form:errors path="emailID" cssClass="error"/></td>
			    </tr>
			      <tr class="input-txt">
			        <td><form:label path="password">Enter password:</form:label></td>
			        <td><form:password path="password"  maxlength="20" size="30"/></td>
			        <td><form:errors path="password" cssClass="error"/></td>
			    </tr>
			    <tr>
					<td>
						<button type="submit" value="deleteShip"
							style="margin-left: 150px; margin-top: 10px; background-color: #0099cc; color: white">Register</button>
					</td>
				</tr>
			</table> 
		</form:form>
		</div>
</body>
</html>