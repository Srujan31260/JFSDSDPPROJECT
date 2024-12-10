package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Aadhar;
import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;

public interface CitizenService
{
	public Aadhar checkaadhar(String aadharno);
	public void updateaadhar(Aadhar ad);
	public String CitizenRegistration(Citizen citi);
	public Citizen checkcitilogin(String Aadhaarno,String pwd);
	public List<Issue> viewallcitiissues(String adno);
	public Citizen displayCitizenById(String cAadhaarno);
	public String UpdateCitizenProfile(Citizen citi);
	public List<Event> displayevent(String constituency);
	public List<AppliedEvents> applied(String Aadhaarno);
	public String AddAppliedEvent(AppliedEvents a);
	public String submitfd(FeedBack feedback);
	public String ReportIssue(Issue issue);
	public long issuecount();
	public long eventcount();
	public long feedbackcount();
	public long appliedeventcount();
	boolean changePassword(String Aadhaarno, String oldPassword, String newPassword);
}