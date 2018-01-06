package com.wipro.ocs.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.LeaveBean;
import com.wipro.ocs.dao.ReporterDAO;

@Service("reporter")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ReporterImpl implements Reporter{

	@Autowired
	ReporterDAO reporterDAO;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewAllAvailableDoctors(Date date) {
		
		return reporterDAO.viewAllAvailableDoctors(date);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> intimateAdmin(Date date, String status) {
		
		return reporterDAO.intimateAdmin(date, status);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String insertLeave(LeaveBean leaveBean) {
		return reporterDAO.insertLeave(leaveBean);
	}

}
