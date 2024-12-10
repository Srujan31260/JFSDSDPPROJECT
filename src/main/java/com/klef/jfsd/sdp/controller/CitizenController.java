package com.klef.jfsd.sdp.controller;

import java.io.File;
import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Aadhar;
import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;
import com.klef.jfsd.sdp.model.Politician;

import com.klef.jfsd.sdp.service.CitizenService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CitizenController
{
	@Autowired
	private CitizenService citizenService;
	
	
		
	@GetMapping("citireg")
	public ModelAndView citireg()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("citireg");
		return mv;
	}
	
	@PostMapping("insertciti")
	public ModelAndView insertciti(HttpServletRequest request, @RequestParam("citiimage") MultipartFile file) throws Exception
	{
		String Aadharno = request.getParameter("cnum");
		String name = request.getParameter("cname");
		String gender = request.getParameter("cgender");
		String address = request.getParameter("caddress");
		String constituency = request.getParameter("cconstituency");
		String email = request.getParameter("cemail");
		String password = request.getParameter("cpwd");
		String phno = request.getParameter("cphno");
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		
		Citizen citi=new Citizen();
		citi.setAadhaarno(Aadharno);
		citi.setName(name);
		citi.setGender(gender);
		citi.setAddress(address);
		citi.setConstituency(constituency);
		citi.setEmail(email);
		citi.setPassword(password);
		citi.setPhno(phno);
		citi.setImage(blob);
		
		ModelAndView mv = new ModelAndView();
		
		Aadhar ad = citizenService.checkaadhar(Aadharno);
		
		
		if(ad==null) {
			mv.addObject("message", "Aadhar Nummber is Invalid");
			mv.setViewName("citireg");
		}
		else if(ad.getStatus().equals("registered"))
		{
			mv.addObject("message", "Aadhar Nummber is already exists");
			mv.setViewName("citireg");
		}
		
		else
		{
			String msg = citizenService.CitizenRegistration(citi);
			citizenService.updateaadhar(ad);
			mv.addObject("message", msg);
			mv.setViewName("regsuccess");
		}
		
		return mv;
		
	}
	
	@GetMapping("citilogin")
	public ModelAndView citilogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("citilogin");
		return mv;
	}
	
	@PostMapping("checkcitilogin")
	public ModelAndView checkcitilogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String caadhaar = request.getParameter("caadhar");
		String cpwd = request.getParameter("cpwd");
		
		Citizen citi = citizenService.checkcitilogin(caadhaar, cpwd);
		if(citi!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("citi", citi);
			mv.setViewName("citihome");
		}
		else
		{
			mv.setViewName("citilogin");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	
	@GetMapping("citihome")
	public ModelAndView citihome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("citihome");
		
		long count1 = citizenService.issuecount();
		mv.addObject("count1", count1);
		
		long count2 = citizenService.eventcount();
		mv.addObject("count2", count2);
		
		long count3 = citizenService.appliedeventcount();
		mv.addObject("count3", count3);
		
		long count4 = citizenService.appliedeventcount();
		mv.addObject("count4", count4);
		return mv;
	}
	
	@GetMapping("citiissue")
    public ModelAndView citiissue()
    {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("citiissue");
    	return mv;
    }
    
    @PostMapping("submitissue")
    public ModelAndView submitissue(HttpServletRequest request)
    {
    	String adno= request.getParameter("adno");
    	String name=request.getParameter("name");
    	String constituency=request.getParameter("constituency");
    	String address=request.getParameter("address");
    	String problem=request.getParameter("problem");
    	String solution=request.getParameter("solution");
    	
    	Issue iss=new Issue();
    	iss.setAdno(adno);
    	iss.setName(name);
    	iss.setConstituency(constituency);
    	iss.setAddress(address);
    	iss.setProblem(problem);
    	iss.setSolution("");
    	
    	String msg= citizenService.ReportIssue(iss);
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("citiupdatesuccess");
    	return mv;
    }
    
    @GetMapping("citisessionexpiry")
    public ModelAndView citisessionexpiry()
    {
    	ModelAndView mv = new ModelAndView("citisessionexpiry");
    	return mv;
    }
    
    @GetMapping("citilogout")
	  public ModelAndView polilogout(HttpServletRequest request)
	  {
		HttpSession session=request.getSession();
		session.removeAttribute("citi");
		
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("citilogin");
	    return mv;
	  }
    
    @GetMapping("viewallissues")
    public ModelAndView viewallissues(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        
        Citizen citi = (Citizen) session.getAttribute("citi");
        String adno = citi.getAadhaarno();
        List<Issue> issulist = citizenService.viewallcitiissues(adno);
        mv.addObject("issulist", issulist);
        mv.setViewName("viewallissues");
        return mv;
    }

    @GetMapping("citifeedback")
    public ModelAndView citifeedback()
    {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("citifeedback");
    	return mv;
    }
    @PostMapping("submitfdback")
    public ModelAndView submitfdback(HttpServletRequest request)
    {
    	String name = request.getParameter("name");
    	String constituency = request.getParameter("constituency");
    	String problem = request.getParameter("problem");
    	String action = request.getParameter("action");
    	String rating = request.getParameter("rating");
    	String comment = request.getParameter("comment");
    	
    	FeedBack fb = new FeedBack();
    	fb.setName(name);
    	fb.setConstituency(constituency);
    	fb.setProblem(problem);
    	fb.setAction(action);
    	fb.setRating(rating);
    	fb.setComment(comment);
    	
    	String msg = citizenService.submitfd(fb);
    	ModelAndView mv = new ModelAndView();
//    	mv.addObject("msg","Submitted Successfully");
    	mv.setViewName("feedbacksuccess");
    	return mv;
    }
    
    @GetMapping("citiprofile")
    public ModelAndView citiprofile()
    {
    	ModelAndView mv = new ModelAndView("citiprofile");
    	return mv;
    }
    
    @GetMapping("updateciti")
    public ModelAndView updateciti()
    {
    	ModelAndView mv = new ModelAndView("updateciti");
    	return mv;
    }
    
    @PostMapping("updatecitiprofile")
    public ModelAndView updatecitiprofile(HttpServletRequest request)
    {
    	ModelAndView mv = new ModelAndView();
    	try
    	{
    		String Aadhaarno = request.getParameter("cAadhaarno");
    		String name = request.getParameter("cname");
    	    String address = request.getParameter("caddress");
    	    String constituency = request.getParameter("cconstituency");
            String gender = request.getParameter("cgender");
   	        String password = request.getParameter("cpwd");
   	        String phone = request.getParameter("cphno");
		        
		    Citizen citi = new Citizen();
		    citi.setAadhaarno(Aadhaarno);
		    citi.setName(name);
		    citi.setAddress(address);
		    citi.setConstituency(constituency);
		    citi.setGender(gender);
		    citi.setPassword(password);
		    citi.setPhno(phone);
		    
		    String msg = citizenService.UpdateCitizenProfile(citi);
		    
		    Citizen c = citizenService.displayCitizenById(Aadhaarno);
		    
		    HttpSession session = request.getSession();
		    session.setAttribute("citi", c);
		     mv.setViewName("updatecitisuccess");
		     mv.addObject("message", msg);
    	}
    	catch(Exception e)
    	{
    		mv.setViewName("updateerror");
    		mv.addObject("message", e);
    	}
    	return mv;
    }
    
    
    @GetMapping("viewevents")
	 public ModelAndView viewevents(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     HttpSession session = request.getSession();
	     Citizen citi = (Citizen) session.getAttribute("citi");
	     List<Event> eventlist = citizenService.displayevent(citi.getConstituency());
	     mv.addObject("eventlist", eventlist);
	     mv.setViewName("viewevents");
	     return mv;
	 }
    
   
    @PostMapping("applyevent")
    public ModelAndView applyevents(HttpServletRequest request) {
        String Aadhaarno = request.getParameter("aAadhaarno");
        String name = request.getParameter("aname");
        String constituency = request.getParameter("aconstituency");
        int eid = Integer.parseInt(request.getParameter("aeid"));
        String title = request.getParameter("atitle");

        AppliedEvents ae = new AppliedEvents();
        ae.setAadhaarno(Aadhaarno);
        ae.setName(name);
        ae.setConstituency(constituency);
        ae.setEid(eid);
        ae.setTitle(title);

        ModelAndView mv = new ModelAndView();
        List<AppliedEvents> event = citizenService.applied(Aadhaarno);

      
            citizenService.AddAppliedEvent(ae);
            mv.setViewName("viewevents");
            mv.addObject("message", "Applied Successfully");

        List<Event> eventlist = citizenService.displayevent(constituency);
        mv.addObject("eventlist", eventlist);
        return mv;
    }
    
    @PostMapping("changePassword")
    public ModelAndView changePassword(
            @RequestParam String Aadhaarno,
            @RequestParam String oldPassword,
            @RequestParam String newPassword) {

        ModelAndView modelAndView = new ModelAndView();

        boolean isUpdated = citizenService.changePassword(Aadhaarno, oldPassword, newPassword);

        if (isUpdated) {
            modelAndView.addObject("message", "Password changed successfully!");
            modelAndView.setViewName("successpage"); // Redirect to a success page
        } else {
            modelAndView.addObject("error", "Invalid Aadhaar number or password.");
            modelAndView.setViewName("changepassword"); // Redirect to the form again
        }

        return modelAndView;
    }
    
    @GetMapping("/changePassword")
    public ModelAndView showChangePasswordForm() {
        return new ModelAndView("changePassword");
    }
	

}
