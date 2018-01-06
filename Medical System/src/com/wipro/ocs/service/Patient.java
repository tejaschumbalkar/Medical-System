package com.wipro.ocs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ProfileBean;

public interface Patient {
	 
	public String addAilmentDetails(PatientBean patientBean);
	public boolean modifyAilmentDetails(PatientBean patientBean);
	public PatientBean viewAilmentDetails(String patientID);
	public ArrayList<DoctorBean> viewListOfDoctors(String specialization, Date date);
	public ArrayList<DoctorBean> viewListOfDoctors2(String specialization);
	public String requestforAppointment(String doctorID, Date appointmentDate);
	public String saveappointment(AppointmentBean appointmentBean);
	public AppointmentBean viewAppointmentDetails(String patientID, Date date);
	public String addUserDetails(ProfileBean profileBean);
	public String checkpass(String uid2, String newpass, String confpass);
	public String checkuser(String uid, Date dob,String street);
    

}
