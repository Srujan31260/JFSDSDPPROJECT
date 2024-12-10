package com.klef.jfsd.sdp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="citizen_table")
public class Citizen 
{
	@Id
	@Column(name="citi_adno")
	private String Aadhaarno;
	@Column(name="citi_name",nullable = false,length=50)
	private String name;
	@Column(name="citi_gender",nullable = false,length=20)
	private String gender;
	@Column(name="citi_address",nullable = false,length=50)
	private String address;
	@Column(name="citi_phno",unique = true, nullable = false,length=20)
	private String phno;
	@Column(name="citi_constituency",nullable = false,length=20)
	private String constituency;
	@Column(name="citi_email",unique = true,nullable = false,length=50)
	private String email;
	@Column(name="citi_password",nullable = false,length=20)
	private String password;
	@Column(name="citi_image", nullable=false)
	private Blob image;
	public String getAadhaarno() {
		return Aadhaarno;
	}
	public void setAadhaarno(String aadhaarno) {
		Aadhaarno = aadhaarno;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getConstituency() {
		return constituency;
	}
	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	
	

}
