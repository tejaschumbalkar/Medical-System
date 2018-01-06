package com.wipro.ocs.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="OCS_TBL_Doctor")
public class DoctorBean {
	@Id
	private String doctorID;
	
	@Pattern(regexp=".*[A-z]",message="Enter name in alphabets only")
	@Size(min= 3,max= 15)
	private String doctorName;

	@Temporal(TemporalType.DATE)
	@Past
	private Date dateOfBirth;

	@Temporal(TemporalType.DATE)
	private Date dateOfJoining;
	
	private String gender;

	private String qualification;
	
	private String specialization;

	@NotNull(message="Experience Cant Be Zero")
    @Min(1)
	@Max(40)
	private int yearsOfExperience;
	@Size(max= 30)
	@Pattern(regexp="^[\\p{L} .'#-]+$",message="Enter in alphabets only")
	private String street;
	@Size(max= 15)
	@Pattern(regexp="^[\\p{L} .'-]+$",message="Enter in alphabets only")
	private String location;
	@Size(max= 40)

	private String city;
	@Size(max= 40)
	private String state;
	
	@Pattern(regexp=".*[0-9]",message="Enter in numbers only")
	private String pincode;
	
	@Pattern(regexp="[0-9]{10}",message="Enter 10 digit mobile number")
	private String contactNumber;
	
	@Email
	private String emailID;
	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public Date getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public int getYearsOfExperience() {
		return yearsOfExperience;
	}
	public void setYearsOfExperience(int yearsOfExperience) {
		this.yearsOfExperience = yearsOfExperience;
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
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	
	
	
	

	

}
