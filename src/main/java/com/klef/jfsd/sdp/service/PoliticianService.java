package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;
import com.klef.jfsd.sdp.model.Politician;

public interface PoliticianService 
{
	public Politician checkpolilogin(String email,String password);
	public Politician displayPoliticianById(int pid);
	public String UpdatePoliticianProfile(Politician poli);
	public List<Issue> displayissue(String constituency);
	public Issue findissue(int rid);
	public String updateissue(String solution,int rid);
	public List<FeedBack> displayfeedback(String constituency);
	public List<AppliedEvents> displayapplied(String constituency);
	public List<Event> viewallevents(String constituency);
	public String AddEvent(Event e);
	public long issuecount();
	public long eventcount();
	public long feedbackcount();
	public long appliedeventcount();
}
