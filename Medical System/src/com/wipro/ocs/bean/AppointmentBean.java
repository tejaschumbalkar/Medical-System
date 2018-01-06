package com.wipro.ocs.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
@Entity
@Table(name="OCS_TBL_APPOINTMENTS")
public class AppointmentBean {
	@Id
	private String appointmentID;
	@Pattern(regexp="[0-9]{4}",message="Enter valid Doctor ID")
	private String doctorID;
	@Pattern(regexp="[0-9]{4}",message="Enter valid Patient ID")
	private String patientID;

	@Column(name="APPOINTMENT_DATE")
	
	@Temporal(TemporalType.DATE)
	private Date appointmentDate;
	
	@Column(name="APPOINTMENT_TIME")

	private String appointmentTime;
	
	public String getAppointmentID() {
		return appointmentID;
	}
	public void setAppointmentID(String appointmentID) {
		this.appointmentID = appointmentID;
	}
	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public String getPatientID() {
		return patientID;
	}
	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getAppointmentTime() {
		return appointmentTime;
	}
	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}
	
	

}
