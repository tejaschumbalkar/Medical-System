package com.wipro.ocs.util;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.springframework.transaction.annotation.Transactional;

import org.springframework.transaction.annotation.Propagation;
import com.wipro.ocs.bean.CredentialsBean;
@Component
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AuthenticationImpl implements Authentication{
@Autowired
SessionFactory sessionFactory; 


	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean authenticate(CredentialsBean user) {
		
		CredentialsBean cbean=new CredentialsBean();
		
		
		try {
			cbean=(CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class,user.getUserID());
			
			
			//System.out.println(cbean.getUserID()+" sadsw w w");
			if(cbean.getPassword().equals(user.getPassword())){
				
				return true;
						
			}
			else{
				
				return false;
			}
			
			
			
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
		
				
				

	}

	@Override
	public String authorize(String userId) {
		CredentialsBean cbean=new CredentialsBean();
		cbean=(CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class,userId);
		 
		
				 return cbean.getUserType();
		
		
		
	}

	@Override
	public boolean changeLoginStatus(CredentialsBean user, int loginStatus) {
		CredentialsBean cbean=new CredentialsBean();
		try {
			cbean=(CredentialsBean) sessionFactory.getCurrentSession().get(CredentialsBean.class,user.getUserID());
			
			cbean.setLoginStatus(loginStatus);
		} catch (Exception e) {
			return false;
		}
		
		
		return true;
	}

}
