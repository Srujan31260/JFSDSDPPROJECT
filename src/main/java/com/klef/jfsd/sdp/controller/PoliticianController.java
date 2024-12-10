package com.klef.jfsd.sdp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.PoliticianService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class PoliticianController 
{
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private PoliticianService politicianService;
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("polilogin")
	public ModelAndView polilogin()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("polilogin");
		return mv;
	}
	
	 @PostMapping("checkpolilogin")
	  public ModelAndView checkpolilogin(HttpServletRequest request)
	  {
	    ModelAndView mv = new ModelAndView();
	    
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    Politician p =  politicianService.checkpolilogin(email, password);
	   
	    
	    if(p!=null)
	    {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("politician",p);
	        mv.setViewName("polihome");
	    }
	    else
	    {
	      mv.setViewName("polilogin");
	      mv.addObject("message", "Login Failed");
	    } 
	      return mv;
	  }
	 
	 @GetMapping("polihome")
	 public ModelAndView polihome()
	 {
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("polihome");
		 
		 long count = politicianService.issuecount();
		 mv.addObject("count",count);
		 
		 long count2 = politicianService.eventcount();
		 mv.addObject("count2", count2);
		 
		 long count3 = politicianService.feedbackcount();
		 mv.addObject("count3", count3);
		 
		 long count4 = politicianService.appliedeventcount();
		 mv.addObject("count4", count4);
		 
		 
		 return mv;
	 }
	 
	 @GetMapping("poliprofile")
	 public ModelAndView poliprofile()
	 {
		 ModelAndView mv = new ModelAndView("poliprofile");
		 return mv;
	 }
	 
	 @GetMapping("polilogout")
	 public ModelAndView polilogout(HttpServletRequest request)
	 {
		 HttpSession session = request.getSession();
		   
		 session.removeAttribute("politician");
		 ModelAndView mv = new ModelAndView("polilogin");
		 return mv;
	 }
	 
	 @GetMapping("updatepoli")
	 public ModelAndView updatepoli()
	 {
		 ModelAndView mv = new ModelAndView("updatepoli");
		 return mv;
	 }
	
	 @PostMapping("updatepoliprofile")
	 public ModelAndView updatePoliProfile(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     
	     try {
	         int id = Integer.parseInt(request.getParameter("pid"));
	         String name = request.getParameter("pname");
	         String gender = request.getParameter("pgender");
	         String constituency = request.getParameter("pconstituency");
	         String contact = request.getParameter("pcontact");
	         String dob = request.getParameter("pdob");
	         String education = request.getParameter("peducation");
	         String party = request.getParameter("pparty");
	         String previousPosition = request.getParameter("ppreviousposition");
	         String presentPosition = request.getParameter("ppresentposition");
	         String state = request.getParameter("pstate");
	         String password = request.getParameter("ppassword");

	         Politician poli = new Politician();
	         poli.setId(id);
	         poli.setName(name);
	         poli.setGender(gender);
	         poli.setConstituency(constituency);
	         poli.setContact(contact);
	         poli.setDateofbirth(dob);
	         poli.setEducation(education);
	         poli.setParty(party);
	         poli.setPreviousposition(previousPosition);
	         poli.setPresentposition(presentPosition);
	         poli.setState(state);
	         poli.setPassword(password);

	      
	         String msg = politicianService.UpdatePoliticianProfile(poli);

	        
	         Politician p = politicianService.displayPoliticianById(id);

	      
	         HttpSession session = request.getSession();
	         session.setAttribute("politician", p);

	         mv.setViewName("updatesuccess");
	         mv.addObject("message", msg);
	         
	     } catch (Exception e) {
	         mv.setViewName("updateerror");
	         mv.addObject("message", e.getMessage());
	     }
	     return mv;
	 }
	 
	 @GetMapping("polisessionexpiry")
	 public ModelAndView polisessionexpiry()
	 {
		 ModelAndView mv = new ModelAndView("polisessionexpiry");
		 return mv;
	 }
	 
	 @GetMapping("viewcitizenissuebycons")
	 public ModelAndView viewcitizenissuebycons(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     HttpSession session = request.getSession();
	     Politician poli = (Politician) session.getAttribute("politician");

			/*
			 * // Check if Politician is null if (poli == null) { // Log the error for
			 * debugging System.out.println("Politician is null in session.");
			 * 
			 * // Redirect to an error page or login page with a message
			 * mv.setViewName("error"); // Assuming you have an error.html page
			 * mv.addObject("message", "Session expired or user not logged in."); return mv;
			 * }
			 */

	     // If politician is not null, proceed to fetch issues
	     List<Issue> issulist = politicianService.displayissue(poli.getConstituency());
	     mv.addObject("issulist", issulist);
	     mv.setViewName("viewcitizenissue");
	     return mv;
	 }

	 @GetMapping("updateissue")
	 public ModelAndView updateissue(@RequestParam("id") int rid)
	 {
		 ModelAndView mv=new ModelAndView();
		 Issue issue = politicianService.findissue(rid);
		 mv.addObject("issue", issue);
		 mv.setViewName("updateissue");
		 return mv;
	 }
	 
	 @PostMapping("submitsolution")
	 public ModelAndView submitsolution(HttpServletRequest request)
	 {
		 String solution = request.getParameter("solution");
		 int rid = Integer.parseInt(request.getParameter("rid"));
		 Issue issue = new Issue();
		 issue.setSolution(solution);
		 
		 String msg = politicianService.updateissue(solution, rid);
		 ModelAndView mv = new ModelAndView();
		 Issue iss = politicianService.findissue(rid);
		 mv.addObject("issue", iss);
		 mv.addObject("msg","Updated Successfully");
		 mv.setViewName("updateissue");
		 return mv;
	 }
	 
	 @GetMapping("viewallfeedbacks")
	 public ModelAndView viewallfeedbacks(HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     HttpSession session = request.getSession();
	     Politician poli = (Politician) session.getAttribute("politician");
	     
	     if (poli == null) {
	         // Redirect to session expiry or login page
	         mv.setViewName("polisessionexpiry");
	         mv.addObject("message", "Session expired. Please log in again.");
	         return mv;
	     }
	     
	     // Proceed if the Politician object is not null
	     List<FeedBack> fblist = politicianService.displayfeedback(poli.getConstituency());
	     mv.setViewName("viewallfeedbacks");
	     mv.addObject("fblist", fblist);
	     return mv;
	 }

	 
	 @GetMapping("addevent")
	 public ModelAndView addevent()
	 {
		 ModelAndView mv = new ModelAndView("addevent");
		 return mv;
	 }
	 
	 @PostMapping("insertevent")
	 public ModelAndView insertevent(HttpServletRequest request)
	 {
		 String title = request.getParameter("etitle");
		 String description = request.getParameter("edescription");
		 String constituency = request.getParameter("econstituency");
		 String location = request.getParameter("elocation");
		 String date = request.getParameter("edate");
		 
		 Event e = new Event();
		 e.setTitle(title);
		 e.setDescription(description);
		 e.setConstituency(constituency);
		 e.setLocation(location);
		 e.setDate(date);
		 
		 String msg = politicianService.AddEvent(e);
		 
		 ModelAndView mv = new ModelAndView("eventaddsuccess");
		 mv.addObject("message", msg);
		 
		 return mv;
	 }
	 
	 @GetMapping("viewallevents")
	 public ModelAndView viewallevents(HttpServletRequest request)
	 {
		 ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
		 Politician poli = (Politician) session.getAttribute("politician");
		 List<Event> eventlist = politicianService.viewallevents(poli.getConstituency());
		 mv.setViewName("viewallevents");
		 mv.addObject("eventlist", eventlist);
		 
		 return mv;
		 
	 }
	 
	 @GetMapping("viewallappliedevents")
	 public ModelAndView viewallappliedevents(HttpServletRequest request)
	 {
		 ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
		 Politician poli = (Politician) session.getAttribute("politician");
		 List<AppliedEvents> eventlist = politicianService.displayapplied(poli.getConstituency());
		 mv.setViewName("viewallappliedevents");
		 mv.addObject("eventlist", eventlist);
		 
		 return mv;
		 
	 }

	 
	
}
