package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="politician_table")
public class Politician 
{
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="pol_id")
	private int id;
	@Column(name="pol_name",nullable=false,length=50)
	private String name;
	@Column(name="pol_gender",nullable=false,length=20)
	private String gender;
	@Column(name="pol_email",nullable=false,unique=true,length=50)
	private String email;
	@Column(name="pol_constituency",nullable=false,length=50)
	private String constituency;
	@Column(name="pol_contact",nullable=false,unique=true,length=11)
	private String contact;
	@Column(name="pol_dob",nullable=false,length=20)
	private String dateofbirth;
	@Column(name="pol_education",nullable=false,length=20)
	private String education;
	@Column(name="pol_party",nullable=false,length=20)
	private String party;
	@Column(name="pol_prevposition",nullable=false,length=20)
	private String previousposition;
	@Column(name="pol_presposition",nullable=false,length=20)
	private String presentposition;
	@Column(name="pol_state",nullable=false,length=20)
	private String state;
	@Column(name="pol_password",nullable=false,length=10)
	private String password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getConstituency() {
		return constituency;
	}
	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getPreviousposition() {
		return previousposition;
	}
	public void setPreviousposition(String previousposition) {
		this.previousposition = previousposition;
	}
	public String getPresentposition() {
		return presentposition;
	}
	public void setPresentposition(String presentposition) {
		this.presentposition = presentposition;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
