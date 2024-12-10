package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.AppliedEvents;
import com.klef.jfsd.sdp.model.Event;
import com.klef.jfsd.sdp.model.FeedBack;
import com.klef.jfsd.sdp.model.Issue;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.repository.AppliedEventsRepository;
import com.klef.jfsd.sdp.repository.EventRepository;
import com.klef.jfsd.sdp.repository.FeedBackRepository;
import com.klef.jfsd.sdp.repository.IssueRepository;
import com.klef.jfsd.sdp.repository.PoliticianRepository;

@Service
public class PoliticianServiceImpl implements PoliticianService
{
	@Autowired
	private PoliticianRepository politicianRepository;
	
	@Autowired
	private IssueRepository issueRepository;
	
	@Autowired
	private FeedBackRepository feedbackRepository;
	
	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private AppliedEventsRepository appliedeventsRepository;

	@Override
	public Politician checkpolilogin(String email, String password) {
		
		return politicianRepository.checkpolilogin(email, password);
	}

	@Override
	public Politician displayPoliticianById(int pid) 
	{
		return politicianRepository.findById(pid).get();
	}

	@Override
	public String UpdatePoliticianProfile(Politician poli) 
	{
		Politician p = politicianRepository.findById(poli.getId()).get();
		
		p.setName(poli.getName());
		p.setGender(poli.getGender());
		p.setConstituency(poli.getConstituency());
		p.setContact(poli.getContact());
		p.setDateofbirth(poli.getDateofbirth());
		p.setEducation(poli.getEducation());
		p.setParty(poli.getParty());
		p.setPreviousposition(poli.getPreviousposition());
		p.setPresentposition(poli.getPresentposition());
		p.setState(poli.getState());
		p.setPassword(poli.getPassword());
		
		politicianRepository.save(p);
		
		return "Politician Updated Successfully";
		
	}
	
	@Override
	public String updateissue(String solution,int rid) {
		
		issueRepository.updateissue(solution, rid);
		return "Solution Updated Successfully";
	}


	@Override
	public List<Issue> displayissue(String constituency) {
		
		return issueRepository.findByConstituency(constituency);
	}


	@Override
	public Issue findissue(int rid) {
		return issueRepository.findById(rid).get();
	}


	@Override
	public List<FeedBack> displayfeedback(String constituency) 
	{
		return feedbackRepository.findByConstituency(constituency);
	}

	@Override
	public List<AppliedEvents> displayapplied(String constituency) 
	{
		return appliedeventsRepository.findByConstituency(constituency);
	}

	@Override
	public List<Event> viewallevents(String constituency) 
	{
		return eventRepository.findByConstituency(constituency);
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
	public String AddEvent(Event e)
	{
		eventRepository.save(e);
		return "Event Added Successfully";
	}



	



}
