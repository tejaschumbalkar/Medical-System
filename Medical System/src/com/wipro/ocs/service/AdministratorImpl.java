package com.wipro.ocs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ScheduleBean;
import com.wipro.ocs.dao.AdministratorDAO;
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AdministratorImpl implements Administrator{
@Autowired
AdministratorDAO administratorDAO;
String result1="";
@Override
@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String addDoctor(DoctorBean doctorBean) {
		result1=administratorDAO.addDoctor(doctorBean);
		
		return result1;
	}

	@Override
	public DoctorBean modifyDoctor(DoctorBean doctorBean) {
		
		DoctorBean doc=administratorDAO.modifyDoctor(doctorBean);
		
		return doc;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public ArrayList<DoctorBean> viewAllDoctors() {
		
		return administratorDAO.viewAllDoctors();
	}

	@Override
	public int removeDoctor(String doctorID) {
	
		int i=administratorDAO.removeDoctor(doctorID);
		return i;
	}

	@Override
	public ArrayList<DoctorBean> suggestDoctors(String patientId, Date date) {
	
		ArrayList<DoctorBean> list = new ArrayList<DoctorBean>();
		list = administratorDAO.suggestDoctors(patientId, date);
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<String> viewPatientsByDate(
			Date appointmentDate) {
	
		return administratorDAO.viewPatientsByDate(appointmentDate);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String setSchedule(ScheduleBean sc) {
		String s1=administratorDAO.setSchedule(sc);
		return s1;
	}

	

	

}
