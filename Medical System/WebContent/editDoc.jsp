<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel = "stylesheet" type = "text/css" href= "tcal.css"/>
	<script type = "text/javascript" src="tcal.js"></script> 
<head>
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

<title>Insert title here</title>
</head>
<body>

<h2 align="center">Modify Doctor Data</h2>
		<form:form method="POST" action="addd.html" commandName="add" name="hh">
	   		<table>
			     <tr>
			        <td><form:label path="doctorID">Doctor ID :</form:label></td>
			        <td><form:input path="doctorID" required="required"  value="${DoctorBean.doctorID}" readonly="true"/></td>
			        
			    </tr>
			    <tr>
			        <td><form:label path="doctorName">Doctor Name :</form:label></td>
			        <td><form:input path="doctorName" required="required" minlength="3" maxlength="15" value="${DoctorBean.doctorName}"/></td>
			        			        <td><font color="red"><form:errors path="doctorName"/></font></td>
			        
			    </tr>
		
			     <tr>
			        <td><form:label path="qualification">Qualification :</form:label></td>
			        <td><form:select path="qualification">
			        <form:option value="MBBS" label="MBBS" />
			          <form:option value="MD" label="MD" />
			            <form:option value="PHD" label="PHD" />
			             <form:option value="BMed" label="BMed" />
			               <form:option value="Medicinal Doctor" label="Medicinal Doctor" />
				       </form:select>
				                           <td><font color="red"><form:errors path="qualification"/></font></td>
				       
                       </td>
       
			    </tr>
			    <tr>
			        <td><form:label path="specialization">Specialization :</form:label></td>
			        <td><form:select path="specialization">
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
				       			        <td><font color="red"><form:errors path="specialization"/></font></td>
				       
                       </td>
			    </tr>
			    
			    <tr>
			    <td><form:label path="yearsOfExperience">Years Of Experience :</form:label></td>
				<td><form:input path="yearsOfExperience" required="required" maxlength="2"  value="${DoctorBean.yearsOfExperience}"/></td>
				                    <td><font color="red"><form:errors path="yearsOfExperience"/></font></td>
				
					  
			    </tr>
			    
			     <tr>
			        <td><form:label path="street">Street :</form:label></td>
                    <td><form:input path="street" required="required" minlength="2" maxlength="15"  value="${DoctorBean.street}"/></td>
                                        <td><font color="red"><form:errors path="street"/></font></td>
                    
			    </tr>
			    <tr>
			        <td><form:label path="location">Location :</form:label></td>
			        <td><form:input path="location" required="required" minlength="3" maxlength="15"  value="${DoctorBean.location}"/></td>
			        			        <td><font color="red"><form:errors path="location"/></font></td>
			        
			    </tr>
			    
			    <tr class="input-txt">
			        <td><form:label path="state">Enter State:</form:label></td>
			        <td><form:select path="state" class="states form-control" id="stateId">
			        <form:option value="${DoctorBean.state}" label="${DoctorBean.state}"></form:option> 
			  			    
			  
			        </form:select></td>
			    </tr>
			    
			     <tr class="input-txt">
			    
		
			    
			        <td><form:label path="city">Enter City:</form:label></td>
			        <td><form:select path="city" class="cities form-control" id="cityId">
			      
			    
			      <form:option value="${DoctorBean.city}">${DoctorBean.city}</form:option>
					<%--  <form:option value="${DoctorBean.city}" label="${DoctorBean.city}"></form:option>
					--%>
					
			        
			        </form:select>
			        </td>
			  
			    </tr> 
			    
			   <%--  <tr>
			        <td><form:label path="city">City :</form:label></td>
                    <td><form:input path="city" required="required" minlength="3" maxlength="15"  value="${DoctorBean.city}"/></td>
                                        <td><font color="red"><form:errors path="city"/></font></td>
                    
			    </tr>
			    
			      <tr>
			        <td><form:label path="state">State :</form:label></td>
					<td><form:select path="state">
			       	 <form:option value="Andhra Pradesh" label="Andhra Pradesh" />
			       	 <form:option value="Arunachal Pradesh" label="Arunachal Pradesh" />
			       	  <form:option value="Assam" label="Assam" />
			       	  <form:option value="Bihar" label="Bihar" />
			          	<form:option value="Chhattisgarh " label="Chhattisgarh" />
			      		<form:option value="Goa" label="Goa" />
			            <form:option value="Gujarat" label="Gujarat" />
			              <form:option value="Jharkhand" label="Jharkhand" />
			               <form:option value="Karnataka" label="Karnataka" />
			             	<form:option value="Tamil Nadu" label="Tamil Nadu" />
			             <form:option value="West Bengal" label="West Bengal" />
			             	
			            
				       </form:select>	
				       <td><font color="red"><form:errors path="state"/></font></td>		
				           </tr> --%>
			    <tr>
			        <td><form:label path="pincode">Pincode :</form:label></td>
			        <td><form:input path="pincode" required="required" minlength="6" maxlength="6" value="${DoctorBean.pincode}"/></td>
			        			        <td><font color="red"><form:errors path="pincode"/></font></td>
			        
			    </tr>
			    
			    <tr>
			        <td><form:label path="contactNumber">Contact Number :</form:label></td>
                    <td><form:input path="contactNumber" required="required" minlength="10" maxlength="10" value="${DoctorBean.contactNumber}"/></td>
                                        <td><font color="red"><form:errors path="contactNumber"/></font></td>
                    
			    </tr>
			    
			     <tr>
			        <td><form:label path="emailID">email ID :</form:label></td>
                    <td><form:input path="emailID" required="required" minlength="5" maxlength="30" value="${DoctorBean.emailID}"/></td>
                                        <td><font color="red"><form:errors path="emailID"/></font></td>
                    
			    </tr>
			 
			
			    <tr>
			      <td colspan="2"><input type="submit" class="styled-button-9" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>



</body>
</html>