package com.wipro.ocs.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ScheduleBean;

public interface AdministratorDAO {
	
	public String addDoctor(DoctorBean doctoerBean);	
	public DoctorBean modifyDoctor(DoctorBean doctorBean);
	public ArrayList<DoctorBean> viewAllDoctors();
	public int removeDoctor(String doctorID);
	public ArrayList<DoctorBean> suggestDoctors(String patientId, Date date);
	public ArrayList<String> viewPatientsByDate(Date appointmentDate);
	public String setSchedule(ScheduleBean sc);


}
