package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Politician;
import com.klef.jfsd.sdp.repository.AdminRepository;
import com.klef.jfsd.sdp.repository.CitizenRepository;
import com.klef.jfsd.sdp.repository.FeedBackRepository;
import com.klef.jfsd.sdp.repository.IssueRepository;
import com.klef.jfsd.sdp.repository.PoliticianRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private PoliticianRepository politicianRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private CitizenRepository citizenRepository;
	
	@Autowired
	private IssueRepository issueRepository;
	
	@Autowired
	private FeedBackRepository feedbackRepository;

	@Override
	public String PoliticanRegistration(Politician p)
	{
		politicianRepository.save(p);
		return "Politician Registered Successfully";
		
	}

	@Override
	public List<Politician> viewallpoliticians() 
	{
		return politicianRepository.findAll();
		
	}

	

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<Citizen> viewAllCitizens()
	{
		return (List<Citizen>) citizenRepository.findAll();
	}

	@Override
	public Citizen ViewCitizenByAadhar(String citiaadhaar)
	{
		return citizenRepository.findById(citiaadhaar).get();
	}

	@Override
	public long citicount()
	{
		return citizenRepository.count();
	}

	@Override
	public long policount()
	{
		return politicianRepository.count();
	}

	@Override
	public long issuecount() 
	{
		return issueRepository.count();
	}

	@Override
	public long solvecount() 
	{
		return feedbackRepository.count();
	}
	

}
