package com.wipro.ocs.controller;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;


















import com.wipro.ocs.bean.AppointmentBean;
import com.wipro.ocs.bean.CredentialsBean;
import com.wipro.ocs.bean.DoctorBean;
import com.wipro.ocs.bean.LeaveBean;
import com.wipro.ocs.bean.PatientBean;
import com.wipro.ocs.bean.ProfileBean;
import com.wipro.ocs.bean.ScheduleBean;
import com.wipro.ocs.service.Administrator;
import com.wipro.ocs.service.Patient;
import com.wipro.ocs.service.Reporter;
import com.wipro.ocs.util.Authentication;
import com.wipro.ocs.util.User;

@Controller

@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class MainController {
	@Autowired
	SessionFactory sessionFactory;
@Autowired
Authentication authentication;
@Autowired
User user;
@Autowired
Administrator administrator;
@Autowired
Patient patient;
@Autowired
Reporter reporter;




HttpSession s1;
HttpSession s2;
String result1="";
String result2="";

	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginEmployee(@ModelAttribute("hi") CredentialsBean credBean, 
			BindingResult result,HttpSession s1,HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

		//System.out.println("user is "+s1.getAttribute("userID"));
		/*if(credBean.getUserID().equalsIgnoreCase((String) s1.getAttribute("userID"))){
			return new ModelAndView("error");
		}*/
		
		//s1=request.getSession();
		//System.out.println(credBean.getUserID());
		
		String status=user.checkstatus(credBean);
		if(status.equals("Logged IN"))
		{
			
				String str="User Already Logged in!!!!";
				return new ModelAndView("index123","store",str);
			
		
			
//			if(credBean.getUserType()=="A"){
//				
//				return new ModelAndView("admin");
//			}
//			
//			else if(credBean.getUserType()=="P"){
//				
//				return new ModelAndView("patient");
//				
//			}
//				
//			else {
//				
//	              return new ModelAndView("reporter");
//	
//             }
//			
		
			
		}
		
		else{
		
		
		s1.setAttribute("userID", credBean.getUserID());
		System.out.println("get att "+s1.getAttribute("userID"));
			result1=user.login(credBean);
			System.out.println("0000000000000000");
			
			
			if(result1.equals("A")){
				
				return new ModelAndView("admin");
				
			}
			else if(result1.equals("P")){
				
				return new ModelAndView("patient");
				
			}
				
			else if(result1.equals("R")){
				
	return new ModelAndView("reporter");
	
}
			else{
				String str = "Username or Password Invalid";
				System.out.println(str);
			//	s1.setAttribute("re",str);
			//	req.setAttribute("re",str);
			//	System.out.println(req.getAttribute("re"));
			//	RequestDispatcher dis = req.getRequestDispatcher("index123.jsp");
				//dis.forward(req,resp);	
				return new ModelAndView("index123","store",str);
				
			}
		
		
			
			
		}
	
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginployee(@ModelAttribute("hi") CredentialsBean credBean, 
			BindingResult result,HttpSession s1) {
		return new ModelAndView("index123");
	}

	@ExceptionHandler(value=Exception.class)
	public String fooo(Exception e,HttpServletRequest request){
		
		return "error";
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addEmployee(@ModelAttribute("add") DoctorBean doctorBean,
			BindingResult result,HttpSession s1) {
		
		
				return new ModelAndView("addDoc");
	}
	
	@RequestMapping(value = "/add1", method = RequestMethod.POST)
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public ModelAndView addEmployee1(@ModelAttribute("add") @Valid DoctorBean doctorBean,
			BindingResult result,HttpServletRequest request,
			HttpServletResponse response,HttpSession s2) {
		
		
		if(result.hasErrors())
		{
			System.out.println(result);
			return new ModelAndView("addDoc");
		}
		
		
		Calendar c = Calendar.getInstance();
		c.setTime(doctorBean.getDateOfBirth());
		int year = c.get(Calendar.YEAR);
		
		Calendar c1 = Calendar.getInstance();
		c1.setTime(doctorBean.getDateOfJoining());
		int year1 = c1.get(Calendar.YEAR);
		
		if(year1-year<30){
			
		  String str = "Minimum Doctor Age Should be 30";
			System.out.println(str);	
			return new ModelAndView("addDoc","store",str);	
			
		}
		
			String sql="Select OCS_SEQ_DOCTORID.nextval from dual";
			
			SQLQuery query=sessionFactory.getCurrentSession().createSQLQuery(sql);
			
			String seq=query.uniqueResult().toString();		
			//System.out.println(seq);
			doctorBean.setDoctorID(seq);
			s2=request.getSession();
			s2.setAttribute("doctorID", doctorBean.getDoctorID());
			System.out.println("s2 is "+s2.getAttribute("doctorID"));
			
			result2=administrator.addDoctor(doctorBean);
			
			 
			if(result2.equals("SUCCESS")){
					return new ModelAndView("Schedule");
			 }
			 else
			 {
				 String str="There was an error!! Please try again after some time.";
				 return new ModelAndView("failure","fail",str);
			 }
			
			}
		 

	@RequestMapping(value = "/addd", method = RequestMethod.POST)
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public ModelAndView addEmployee111(@ModelAttribute("add") @Valid DoctorBean doctorBean,
			BindingResult result,HttpServletRequest request,
			HttpServletResponse response,HttpSession s2) {
		
		
		if(result.hasErrors())
		{
			System.out.println(result);
			return new ModelAndView("editDoc");
		}
		
		
		String se = (String) s2.getAttribute("sex");
		doctorBean.setGender(se);
			System.out.println("sdfsdfc " +s2.getAttribute("sex"));
			
			DoctorBean doc=new DoctorBean();
			Session sesss=sessionFactory.getCurrentSession();
			doc = (DoctorBean) sesss.load(DoctorBean.class,doctorBean.getDoctorID());
			doctorBean.setDateOfBirth((Date)s2.getAttribute("dob"));
			doctorBean.setDateOfJoining((Date)s2.getAttribute("doj"));
			
			result2=administrator.addDoctor(doctorBean);
			
			if(result2.equals("SUCCESS")){
				String str="The details were modified for Doctor ID: "+doctorBean.getDoctorID();
						return new ModelAndView("success","res",str);
					 
				 }
				 else
				 {
					 
					 String str="There was an error!! Please try again after some time.";
					 return new ModelAndView("failure","fail",str);
				 }
					
	}
	@RequestMapping("/Sched")
	public ModelAndView addEmpl(@ModelAttribute("add") ProfileBean profileBean){
			
			return new ModelAndView("Schedules");
			
			}
	@RequestMapping(value = "/add2", method = RequestMethod.POST)
	public ModelAndView addEmployee2(@ModelAttribute("add") @Valid ProfileBean profileBean,
	BindingResult result,HttpServletRequest request,
	HttpServletResponse response,HttpSession s2)
	{
		System.out.println("passsword  "+profileBean.getPassword());
		System.out.println("confirm   "+profileBean.getConfirm());
		int sl = 0;
		
		try {
			sl=Integer.parseInt(profileBean.getConfirm());
			
		} catch (Exception e) {
			
			String str="Slot should be a number";
			 return new ModelAndView("Schedules","sed1",str);
			
		}
		
		
		
		if(profileBean.getPassword()==null || profileBean.getPassword().isEmpty()){
			return new ModelAndView("Schedules","sed","Please select atleast one day");
		}
		//if(profileBean.getConfirm().)
		if(sl<1 || sl>12)
			return new ModelAndView("Schedules","sed","Value of Slots should be in between 1 and 12");
	
		
		
	
		ScheduleBean sc=new ScheduleBean();
		
		String id1=s2.getAttribute("doctorID").toString();
	
		sc.setDoctorID(id1);
		sc.setAvailableDays(profileBean.getPassword());
		sc.setSlots(String.valueOf(sl));
		String s1=administrator.setSchedule(sc);
	
		if(s1.equals("SUCCESS")){
			 String str="Doctor has been added and the Doctor ID is "+id1;
			return new ModelAndView("success","res",str);
		 
	 }
	 else
	 {
		 String str="There was an error!! Please try again after some time.";
		 return new ModelAndView("failure","fail",str);
	 }
		
	}
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modEmployee(@ModelAttribute("mod") DoctorBean doctorBean, 
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		List l=new ArrayList();
		l=administrator.viewAllDoctors();
		
		if(l.isEmpty()){
			
			return new ModelAndView("fff","mess","NO Doctors Present.");
			
		}
		
		else{
		model.put("ViewAll",  l);
		return new ModelAndView("modDoc", model);
		}
				
	}
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView listEmployee() {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List l=new ArrayList();
		l=administrator.viewAllDoctors();
		
			if(l.isEmpty()){
			
			return new ModelAndView("fff","mess","NO Doctors Present.");
			
		}
		
		else{
			
			model.put("ViewAll", l );
			return new ModelAndView("DoctorList", model);
		}
		
		
	
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@ModelAttribute("add") DoctorBean view, 
			BindingResult result,HttpSession sa) {
		
		
		
		System.out.println(view.getDoctorID());
		DoctorBean doctorBean1=administrator.modifyDoctor(view);
		Map<String, DoctorBean> model = new HashMap<String, DoctorBean>();
		
		sa.setAttribute("sex",doctorBean1.getGender());
		sa.setAttribute("dob", doctorBean1.getDateOfBirth());
		sa.setAttribute("doj", doctorBean1.getDateOfJoining());
		
		model.put("DoctorBean",doctorBean1);
		
		return new ModelAndView("editDoc",model);
				
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@ModelAttribute("ViewAll") DoctorBean View, 
			BindingResult result) {
		System.out.println(View.getDoctorID());
		
		
		int i=administrator.removeDoctor(View.getDoctorID());
		
		if(i==1)
		{
			String str="Details of Doctor with ID: "+View.getDoctorID()+" has been removed.";
		return new ModelAndView("success","res",str);
		}
		else{
			String str="There was an error!! Please try again after some time.";
			 return new ModelAndView("failure","fail",str);
		}
	}
	

	@RequestMapping(value = "/suggest", method = RequestMethod.GET)
	public ModelAndView suggestDoc(@ModelAttribute("command") PatientBean PatientBean, 
			BindingResult result) {
	
		
				return new ModelAndView("suggestdoc");
	}
	
	@RequestMapping(value = "/sugg", method = RequestMethod.POST)
	public ModelAndView suggestDoctors(@ModelAttribute("command") @Valid PatientBean PatientBean, 
			BindingResult result) {
		  System.out.println("sfmbsdfbsjfbsfsfsfsffsfsfsfsffsfsfsf");
		if(result.hasErrors()){
			System.out.println(result);
			return new ModelAndView("suggestdoc");
		}
		
		/////////////////////
		PatientBean pb = new PatientBean();
		pb = patient.viewAilmentDetails(PatientBean.getPatientID());
	
	     if(pb==null){
	    	 
	    	  String str = "Invalid Patient ID";
				return new ModelAndView("suggestdoc","store",str);	
				
	     }
		
		////////////////////////////
		else{
		   System.out.println("sfmbsdfbsjfb");
		   System.out.println(PatientBean.getPatientID());
		System.out.println(PatientBean.getAppointmentDate());
		
		ArrayList<DoctorBean> list = new ArrayList<DoctorBean>();
		list = administrator.suggestDoctors(PatientBean.getPatientID(),PatientBean.getAppointmentDate());
		
		if(list.isEmpty()){
			
			String str="No Suggession Available";
			 return new ModelAndView("s","ss",str);
		}
		
		System.out.println(list.get(0).getDoctorID());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("doctors",list);
		
				return new ModelAndView("suggestdoctors",map);
		}
	}
	@RequestMapping(value = "/addPatient", method = RequestMethod.GET)
	public ModelAndView addAlimentsDetailsForm(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result,HttpSession s1) {
		
	String id=s1.getAttribute("userID").toString();
		
		patientBean.setUserID(id); 
		
		
		System.out.println(patientBean.getUserID());
	
		return new ModelAndView("addAliment");
	}
	@RequestMapping(value = "/savePatient", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute("command") @Valid PatientBean patientBean, 
			BindingResult result) {
		if(result.hasErrors()){
			System.out.println(result);
			return new ModelAndView("addAliment");

		}
			
		String result1=patient.addAilmentDetails(patientBean);
		System.out.println(result1);
		if(result1.equalsIgnoreCase("Success")){
		String str="Patient added successfully. Patient ID is "+patientBean.getPatientID();
		return new ModelAndView("success","res",str);
		}
		else{
			String str="There was an error!! Please try again after some time.";
			 return new ModelAndView("failure","fail",str);
		}
	}
	
	@RequestMapping(value = "/modifyPatient", method = RequestMethod.GET)
	public ModelAndView modifyPatient(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result) {
		
	
		return new ModelAndView("modifypatientid");
			
		
		
	}
	@RequestMapping(value = "/modifyPatient1", method = RequestMethod.POST)
	public ModelAndView modifyPatient1(@ModelAttribute("command") @Valid PatientBean patientBean, 
			BindingResult result,HttpSession s5) {
		
		if(result.hasErrors())
			return new ModelAndView("modifypatientid");
		
		System.out.println(patientBean.getPatientID());
		System.out.println(patientBean.getUserID());
		Map<String,Object> model=new HashMap<String, Object>();
		PatientBean pb = new PatientBean();
		pb = patient.viewAilmentDetails(patientBean.getPatientID());
    
		
		
		
		
     if(pb==null){
    	 
    	  String str = "Invalid Patient ID";
			System.out.println(str);	
			return new ModelAndView("modifypatientid","store",str);	
			
     }
     else{
    	 s5.setAttribute("patID",pb.getPatientID() );
    	 model.put("patientBean",pb);
 		return new ModelAndView("addAliment2",model);
     }
      
		
		
	}
	
	
	@RequestMapping(value = "/ret2", method = RequestMethod.POST)
	public ModelAndView v(@ModelAttribute("command") @Valid PatientBean patientBean, 
			BindingResult result,HttpSession s5) {
		
		
		if(result.hasErrors()){
			System.out.println(result);
			return new ModelAndView("addAliment2");

		}
			patientBean.setPatientID(s5.getAttribute("patID").toString());
		String result1=patient.addAilmentDetails(patientBean);
		System.out.println(result1);
		if(result1.equalsIgnoreCase("Success")){
		String str="Details of the patient with ID:"+patientBean.getPatientID()+" modified successfully";
		return new ModelAndView("success","res",str);
		}
		else{
			String str="There was an error!! Please try again after some time.";
			 return new ModelAndView("failure","fail",str);
		}
	}
	
	@RequestMapping(value = "/viewPatient", method = RequestMethod.GET)
	public ModelAndView viewPatient(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result) {
		
		return new ModelAndView("viewpatientid");
	}

	
	@RequestMapping(value = "/requestappointment", method = RequestMethod.GET)
	public ModelAndView reqappontmt(@ModelAttribute("command") AppointmentBean appointmentBean,
			BindingResult result) {
		
		return new ModelAndView("requestappointment");
	}
	
	@RequestMapping(value = "/saveappointment", method = RequestMethod.POST)
	public ModelAndView saveappointment(@ModelAttribute("command") @Valid AppointmentBean appointmentBean, 
			BindingResult result) {
	
		if(result.hasErrors()){
	
			return new ModelAndView("requestappointment");

		}
		PatientBean pb = new PatientBean();
		pb = patient.viewAilmentDetails(appointmentBean.getPatientID());
   
		
     if(pb==null){
    	 
    	  String str = "Invalid Patient ID";
			System.out.println(str);	
			return new ModelAndView("requestappointment","store",str);	
			
     }
    
    	 
    	 ArrayList<DoctorBean> lis = new ArrayList<DoctorBean>();
    	 lis = administrator.viewAllDoctors();
    	 int flag=0;
    	 
    	 for(int i=0;i<lis.size();i++){
    		 
    		 if(lis.get(i).getDoctorID().equals(appointmentBean.getDoctorID())){
    			 
    			 flag=1;
    			
    		 }
    		 
    	 }
    	 
    	 if(flag==0){
    		 
    		 String str1 = "Invalid Doctor ID";
 		
 			return new ModelAndView("requestappointment","store1",str1);	
    		 
    	 }
    	 
    	 else{
    		 
    		
    		 String result1=patient.saveappointment(appointmentBean);
    			System.out.println(result1);
    			
    			if(result1.equals("Appointment Booked Successfully")){
    				
    				flag=0;
    				return new ModelAndView("success","res",result1);
    				
    			}
    			else{
    				
    				flag=0;
    				return new ModelAndView("failure","fail",result1);
    			}
    		 
    		 
    		 
    	 }
    	
    	 	 
    	
     }
      
	
	
	@RequestMapping(value = "/viewPatient1", method = RequestMethod.POST)
	public ModelAndView viewpatientdetails(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result) {
		System.out.println(patientBean.getPatientID());
		Map<String,Object> model=new HashMap<String, Object>();
		PatientBean pb = new PatientBean();
		pb = patient.viewAilmentDetails(patientBean.getPatientID());
		
		
	     if(pb==null){
	    	 
	    	  String str = "Invalid Patient ID";
				System.out.println(str);	
				return new ModelAndView("viewpatientid","store",str);	
				
	     }
	     else{
		
		
		   model.put("patientBean",pb);
		return new ModelAndView("viewAliment",model);
	     }
	}
	
	@RequestMapping(value = "/list_of_doctorsMain", method = RequestMethod.GET)
	public ModelAndView viewdoctordetailsMain(@ModelAttribute("command") DoctorBean doctorBean,
	BindingResult result) {
	return new ModelAndView("list of doctors");
	}
	
	@RequestMapping(value = "/list_of_doctors", method = RequestMethod.GET)
	public ModelAndView viewdoctordetails(@ModelAttribute("command") DoctorBean doctorBean,
	BindingResult result) {
	return new ModelAndView("viewDocPat");
	}
	
	@RequestMapping(value = "/list_of_doctors1", method = RequestMethod.POST)
	public ModelAndView viewdoctordetails1(@ModelAttribute("command") DoctorBean doctorBean, 
	BindingResult result) {
	ArrayList<DoctorBean> l=new ArrayList<DoctorBean>();
	l=patient.viewListOfDoctors(doctorBean.getSpecialization(),doctorBean.getDateOfJoining());
	if(l.isEmpty())
		return new ModelAndView("fai","fail","No Doctors Present");

	Map<String, Object> map = new HashMap<String, Object>();
	map.put("doctors",l);
	return new ModelAndView("viewListOfDoctors",map);
	}
	
	@RequestMapping(value = "/list_of_doctors2", method = RequestMethod.GET)
	public ModelAndView viewdoctordetails2(@ModelAttribute("command") DoctorBean doctorBean,
	BindingResult result) {
	return new ModelAndView("listapptnspec");
	}
	
	@RequestMapping(value = "/list_of_doctors3", method = RequestMethod.POST)
	public ModelAndView viewdoctordetails3(@ModelAttribute("command") DoctorBean doctorBean, 
	BindingResult result) {
	ArrayList<DoctorBean> l=new ArrayList<DoctorBean>();
	l=patient.viewListOfDoctors2(doctorBean.getSpecialization());
	if(l.isEmpty())
		return new ModelAndView("fai","fail","No Doctors Present");
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("doctors",l);
	return new ModelAndView("viewListOfDoctors",map);
	}
	
	@RequestMapping(value = "/leave", method = RequestMethod.GET)
	public ModelAndView leave(@ModelAttribute("reg") LeaveBean leaveBean, 
			BindingResult result) {
		return new ModelAndView("applyLeave");
	}
	@RequestMapping(value = "/applyLeave", method = RequestMethod.POST)
	public ModelAndView applyLeave(@ModelAttribute("reg") @Valid LeaveBean leaveBean, 
			BindingResult result) {
		
		if(result.hasErrors()){
		System.out.println(result);
			return new ModelAndView("applyLeave");
		}
		
		String pattern = "dd-MMM-yy";
		   SimpleDateFormat format = new SimpleDateFormat(pattern);
		String ss1 = format.format(leaveBean.getLeaveFrom());
		String ss2 = format.format(leaveBean.getLeaveTo());
		Date date1 = null;
		Date date2 = null;
		try {
			date1 = new SimpleDateFormat("dd-MMM-yy").parse(ss1);
			date2 = new SimpleDateFormat("dd-MMM-yy").parse(ss2);
		} catch (ParseException e) {
		
			e.printStackTrace();
		}
		int days = Days.daysBetween(new DateTime(date1),new DateTime(date2)).getDays();
		
		if(days>15){
			
		  String str = "Maximum Leave Duration is 15 days";
			System.out.println(str);	
			return new ModelAndView("applyLeave","store",str);	
			
		}
		
		
		
		String resu=reporter.insertLeave(leaveBean);
		if(resu.equalsIgnoreCase("SUCCESS")){
			String str="Leave has been applied to Doctor with ID: "+leaveBean.getDoctorID();
			return new ModelAndView("success","res",str);
		}
		else{
			String str="There was an error!! Please try again after some time.";
			 return new ModelAndView("failure","fail",str);
		}
		
	}
	
	@RequestMapping(value = "/availDoctors", method = RequestMethod.GET)
	public ModelAndView availDocs(@ModelAttribute("reg") LeaveBean leaveBean, 
			BindingResult result) {
		return new ModelAndView("reqFreeDoc");
	}
	
	@RequestMapping(value = "/viewDoctors", method = RequestMethod.POST)
	public ModelAndView viewDocs(@ModelAttribute("reg") LeaveBean leaveBean, 
			BindingResult result) {
		ArrayList<DoctorBean> li=new ArrayList<DoctorBean>();
		System.out.println("in sckdsn c");
		
		li=reporter.viewAllAvailableDoctors(leaveBean.getLeaveFrom());
		
		if(li.isEmpty()){
			String str="    No Doctors present for this date   ";
			 return new ModelAndView("failure","fail",str);
		
		}
		else{
		return new ModelAndView("viewFreeDoc","DocsList",li);
		}
	}
	@RequestMapping(value = "/viewP", method = RequestMethod.GET)
	public ModelAndView ViewPatient(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result) {
				return new ModelAndView("viewpat");
	}
	
	
	@RequestMapping(value = "/viewapp", method = RequestMethod.POST)
	public ModelAndView Viewappdetails(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result) {
		System.out.println("is   "+patientBean.getAppointmentDate());
	AppointmentBean apbean = new AppointmentBean();
	apbean = patient.viewAppointmentDetails(patientBean.getPatientID(),patientBean.getAppointmentDate());
		
	Map<String, Object> map = new HashMap<String, Object>();
		map.put("beans",apbean);
		
				return new ModelAndView("viewappointment",map);
	}
	
	
	
	@RequestMapping(value = "/viewpatients", method = RequestMethod.POST)
	public ModelAndView ViewPatientsByDate(@ModelAttribute("command") PatientBean patientBean, 
			BindingResult result,HttpServletRequest request) {
		System.out.println(patientBean.getAppointmentDate());
		
		ArrayList<String> l=new ArrayList<String>();
	l = administrator.viewPatientsByDate(patientBean.getAppointmentDate());
		
		request.setAttribute("lis",l);
		
		if(l.isEmpty()){
			
			String str="No Patients Present for the Appointment date";
			 return new ModelAndView("fai","fail",str);
		
		}
		
				return new ModelAndView("viewpatientdetails");
	}
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public ModelAndView help() {
		
		
				return new ModelAndView("Help");
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(@ModelAttribute("regiss") ProfileBean profileBean, 
			BindingResult result) {
		System.out.println("kkk");
				return new ModelAndView("registerpage");
	}
	@RequestMapping(value = "/registeruser", method = RequestMethod.GET)
	public ModelAndView saveUser(@ModelAttribute("regiss") @Valid ProfileBean profileBean,
			BindingResult result) {
		System.out.println("hhhhhhhhhhhhhhhhhh");
		
		if(result.hasErrors()){
			System.out.println("im in");
			return new ModelAndView("registerpage");
		}
		
		
         if(!(profileBean.getPassword().equals(profileBean.getConfirm()))){
			
			String str = "word not matched";
			System.out.println(str);	
			return new ModelAndView("registerpage","store",str);
			
			
		}
		
		
		String result1=patient.addUserDetails(profileBean);
		System.out.println(result1);
		String str="Registered successfully with User ID: "+profileBean.getUserID();
		return new ModelAndView("success1","res",str);
	}
	
	@RequestMapping(value = "/forgetpassword", method = RequestMethod.GET)
	public ModelAndView forgetpassword1(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("changePassword");
	}
	
	@RequestMapping(value = "/forgetpassword1", method = RequestMethod.GET)
	public ModelAndView forgetpassword22(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("changePassword1");
	}
	
	@RequestMapping(value = "/forgetpassword2", method = RequestMethod.GET)
	public ModelAndView forgetpassword23(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("changePassword2");
	}
	
	@RequestMapping(value = "/forgetpassword3", method = RequestMethod.GET)
	public ModelAndView forgetpassword24(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("changePassword3");
	}
	
	@RequestMapping(value = "/changePassword1", method = RequestMethod.GET)
	public ModelAndView forgetpassword2(@ModelAttribute("command")@RequestParam("userID") String uid, @RequestParam("dob") Date dob,@RequestParam("street") String street,ProfileBean profileBean,HttpSession ss)  
			 {
		
//		System.out.println(uid);
//		System.out.println(dob);
//		System.out.println(street);
//		
		ss.setAttribute("uidd",uid);
		String result=patient.checkuser(uid,dob,street);
		
		if(!(result.equalsIgnoreCase("Success"))){
		
			
			
			return new ModelAndView("changePassword","store",result);
			
			
			
		}
		else{
         	return new ModelAndView("reset","user",uid);
         	
		}
	
	}
	
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView changepassword2(@ModelAttribute("command")CredentialsBean credBean, @RequestParam("newPassword") String newpass,@RequestParam("confirmPassword") String confpass,HttpSession ss)  
			 {
		
		if(newpass.contains(" ") ||confpass.contains(" ") ){
			
	         String ss1 = "Do not enter space";
			
			return new ModelAndView("reset","sss",ss1);
			
		}
		
		
		String uid2 = ss.getAttribute("uidd").toString();
		String result=patient.checkpass(uid2,newpass,confpass);
		if(result=="Success"){
         	return new ModelAndView("success_password");
         	
		}
		else
		return new ModelAndView("reset","store",result);
	}
	
	@RequestMapping(value = "/changePass1", method = RequestMethod.GET)
	public ModelAndView changepassword3(@ModelAttribute("command") @RequestParam("oldPassword") String oldpass, @RequestParam("newPassword") String newpass,@RequestParam("confirmPassword") String confpass
			,HttpSession s1)  
			 {
		
		
		if(oldpass.contains(" ") || newpass.contains(" ") ||confpass.contains(" ") ){
			
	         String ss1 = "Do not enter space";
			
			return new ModelAndView("changePassword1","sss",ss1);
			
		}
		
		if(!(newpass.equals(confpass))){
			
			String ss = "Password and confirm password do not match";
			
			return new ModelAndView("changePassword1","sss",ss);
			
		}
		
		String userid = s1.getAttribute("userID").toString();
		
		CredentialsBean bean =new CredentialsBean();
		bean.setUserID(userid);
		bean.setPassword(oldpass);
		
		
		String ress = user.changePassword(bean,newpass);
		
	
		if(ress=="SUCCESS"){
         	return new ModelAndView("success22","res","Password Changed Successfully");
         	
		}
		else{
			

			
			return new ModelAndView("changePassword1","sss",ress);
		}
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutEmployee(@ModelAttribute("hi") CredentialsBean credBean, 
			BindingResult result,HttpSession s1,HttpServletResponse rs) {
	
			String id=s1.getAttribute("userID").toString();
			System.out.println(id);
			user.logout(id);
			s1.invalidate();
			
//			System.out.println("1");
//			System.out.println("userID hello"+s1.getAttribute("userID").toString());
				return new ModelAndView("index123");
		
	
		
	}
	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public ModelAndView forgetpassword12(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("contactus");
	}
	@RequestMapping(value = "/ABOUT", method = RequestMethod.GET)
	public ModelAndView forgetpassword13(@ModelAttribute("command") ProfileBean profileBean, 
			BindingResult result) {
		
		return new ModelAndView("ABOUT");
	}
	
}
