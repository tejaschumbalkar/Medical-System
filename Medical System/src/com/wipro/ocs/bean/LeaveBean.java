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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="OCS_TBL_Leave")
public class LeaveBean {
	@Id
	@Column(name="LEAVEID")
	private String leaveID;
	
	@Column(name="DOCTORID")
	@Pattern(regexp="[0-9]{4}",message="Enter valid ID")
	private String doctorID;
	@Column(name="LEAVE_FROM")
	@Future
	@Temporal(TemporalType.DATE)
	@NotNull(message="Enter date")
	private Date leaveFrom;
	
	@Temporal(TemporalType.DATE)
	@Column(name="LEAVE_TO")
	@NotNull(message="Enter date")
	@Future
	private Date leaveTo;
	
	@Column(name="REASON")
	private String reason;
	@NotNull(message="Select Status")
	@Column(name="STATUS")
	private int status;
	
	public String getLeaveID() {
		return leaveID;
	}
	public void setLeaveID(String leaveID) {
		this.leaveID = leaveID;
	}
	public String getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}
	public Date getLeaveFrom() {
		return leaveFrom;
	}
	public void setLeaveFrom(Date leaveFrom) {
		this.leaveFrom = leaveFrom;
	}
	public Date getLeaveTo() {
		return leaveTo;
	}
	public void setLeaveTo(Date leaveTo) {
		this.leaveTo = leaveTo;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	

}
