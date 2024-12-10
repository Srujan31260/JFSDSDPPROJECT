package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Citizen;
import com.klef.jfsd.sdp.model.Politician;

public interface AdminService 
{
	public String PoliticanRegistration(Politician p);
	public List<Politician> viewallpoliticians();
	public Admin checkadminlogin(String uname,String pwd);
	public List<Citizen> viewAllCitizens();
	public Citizen ViewCitizenByAadhar(String citiaadhaar);
	public long citicount();
	public long policount();
	public long issuecount();
	public long solvecount();
}
