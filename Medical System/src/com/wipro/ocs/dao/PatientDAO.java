package com.wipro.ocs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ProfileBean;

public interface PatientDAO {
	
	public String addAilmentDetails(PatientBean patientBean);
	public boolean modifyAilmentDetails(PatientBean patientBean);
	public PatientBean viewAilmentDetails(String patientID);
	public ArrayList<DoctorBean> viewListOfDoctors(String specialization, Date date);
	public ArrayList<DoctorBean> viewListOfDoctors2(String specialization);
	public String requestforAppointment(String doctorID, Date appointmentDate);
	public AppointmentBean viewAppointmentDetails(String patientID, Date date);
	public String saveappointment(AppointmentBean appointmentBean);
	public String addUserDetails(ProfileBean profileBean);
	public String checkuser(String uid, Date dob,String street);
	public String checkpass(String uid2, String newpass, String confpass);

}
