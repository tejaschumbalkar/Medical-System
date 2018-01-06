package com.wipro.ocs.util;

import com.wipro.ocs.bean.CredentialsBean;

public interface Authentication {
	
	public boolean authenticate(CredentialsBean user);
	String authorize(String userId);
	boolean changeLoginStatus(CredentialsBean user, int loginStatus);

}
