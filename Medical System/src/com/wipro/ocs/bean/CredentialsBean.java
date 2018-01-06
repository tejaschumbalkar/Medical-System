package com.wipro.ocs.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="OCS_TBL_USER_CREDENTIALS")
public class CredentialsBean {
	@Id
	@NotEmpty(message="User ID cannot be blank")
	@Pattern(regexp=".*[A-z]{2}[0-9]{4}",message="Enter valid values only")
	private String userID;
	@NotEmpty(message="Password cannot be blank")
	
	@Pattern(regexp="^[a-z|A-Z|]+[a-z|A-Z|0-9]*" , message ="Pwd erong format") 
	private String password;
	private String userType;
	private int loginStatus;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getLoginStatus() {
		return loginStatus;
	}
	public void setLoginStatus(int loginStatus) {
		this.loginStatus = loginStatus;
	}
	
	
	

}
