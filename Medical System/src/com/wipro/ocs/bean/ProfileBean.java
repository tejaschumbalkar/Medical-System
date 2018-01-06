package com.wipro.ocs.bean;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
@Entity
@Table(name="OCS_TBL_User_Profile")
public class ProfileBean {
	
	@Id
		private String userID;

	@Pattern(regexp=".*[A-z]",message="Enter name in alphabets only")
    @Size(min= 3,max= 15)
	private String firstName;
	
	@Pattern(regexp=".*[A-z]",message="Enter name in alphabets only")
	 @Size(min= 3,max= 15)
	private String lastName;
	
	@Temporal(TemporalType.DATE)
	@Past(message="Please Enter Valid Date")
	private Date dateOfBirth;
	
    @NotEmpty(message="Select a Gender")
	private String gender;
	
    @Size(max= 30)
	@Pattern(regexp=".*[A-z]",message="Enter in alphabets only")
	private String street;
    @Size(max= 30)
	@Pattern(regexp=".*[A-z]",message="Enter in alphabets only")
	private String location;
	
    @Size(max= 15)
	@Pattern(regexp=".*[A-z]",message="Enter in alphabets only")
	private String city;
	
    @Size(max= 15)
	@Pattern(regexp=".*[A-z]",message="Enter in alphabets only")
	private String state;
	
	@Pattern(regexp="[0-9]{6}",message="Enter 6 digit pin code")
	private String pincode;
	
	@Pattern(regexp="[0-9]{10}",message="Enter 10 digit mobile number")
	private String mobileNo;
	@Email
	private String emailID;
	@Transient
	private String password;
	@Transient
	
	private String confirm;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	


}
