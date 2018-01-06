package com.wipro.ocs.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.LeaveBean;

@Repository("reporterDAO")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ReporterDAOImpl implements ReporterDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ArrayList<DoctorBean> viewAllAvailableDoctors(Date date) {
		int flag=0;
		DoctorBean d = new DoctorBean();
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
		   
		String sql = "select DOCTORID from OCS_TBL_Leave where "+"'"+format.format(date)+"'"+" between LEAVE_FROM and LEAVE_TO";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
     
		
		List<String> docid = (List<String>) query.list();
	

		System.out.println("sdjchsdbcjuysdjsb");
		
		for(int q=0;q<docid.size();q++){
			
			System.out.println("docid "+docid.get(q));
			
		}
		
		
		
		String sql1 = "select DOCTORID from OCS_TBL_Doctor";
		Query query1 = sessionFactory.getCurrentSession().createSQLQuery(sql1);
     
		List<String> docid1 = (List<String>) query1.list();
		
		for(int q=0;q<docid1.size();q++){
			
			System.out.println("docid1 "+docid1.get(q));
			
		}
		
		List<String> docid2 = new ArrayList<String> (docid1); 
		docid2.removeAll(docid);
		
		
		for(int q=0;q<docid2.size();q++){
			
			System.out.println("docid2 "+docid2.get(q));
			
		}
		
		List<String> docidfinal = new ArrayList<String>();
		
		for(int k=0;k<docid2.size();k++){
			flag=0;
			System.out.println("k is "+k);
			
			String sql3 = "select AVAILABLE_DAYS from OCS_TBL_Schedules where DOCTORID = "+"'"+docid2.get(k)+"'";
				Query que = sessionFactory.getCurrentSession().createSQLQuery(sql3);
			     
				String ress = (String) que.uniqueResult();
				System.out.println(ress);					
				
				if(ress!=null){
					
				
				String [] avday = ress.split(",");
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
					
		System.out.println(day);
					
					for(int h=0;h<avday.length;h++){
						
						if(day.equalsIgnoreCase(avday[h])){
							
							flag=1;
							
						}
						
					}
					
					if(flag==1){
						System.out.println("day "+docid2.get(k));
						docidfinal.add(docid2.get(k));
						
					}	
					
		}
		}
				
		ArrayList<DoctorBean> docbean = new ArrayList<DoctorBean>();
		
		for(int i=0;i<docidfinal.size();i++){
			System.out.println("doc final "+docidfinal.get(i));
			d = (DoctorBean) sessionFactory.getCurrentSession().load(DoctorBean.class,docidfinal.get(i));
			System.out.println("d is "+d.getDoctorID());
			docbean.add(d);
			
		}
		
		return docbean;
	}

	@Override
	public ArrayList<DoctorBean> intimateAdmin(Date date, String status) {
		
		
		
		
		
    		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		  
		System.out.println("date "+date);
		
		DoctorBean d = new DoctorBean();
		
		ArrayList<DoctorBean> docbean = new ArrayList<DoctorBean>();
		
		String sql1 = "select DOCTORID from OCS_TBL_Leave where STATUS=1 and "+"'"+format.format(date)+"'"+" between LEAVE_FROM and LEAVE_TO";
		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql1);
     
		List<String> docid = (List<String>) query.list();

        for(int q=0;q<docid.size();q++){
			
			System.out.println("docid "+docid.get(q));
			
		}
		
		
		for(int i=0;i<docid.size();i++){
			
			d = (DoctorBean) sessionFactory.getCurrentSession().load(DoctorBean.class,docid.get(i));
			docbean.add(d);
		}
		
		
		
		return docbean;
	}

	@Override
	public String insertLeave(LeaveBean leaveBean) {
		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		
		
		Session ses=sessionFactory.getCurrentSession();
		if(leaveBean==null)
			return "FAIL";
		try{
			int flag=0;
			Query q=ses.createSQLQuery("select OCS_SEQ_LEAVEID.nextval from dual");
			leaveBean.setLeaveID(q.uniqueResult().toString());
		
			
			String sql1 = "select DOCTORID from OCS_TBL_Appointments where APPOINTMENT_DATE not between "+"'"+format.format(leaveBean.getLeaveFrom())+"'"+" and "+"'"+format.format(leaveBean.getLeaveTo())+"'";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql1);
			
			List<String> docid = (List<String>) query.list();
		
			for(int i=0;i<docid.size();i++){
				
				if(leaveBean.getDoctorID().equals(docid.get(i))){
					
					flag=1;
					
				}	
				
			}
			
			if(flag==1){
				leaveBean.setStatus(1);
			}
			else{
				
				leaveBean.setStatus(0);
			}
			
			ses.save(leaveBean);
			return "SUCCESS";
		}catch(HibernateException he){
			he.printStackTrace();
			return "ERROR";
		}
	}

}
