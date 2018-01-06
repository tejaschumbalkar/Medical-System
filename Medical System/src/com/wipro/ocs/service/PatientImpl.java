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
import com.wipro.ocs.bean.ProfileBean;
import com.wipro.ocs.dao.PatientDAO;
@Service
public class PatientImpl implements Patient{
	@Autowired
	PatientDAO patientDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String addAilmentDetails(PatientBean patientBean) {
		
		
		
		return patientDao.addAilmentDetails(patientBean);
	}


	@Override
	public boolean modifyAilmentDetails(PatientBean patientBean) {
		
		return false;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public PatientBean viewAilmentDetails(String patientID) {
		
		return (PatientBean)patientDao.viewAilmentDetails(patientID);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewListOfDoctors(String specialization,
			Date date) {
		ArrayList<DoctorBean> l=new ArrayList<DoctorBean>();
		l=patientDao.viewListOfDoctors(specialization, date);
		return l;
	}

	@Override
	public String requestforAppointment(String doctorID, Date appointmentDate) {
		
		return null;
	}

	@Override
	public AppointmentBean viewAppointmentDetails(
			String patientID, Date date) {
	AppointmentBean b = new AppointmentBean();
		b = patientDao.viewAppointmentDetails(patientID,date);
		return b;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String saveappointment(AppointmentBean appointmentBean) {
		return patientDao.saveappointment(appointmentBean);
	}


	@Override
	public String addUserDetails(ProfileBean profileBean) {
		return patientDao.addUserDetails(profileBean);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String checkuser(String uid, Date dob,String street) {
		return patientDao.checkuser(uid, dob,street);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String checkpass(String uid2, String newpass, String confpass) {
		return patientDao.checkpass(uid2, newpass, confpass);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewListOfDoctors2(String specialization) {
	ArrayList<DoctorBean> l7=new ArrayList<DoctorBean>();
	l7=patientDao.viewListOfDoctors2(specialization);
	return l7;
	}

}
