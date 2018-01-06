package com.wipro.ocs.dao;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.CredentialsBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ProfileBean;
import com.wipro.ocs.bean.ScheduleBean;
import com.wipro.ocs.bean.SlotBean;
@Repository 
public class PatientDAOImpl implements PatientDAO{

	@Autowired
	 SessionFactory sessionFactory;
	
	@Autowired
	ReporterDAO reporterDAO;
	
	
	

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String addAilmentDetails(PatientBean patientBean) {
		 String result="Fail";
		
		 
		try{
	
		if( patientBean.getPatientID()==null){
			
		String sql="select OCS_SEQ_PATIENTID.nextval from dual";
			
			Query query=sessionFactory.getCurrentSession().createSQLQuery(sql);
			String str1=query.uniqueResult().toString();
			patientBean.setPatientID(str1);
			
			}
		System.out.println(patientBean.getAilmentDetails());
		System.out.println(patientBean.getAilmentType());
		System.out.println(patientBean.getDiagnosisHistory());
		System.out.println(patientBean.getPatientID());
		System.out.println(patientBean.getUserID());
		System.out.println(patientBean.getAppointmentDate());
		sessionFactory.getCurrentSession().saveOrUpdate(patientBean);
		result="Success";
	
			
	
		
		
	}catch (HibernateException e){
			e.printStackTrace();
			return "Fail";
		}
		return result;
		
		
	}
	@Override
	public boolean modifyAilmentDetails(PatientBean patientBean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public PatientBean viewAilmentDetails(String patientID) {
		PatientBean pb= (PatientBean)sessionFactory.getCurrentSession().get(PatientBean.class,patientID);
		
		return pb;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewListOfDoctors(String specialization,Date date) {
		
		Session s=sessionFactory.getCurrentSession();	
		String day="";
		int dayofweek=0;
		try {
			
			String pattern = "dd-MMM-yy";
			   SimpleDateFormat format = new SimpleDateFormat(pattern);
			String ss = format.format(date);
			
			Date date2 = null;
			try {
				date2 = new SimpleDateFormat("dd-MMM-yy").parse(ss);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			
			Calendar c=Calendar.getInstance();
			c.setTime(date2);
			dayofweek=c.get(Calendar.DAY_OF_WEEK);
			 
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
			String sql = "select DOCTORID from OCS_TBL_Doctor where SPECIALIZATION = "+"'"+specialization+"'";
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		
			List<String> list = new ArrayList<String>();
			list = query.list();
			
			for(int i=0;i<list.size();i++){
				
				System.out.println("list "+list.get(i));
			}

			String sql1 = "select DOCTORID from OCS_TBL_Leave where STATUS=0 and "+"'"+ss+"'"+" between LEAVE_FROM and LEAVE_TO";
			Query query1 = sessionFactory.getCurrentSession().createSQLQuery(sql1);
			
			List<String> list1 = new ArrayList<String>();
			
			list1 = query1.list();
		
	        for(int i=0;i<list1.size();i++){
				
				System.out.println("list1 "+list1.get(i));
			}
			
			List<String> uncommon = new ArrayList<String> (list);
			uncommon.removeAll(list1);
			List<String> uncommon1 = new ArrayList<String>();
          for(int i=0;i<uncommon.size();i++){
				
				System.out.println("uncommon "+uncommon.get(i));
			}
			//////////////////////////////////////////////////////////////
        
          for(int j=0;j<uncommon.size();j++){
        	  System.out.println("enteer "+uncommon.get(j));
				int flag=0;
        	  String sql2 = "select AVAILABLE_DAYS from OCS_TBL_SCHEDULES where DOCTORID = "+"'"+uncommon.get(j)+"'";
  			Query query2 = sessionFactory.getCurrentSession().createSQLQuery(sql2);
  			
  		     String avdays = query2.uniqueResult().toString();
  	
  		     String[] arr = avdays.split(",");
  		     
  		     for(int k=0;k<arr.length;k++){
  		    	 
  		    	 if(arr[k].equalsIgnoreCase(day)){
  		    		 
  		    		 flag=1;
  		    	 }
  		    	 
  		     }
  		     
  		     
  		     if(flag==1){
  		    	 
  		    	 uncommon1.add(uncommon.get(j));
  		    
  		     }
  		     
  		     
          }
		
			
//          for(int i=0;i<uncommon1.size();i++){
//				
//				System.out.println("uncommon1 "+uncommon1.get(i));
//			}
//          
//		
          
          /////////////////////////////////////////////
          
			ArrayList<DoctorBean> docbean = new ArrayList<DoctorBean>();
			
			DoctorBean bea = new DoctorBean();
			
			for(int z=0;z<uncommon1.size();z++){
				
				bea = (DoctorBean) sessionFactory.getCurrentSession().get(DoctorBean.class,uncommon1.get(z));
				
				docbean.add(bea);
				System.out.println("bea "+bea.getDoctorID());
			}
				
			return docbean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	
	}
	@Override
	public String requestforAppointment(String doctorID, Date appointmentDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AppointmentBean viewAppointmentDetails(
			String patientID, Date date) {
	
		
		String pattern = "dd-MMM-yy";
	    SimpleDateFormat format = new SimpleDateFormat(pattern);
	
		AppointmentBean apbean = new AppointmentBean();
		
		Query query = sessionFactory.getCurrentSession().createSQLQuery("select APPOINTMENTID from OCS_TBL_Appointments where APPOINTMENT_DATE = "+"'"+format.format(date)+"'"+" and PATIENTID = "+"'"+patientID+"'");

		String appid = query.uniqueResult().toString();
		
		AppointmentBean appbean = new AppointmentBean();
		
		appbean = (AppointmentBean) sessionFactory.getCurrentSession().get(AppointmentBean.class,appid);
	
		return appbean;
		
			}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String saveappointment(AppointmentBean appointmentBean) {
		
		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		String ss = format.format(appointmentBean.getAppointmentDate());
		
		
		String res=null;
		ArrayList<DoctorBean> docbean = new ArrayList<DoctorBean>();
		
		
			String sql = "select AILMENT_TYPE from OCS_TBL_PATIENT where PATIENTID = "+"'"+appointmentBean.getPatientID()+"'";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			
			res = query.uniqueResult().toString();
		
		if(res.isEmpty()){
			
			return "Enter a valid Patient ID";
		}
		
		else{
			
			String sql1 = "select SPECIALIZATION from OCS_TBL_Doctor where DOCTORID = "+"'"+appointmentBean.getDoctorID()+"'";
			Query query1 = sessionFactory.getCurrentSession().createSQLQuery(sql1);
			
			String res1= query1.uniqueResult().toString();
			
			if(res1.isEmpty()){
				
				return "Enter a valid Doctor ID";
			}
			
			else{
				System.out.println("h1 "+res);
				System.out.println("h2 "+res1);
				
				if(!res.equalsIgnoreCase(res1)){
					
					return "Ailment Type of Patient does not match Doctor's Specialization";
				}
				
				else{
					
					
					docbean = reporterDAO.viewAllAvailableDoctors(appointmentBean.getAppointmentDate());
					
					List<String> doc = new ArrayList<String>();
					
					for(int i=0;i<docbean.size();i++){
						
						doc.add(docbean.get(i).getDoctorID());
					}
					
					
					if(doc.contains(appointmentBean.getDoctorID())){
						
						
						String sq = "select SLOT from OCS_TBL_SLOTS where date1 = "+"'"+ss+"'";
						Query que = sessionFactory.getCurrentSession().createSQLQuery(sq);	
						
						List<Integer> sloo = new ArrayList<Integer>();
						
						sloo = que.list();
					//	String sl = que.uniqueResult().toString();
						
						if(sloo.isEmpty()){
							
							appointmentBean.setAppointmentTime("09:00 - 09:15");
							
							SlotBean sbean1 = new SlotBean();
							sbean1.setDate(appointmentBean.getAppointmentDate());
							sbean1.setSlot(11);
							sessionFactory.getCurrentSession().save(sbean1);
							
							
						}
						
						if(!sloo.isEmpty()){
							
						long nos =  ((Number) sloo.get(0)).longValue();
							
						//	int nos = Integer.valueOf(sloo.get(0));
						//	Integer no = ((BigInteger) sloo.get(0)).intValue();
							if(nos==0){
								
								return "No Slots Available, Please try for another Date";
							}
							else{
								if(nos==11){
									
									appointmentBean.setAppointmentTime("9:30 - 9:45");
								}
								else if(nos==10){
									
									appointmentBean.setAppointmentTime("10:00 - 10:15");
								}
								else if(nos==9){
									
									appointmentBean.setAppointmentTime("10:30 - 10:45");
								}
								else if(nos==8){
									
									appointmentBean.setAppointmentTime("11:00 - 11:15");
								}
								else if(nos==7){
									
									appointmentBean.setAppointmentTime("11:30 - 11:45");
								}						
								else if(nos==6){
									
									appointmentBean.setAppointmentTime("14:00 - 14:15");
								}
								
								else if(nos==5){
									
									appointmentBean.setAppointmentTime("14:30 - 14:45");
								}
								else if(nos==4){
									
									appointmentBean.setAppointmentTime("15:00 - 15:15");
								}
								else if(nos==3){
									
									appointmentBean.setAppointmentTime("15:30 - 15:45");
								}
								else if(nos==2){
									
									appointmentBean.setAppointmentTime("16:00 - 16:15");
								}						
								else{
									
									appointmentBean.setAppointmentTime("16:30 - 16:45");
								}
								
	
								
								SlotBean sbean = new SlotBean();
								
								sbean = (SlotBean) sessionFactory.getCurrentSession().load(SlotBean.class,appointmentBean.getAppointmentDate());
								
								sbean.setSlot(Integer.valueOf((int) (nos-1)));
								
								sessionFactory.getCurrentSession().update(sbean);
								
							}
							
							
							
							
							
						}
						
						
						
	
						//////////////////////////////////////////////////////////////////////////////
	
							try {
								
								String sql3="select OCS_SEQ_APPOINTMENTID.nextval from dual";
								Query query3=sessionFactory.getCurrentSession().createSQLQuery(sql3);
								String appid=query3.uniqueResult().toString();
								
								appointmentBean.setAppointmentID(appid);
								
								sessionFactory.getCurrentSession().save(appointmentBean);
								
								/////////////////////////////////////////////////////////////////
								
					
								PatientBean pb = new PatientBean();
								pb = (PatientBean) sessionFactory.getCurrentSession().get(PatientBean.class,appointmentBean.getPatientID());

								pb.setAppointmentDate(appointmentBean.getAppointmentDate());
								
								sessionFactory.getCurrentSession().update(pb);
								
								return "Appointment Booked Successfully";
								
							} catch (HibernateException e) {
				
								e.printStackTrace();
								return "Something Went Wrong , Try again after some time.....";
							}
							
							
							
							
						}
					else{
						
						return "Doctor with ID: "+appointmentBean.getDoctorID()+" is not present for this date";
					}
					
					
					
				}
					
			}
				
			}


		}
		
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String addUserDetails(ProfileBean profileBean) {
		Session s3=sessionFactory.getCurrentSession();
		String id=null;
		Query q=s3.createSQLQuery("select OCS_SEQ_USERID.nextval from dual");
		id=q.uniqueResult().toString();
		String s=profileBean.getFirstName().substring(0,2).toUpperCase()+id;
		profileBean.setUserID(s);
		String pass = profileBean.getPassword();
		CredentialsBean cb=new CredentialsBean();
		cb.setUserID(profileBean.getUserID());
		cb.setPassword(profileBean.getPassword());
		cb.setUserType("P");
		cb.setLoginStatus(0);
		Session s4=sessionFactory.getCurrentSession();
		s4.save(cb);
		 s3.save(profileBean);
		 System.out.println(profileBean.getUserID());
		return "Success";
	}
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String checkuser(String uid, Date dob,String street) {
		
		
		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		String ss = format.format(dob);

		List<Object> li = new ArrayList<Object>();
		Query query;
		try {
			String sql = "select DATEOFBIRTH,STREET from OCS_TBL_User_Profile where USERID = "+"'"+uid+"'";
		query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		li = query.list();
			
		} catch (Exception e) {
			return "Invalid User ID";
		}
		
		System.out.println("out");

		
		if(li.isEmpty()){
			
		
			return "Invalid User ID";
		}
		

		
	String street1="";
	String dob11="";
		Iterator itr = li.iterator();
		while(itr.hasNext()){
		   Object[] obj = (Object[]) itr.next();
		
		street1 = String.valueOf(obj[1]); 
		 dob11 =String.valueOf(obj[0]);
		
		}
		
		System.out.println(dob11);
		Date date2 = null;
		try {
			date2 = new SimpleDateFormat("yyyy-MM-dd").parse(dob11);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		String dob1 = format.format(date2);
		


		
		System.out.println("ss "+ss);
		System.out.println("dob1 "+dob1);
		System.out.println("st1 "+street1);
		
		if(!(ss.equalsIgnoreCase(dob1))){
			
			return "Enter valid Date of Birth";
			
		}
		
		else if(!(street.equalsIgnoreCase(street1))){
			
			return "Incorrect Street name";
		}
		
		
		else{
			return "Success";
		}
		
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String checkpass(String uid2, String newpass, String confpass) {
		Session s6=sessionFactory.getCurrentSession();
		CredentialsBean pb=(CredentialsBean) s6.get(CredentialsBean.class, uid2);
		System.out.println("prof:"+pb.getPassword());
		if(newpass.equalsIgnoreCase(confpass)){//&& confpass.equalsIgnoreCase(pb.getPassword())){
			pb.setPassword(confpass);
			s6.saveOrUpdate(pb);
			return "Success";
		}
		else
			return "Password not matched";
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewListOfDoctors2(String specialization) {
	try {
	String sql = "select DOCTORID from OCS_TBL_Doctor where SPECIALIZATION = "+"'"+specialization+"'";
	Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
	List<String> list77 = new ArrayList<String>();
	list77 = query.list();
	ArrayList<DoctorBean> docbean77 = new ArrayList<DoctorBean>();
	DoctorBean bea77 = new DoctorBean();
	for(int i=0;i<list77.size();i++){
	bea77 = (DoctorBean) sessionFactory.getCurrentSession().get(DoctorBean.class,list77.get(i));
	docbean77.add(bea77);
	System.out.println("bea "+bea77.getDoctorID());
	}
	return docbean77;
	} catch (Exception e) {
	e.printStackTrace();
	return null;
	}

	}


}
