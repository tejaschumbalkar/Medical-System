package com.wipro.ocs.util;

import com.wipro.ocs.bean.CredentialsBean;
import com.wipro.ocs.bean.ProfileBean;

public interface User {
	
	public String login(CredentialsBean credentialsBean);
	public boolean logout(String userId);
	public String changePassword(CredentialsBean credentialsBean,String str);
	public String register(ProfileBean profileBean);
	String checkstatus(CredentialsBean credentialsBean);

}
