package com.wipro.ocs.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ScheduleBean;
@Repository
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AdministratorDAOImpl implements AdministratorDAO{
	@Autowired
	ReporterDAO reporterDAO;
@Autowired
SessionFactory sessionFactory;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String addDoctor(DoctorBean doctorBean) {
		
		try {
			System.out.println(doctorBean.getDoctorID());
			System.out.println(doctorBean.getCity());
			System.out.println(doctorBean.getContactNumber());
			System.out.println(doctorBean.getDoctorName());
			System.out.println(doctorBean.getEmailID());
			System.out.println(doctorBean.getGender());
			System.out.println(doctorBean.getLocation());
			System.out.println(doctorBean.getPincode());
			System.out.println(doctorBean.getQualification());
			System.out.println(doctorBean.getSpecialization());
			System.out.println(doctorBean.getState());
			System.out.println(doctorBean.getStreet());
			System.out.println(doctorBean.getYearsOfExperience());
			System.out.println(doctorBean.getDateOfBirth());
			System.out.println(doctorBean.getDateOfJoining());
			sessionFactory.getCurrentSession().saveOrUpdate(doctorBean);	
			
		} catch (Exception e) {
			e.printStackTrace();
			return "FAIL";
		}
		
		return "SUCCESS";
		
	}

	@Override
	public DoctorBean modifyDoctor(DoctorBean doctorBean) {
	
		DoctorBean doc=(DoctorBean)sessionFactory.getCurrentSession().get(DoctorBean.class, doctorBean.getDoctorID());
		return doc;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	public ArrayList<DoctorBean> viewAllDoctors() {
		// TODO Auto-generated method stub
		return (ArrayList<DoctorBean>) sessionFactory.getCurrentSession().createCriteria(DoctorBean.class).list();
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public int removeDoctor(String doctorID) {
		Session s=sessionFactory.getCurrentSession();
		
		try {
			
			Query q1 = s.createSQLQuery("DELETE OCS_TBL_SCHEDULES WHERE DOCTORID = '"+doctorID+"'");
			q1.executeUpdate();
			
			Query q2 = s.createSQLQuery("DELETE OCS_TBL_APPOINTMENTS WHERE DOCTORID = '"+doctorID+"'");
			q2.executeUpdate();
			
			Query q3 = s.createSQLQuery("DELETE OCS_TBL_LEAVE WHERE DOCTORID = '"+doctorID+"'");
			q3.executeUpdate();
			
			Query q4 = s.createSQLQuery("DELETE OCS_TBL_DOCTOR WHERE DOCTORID = '"+doctorID+"'");
			q4.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} 
		return 1;
		
	
	}

	@Override
	public ArrayList<DoctorBean> suggestDoctors(String patientId, Date date) {
		
		ArrayList<DoctorBean> docbean = new ArrayList<DoctorBean>();
		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		String ss = format.format(date);
		
		Date date2 = null;
		try {
			date2 = new SimpleDateFormat("dd-MMM-yy").parse(ss);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Calendar c=Calendar.getInstance();
c.setTime(date2);
	int dayofweek=c.get(Calendar.DAY_OF_WEEK);

		PatientBean pbean = new PatientBean();
		List<String> docidfinal = new ArrayList<String>();
		
		pbean = (PatientBean) sessionFactory.getCurrentSession().get(PatientBean.class,patientId);
		String ailment = pbean.getAilmentType();
		
		String sql = "select DOCTORID from OCS_TBL_Doctor where SPECIALIZATION="+"'"+ailment+"'";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		List<String> res = (List<String>) query.list();
		
          for(int q=0;q<res.size();q++){
			
			System.out.println("res "+res.get(q));
			
		}
		
		ArrayList<DoctorBean> doclist = new ArrayList<DoctorBean>();
		       
		doclist = reporterDAO.intimateAdmin(date,"1");
	
		List<String> res1 = new ArrayList<String>();
		
		for(int a=0;a<doclist.size();a++){
		res1.add(doclist.get(a).getDoctorID());
		}
		
         for(int q=0;q<res1.size();q++){
			
			System.out.println("res1 "+res1.get(q));
			
		}
		
		
		List<String> res2 = new ArrayList<String> (res); 
		res2.removeAll(res1);
		
		
		
		 for(int q=0;q<res2.size();q++){
				
				System.out.println("res2 "+res2.get(q));
				
			}
		
		int flag=0;
          for(int k=0;k<res2.size();k++){
        	  System.out.println("k is "+k);
			flag=0;
			String sql3 = "select AVAILABLE_DAYS from OCS_TBL_Schedules where DOCTORID = "+"'"+res2.get(k)+"'";
				Query que = sessionFactory.getCurrentSession().createSQLQuery(sql3);
			     
					List<String> li = (List<String>) que.list();
					
					String [] avday = li.get(0).split(",");
					
					
					String day = null;
					
					if(dayofweek==1){
						day="Sunday";
						
					}
					else if(dayofweek==2){
						day="Monday";
						
					}
					else if(dayofweek==3){
						day="Tuesday";
						
					}
					else if(dayofweek==4){
						day="Wednesday";
						
					}
					else if(dayofweek==5){
						day="Thursday";
						
					}
					else if(dayofweek==6){
						day="Friday";
						
					}
					else if(dayofweek==7){
						day="Saturday";
						
					}
					
		System.out.println("day is "+day);
					
					for(int h=0;h<avday.length;h++){
						
						if(day.equalsIgnoreCase(avday[h])){
							
							flag=1;
							
						}
						
						
						
					}
					
					if(flag==1){
						System.out.println("add "+res2.get(k));
						docidfinal.add(res2.get(k));
					}
					       	
		     		
          }
          DoctorBean d = new DoctorBean();
   		for(int i=0;i<docidfinal.size();i++){
   			
   			d = (DoctorBean) sessionFactory.getCurrentSession().load(DoctorBean.class,docidfinal.get(i));
   			System.out.println("d is "+d.getDoctorID());
   			docbean.add(d);
   		}
   		
          return docbean; 
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<String> viewPatientsByDate(
			Date appointmentDate) {
		String pattern = "dd-MMM-yy";
	    SimpleDateFormat format = new SimpleDateFormat(pattern);
	 ArrayList<String> l=new ArrayList<String>();
		
		
		
		PatientBean pbean = new PatientBean();
		AppointmentBean apbean = new AppointmentBean();
		
		Query query = sessionFactory.getCurrentSession().createSQLQuery("select APPOINTMENTID from OCS_TBL_Appointments where APPOINTMENT_DATE = "+"'"+format.format(appointmentDate)+"'");

		List<String> docid= (List<String>) query.list();
		for(int i=0;i<docid.size();i++){
			System.out.println("docid "+docid.get(i));
		}
		
		Query query1 = sessionFactory.getCurrentSession().createSQLQuery("select PATIENTID from OCS_TBL_Appointments where APPOINTMENT_DATE = "+"'"+format.format(appointmentDate)+"'");
		List<String> patid= (List<String>) query1.list();
		
		for(int i=0;i<patid.size();i++){
			System.out.println("patid "+patid.get(i));
		}
		
		
		for(int i=0;i<docid.size();i++){
			
			apbean = (AppointmentBean) sessionFactory.getCurrentSession().get(AppointmentBean.class,docid.get(i));			
			pbean = (PatientBean) sessionFactory.getCurrentSession().get(PatientBean.class,patid.get(i));
			System.out.println("app id "+apbean.getAppointmentID());
			l.add(apbean.getAppointmentID());
			l.add(pbean.getPatientID());
			l.add(apbean.getAppointmentDate().toString());
			l.add(apbean.getAppointmentTime());
			
			l.add(pbean.getAilmentType());
			l.add(pbean.getAilmentDetails());
			
			
				}
		
		return l;
	
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String setSchedule(ScheduleBean sc) {
	try {
		
	
		//System.out.println("hello1");
			String sql="Select OCS_SEQ_SCHEDULEID.nextval from dual";
			
			SQLQuery query=sessionFactory.getCurrentSession().createSQLQuery(sql);
			
			String seq=query.uniqueResult().toString();		
			sc.setScheduleID(seq);
			
			String slot="";
			String[] av = sc.getAvailableDays().split(",");
			
			for(int i=0;i<av.length;i++){
				
				slot = slot+av[i].toUpperCase().substring(0,1)+sc.getSlots();
				
				if(i!=av.length-1){
					
					slot=slot+",";
				}
				
			}
			
			
                    sc.setSlots(slot);
			System.out.println("av... "+sc.getAvailableDays());
			System.out.println("sl... "+sc.getSlots());
			
			System.out.println(sc.getDoctorID()); 

		sessionFactory.getCurrentSession().save(sc);
		System.out.println("hello2");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		return "SUCCESS";
	}

}
