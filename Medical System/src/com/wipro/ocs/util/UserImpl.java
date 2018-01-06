package com.wipro.ocs.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.ocs.bean.CredentialsBean;
import com.wipro.ocs.bean.ProfileBean;
@Service("user")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserImpl implements User{
	@Autowired
	SessionFactory sessionFactory; 
	@Autowired
	Authentication authentication; 
	
	String result1="";
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String login(CredentialsBean credentialsBean) {
		
		try {
			
			boolean b=authentication.authenticate(credentialsBean);
			if(b==true){
				
				result1=authentication.authorize(credentialsBean.getUserID());
				
		       boolean b1=authentication.changeLoginStatus(credentialsBean, 1);
				if(b1==true){
				return result1;
			}else{
				return "invalid";
				
			}
				
				}
			else{
				
				return "invalid";
			}
			
			
		} catch (Exception e) {
			System.out.println("in exception cbean null");
			return "invalid";
		}
		 
		
		
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean logout(String userId) {
		
		Session s=sessionFactory.getCurrentSession();
		
		//System.out.println("hello");
		System.out.println("sdjfdj "+userId);
		CredentialsBean cbean=(CredentialsBean)s.get(CredentialsBean.class , userId);
		int i=0;
		cbean.setLoginStatus(i);
		//System.out.println("hello1");
		s.save(cbean);
		//System.out.println("hello2");
		return true;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String changePassword(CredentialsBean credentialsBean, String str) {
		
		CredentialsBean b = new CredentialsBean();
		
		b = (CredentialsBean) sessionFactory.getCurrentSession().load(CredentialsBean.class,credentialsBean.getUserID());
		
		if(!(b.getPassword().equals(credentialsBean.getPassword()))){
			
			return "Old Password Incorrect";
			
		}
		
		else{
			System.out.println("bsdb"+str);
			b.setPassword(str);
			System.out.println("b is "+b.getPassword());
			System.out.println("b is "+b.getLoginStatus());
			System.out.println("b is "+b.getUserID());
			System.out.println("b is "+b.getUserType());
			
			try {
				sessionFactory.getCurrentSession().saveOrUpdate(b);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "SUCCESS";
		}
		
		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String checkstatus(CredentialsBean credentialsBean) {
	
		
		
		CredentialsBean cbean=(CredentialsBean)sessionFactory.getCurrentSession().get(CredentialsBean.class , credentialsBean.getUserID());
		
		
		if(cbean.getLoginStatus()==1)
		{
		
		return "Logged IN";
		
		}
		else
		{
			return "SUCCESS";
			
		}
		
		//return null;
	}

	@Override
	public String register(ProfileBean profileBean) {
		
		
		
		return null;
	}
	
}
