package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	
	 @GetMapping("adminlogin")
     public ModelAndView adminlogin()
     {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("adminlogin");
       return mv;
     }
	 
	 @GetMapping("adminhome")
	 public ModelAndView adminhome()
	 {
		 ModelAndView mv = new ModelAndView("adminhome");
		 
		 long count1 = adminService.citicount();
		 mv.addObject("count1", count1);
		 
		 long count2 = adminService.policount();
		 mv.addObject("count2", count2);
		 
		 long count3 = adminService.issuecount();
		 mv.addObject("count3", count3);
		 
		 long count4 = adminService.solvecount();
		 mv.addObject("count4", count4);
		 return mv;
		 
		 
	 }
	 
	 @PostMapping("checkadminlogin")
	 public ModelAndView checkadminlogin(HttpServletRequest request)
	 {
	  	ModelAndView mv = new ModelAndView();
	  	 
	  	 String auname = request.getParameter("auname");
	  	 String apwd = request.getParameter("apwd");
	  	 
	  	Admin admin = adminService.checkadminlogin(auname, apwd);
	  	
	  	if(admin!=null)
	  	{
	  		HttpSession session = request.getSession();
	  		session.setAttribute("admin", admin);
	  		mv.setViewName("adminhome");
		
		   long count1 = adminService.citicount();
           mv.addObject("count1", count1);
		 
	      long count2 = adminService.policount();
	      mv.addObject("count2", count2);
	      
	      long count3 = adminService.issuecount();
			 mv.addObject("count3", count3);
			 
			 long count4 = adminService.solvecount();
			 mv.addObject("count4", count4);
			 
	  	}
	  	else
	  	{
	  		mv.setViewName("adminloginfail");
	  		mv.addObject("message", "Login Failed");
	  	}
	  	return mv;
	   }

	 
	 @GetMapping("polireg")
	 public ModelAndView polireg() 
	 {
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("polireg");
		 return mv;
		 
	 }
	 
	 @PostMapping("insertpoli")
	 public ModelAndView insertpoli(HttpServletRequest request)
	 {
		 String name=request.getParameter("name");
		 String gender=request.getParameter("gender");
		 String dob=request.getParameter("dateofbirth");
		 String email=request.getParameter("email");
		 String constituency=request.getParameter("constituency");
		 String contact=request.getParameter("contact");
		 String education=request.getParameter("education");
		 String party=request.getParameter("party");
		 String previousposition=request.getParameter("previousposition");
		 String presentposition=request.getParameter("presentposition");
		 String state=request.getParameter("state");
		 String password=request.getParameter("password");
		 
		 Politician p=new Politician();
		 p.setName(name);
		 p.setGender(gender);
		 p.setEmail(email);
		 p.setDateofbirth(dob);
		 p.setEducation(education);
		 p.setConstituency(constituency);
		 p.setContact(contact);
		 p.setParty(party);
		 p.setPreviousposition(previousposition);
		 p.setPresentposition(presentposition);
		 p.setState(state);
		 p.setPassword(password);
		 String msg = adminService.PoliticanRegistration(p);
	        
	        ModelAndView mv = new ModelAndView("regsuccess");
	        mv.addObject("message", msg);
	      
	        return mv;
		 
	 }
	 
	 @GetMapping("viewallpoli")
	 public ModelAndView viewallpoli()
	 {
		 ModelAndView mv = new ModelAndView();
		 List<Politician> polilist=adminService.viewallpoliticians();
		 mv.setViewName("viewallpoli");
		 mv.addObject("polilist", polilist);
		 return mv;
	 }
	 @GetMapping("viewallciti")
		public ModelAndView viewallciti()
		{
			List<Citizen> citizenlist = adminService.viewAllCitizens();
			ModelAndView mv = new ModelAndView("viewallciti");
			mv.addObject("citizenlist", citizenlist);
			return mv;
		}
	 
	 @GetMapping("displaycitizenimage")
		public ResponseEntity<byte[]> displaycitizenimage(@RequestParam("Aadhaarno") String Aadhaarno) throws Exception
		{
			Citizen citi = adminService.ViewCitizenByAadhar(Aadhaarno);
			byte[] imageBytes =null;
			imageBytes = citi.getImage().getBytes(1, (int) citi.getImage().length());
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
		}
	
	 @GetMapping("adminlogout")
	 public ModelAndView adminlogout(HttpServletRequest request)
	 {
		 HttpSession session = request.getSession();
		 session.removeAttribute("admin");
		 
		 ModelAndView mv = new ModelAndView("adminlogin");
		 return mv;
	 }
	 
	 @GetMapping("adminsessionexpiry")
	 public ModelAndView adminsessionexpiry()
	 {
		 ModelAndView mv = new ModelAndView("adminsessionexpiry");
		 return mv;
	 }
	 
	 

}
