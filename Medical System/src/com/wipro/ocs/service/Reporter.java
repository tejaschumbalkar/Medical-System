package com.wipro.ocs.service;

import java.util.ArrayList;
import java.util.Date;

import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.LeaveBean;

public interface Reporter {

	
	public ArrayList<DoctorBean> viewAllAvailableDoctors(Date date);
	public ArrayList<DoctorBean> intimateAdmin(Date date, String status);
	public String insertLeave(LeaveBean leaveBean);
}
