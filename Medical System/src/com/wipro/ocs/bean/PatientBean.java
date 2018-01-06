package com.wipro.ocs.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
@Entity
@Table(name="OCS_TBL_PATIENT")
public class PatientBean {
	@Id
	@Pattern(regexp="[0-9]{4}",message="Enter valid ID")
	private String patientID;
	@Pattern(regexp="[A-Z]{2}[0-9]{4}",message="Enter valid ID")
	private String userID;
	@Column(name="APPOINTMENT_DATE")

	@Temporal(TemporalType.DATE)
	@Future
	private Date appointmentDate;
	@Column(name="AILMENT_TYPE")
	
	private String ailmentType;
	@Column(name="AILMENT_DETAILS")
	
	@Size(max= 60)
	@Pattern(regexp="^[\\p{L} .'-]+$",message="Enter in alphabets only")
	private String ailmentDetails;
	@Column(name="DIAGNOSIS_HISTORY")
	@Size(max= 60)
	@Pattern(regexp="^[\\p{L} .'-]+$",message="Enter in alphabets only")
	private String diagnosisHistory;
	
	
	public String getPatientID() {
		return patientID;
	}
	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getAilmentType() {
		return ailmentType;
	}
	public void setAilmentType(String ailmentType) {
		this.ailmentType = ailmentType;
	}
	public String getAilmentDetails() {
		return ailmentDetails;
	}
	public void setAilmentDetails(String ailmentDetails) {
		this.ailmentDetails = ailmentDetails;
	}
	public String getDiagnosisHistory() {
		return diagnosisHistory;
	}
	public void setDiagnosisHistory(String diagnosisHistory) {
		this.diagnosisHistory = diagnosisHistory;
	}
	
	

}
