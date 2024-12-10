package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Aadhar;
import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;
import com.klef.jfsd.sdp.repository.AadharRepository;
import com.klef.jfsd.sdp.repository.AppliedEventsRepository;
import com.klef.jfsd.sdp.repository.CitizenRepository;
import com.klef.jfsd.sdp.repository.EventRepository;
import com.klef.jfsd.sdp.repository.FeedBackRepository;
import com.klef.jfsd.sdp.repository.IssueRepository;


@Service
public class CitizenServiceImpl implements CitizenService
{
	@Autowired
	private CitizenRepository citizenRepository;
	
	@Autowired
	private AadharRepository aadharRepository;
	
	@Autowired
	private IssueRepository issueRepository;
	
	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private AppliedEventsRepository appliedeventsRepository;
	
	@Autowired
	private FeedBackRepository feedbackRepository;

	@Override
	public String CitizenRegistration(Citizen citi) {
		citizenRepository.save(citi);
		return "Citizen Registered Successfully";
	}

	@Override
	public Aadhar checkaadhar(String aadharno) {
		
		return aadharRepository.checkaadhar(aadharno);
	}

	@Override
	public void updateaadhar(Aadhar ad) {
		Aadhar a = aadharRepository.findById(ad.getAadharno()).get();
		
		a.setStatus("registered");
		
		aadharRepository.save(a);
		
	}

	@Override
	public Citizen checkcitilogin(String Aadhaarno, String pwd)
	{
		return citizenRepository.checkcitilogin(Aadhaarno, pwd);
	}

	@Override
	public List<Issue> viewallcitiissues(String adno)
	{
		return issueRepository.findByAdno(adno);
	}

	@Override
	public Citizen displayCitizenById(String cAadhaarno)
	{	
		return citizenRepository.findById(cAadhaarno).get();
	}

	@Override
	public String UpdateCitizenProfile(Citizen citi) 
	{
		Citizen c = citizenRepository.findById(citi.getAadhaarno()).get();
		
		c.setName(citi.getName());
		c.setAddress(citi.getAddress());
		c.setConstituency(citi.getConstituency());
		c.setGender(citi.getGender());
		c.setPassword(citi.getPassword());
		c.setPhno(citi.getPhno());
		
		citizenRepository.save(c);
		
		return "Citizen Updated Successfully";
	}

	@Override
	public List<Event> displayevent(String constituency)
	{
		return eventRepository.findByConstituency(constituency);
	}

	@Override
	public List<AppliedEvents> applied(String Aadhaarno) 
	{
		return appliedeventsRepository.findByAadhaarno(Aadhaarno);
	}

	@Override
	public long issuecount() 
	{
		return issueRepository.count();
	}

	@Override
	public long eventcount() 
	{
		return eventRepository.count();
	}
	
	@Override
	public long feedbackcount() 
	{
		return feedbackRepository.count();
	}
	
	@Override
	public long appliedeventcount()
	{
		return appliedeventsRepository.count();
	}
	
	@Override
	public String AddAppliedEvent(AppliedEvents a)
	{
		appliedeventsRepository.save(a);
		return "Applied Successfully";
	}
	
	@Override
	public String submitfd(FeedBack feedback) 
	{
		feedbackRepository.save(feedback);
		return "Feedback Submitted Successfully";
	}
	
	@Override
	public String ReportIssue(Issue issue) {
		issueRepository.save(issue);
		return "Issue Submitted Successfully";
	}
	
	@Override
    public boolean changePassword(String Aadhaarno, String oldPassword, String newPassword) {
        // Validate Aadhaar number and old password
        Citizen citizen = citizenRepository.checkcitilogin(Aadhaarno, oldPassword);

        if (citizen == null) {
            return false; // Invalid Aadhaar number or password
        }

        // Update the password
        int rowsUpdated = citizenRepository.updatePassword(Aadhaarno, newPassword);
        return rowsUpdated > 0;
    }
	
	}
