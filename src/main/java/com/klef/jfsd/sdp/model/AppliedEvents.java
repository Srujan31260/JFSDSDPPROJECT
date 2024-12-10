package com.klef.jfsd.sdp.model;

import java.sql.Date;

import javax.xml.crypto.Data;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="appliedevents_table")
public class AppliedEvents 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ae_id")
	private int id;
	@Column(name="ae_aadhaarno",nullable = false,length=30)
	private String Aadhaarno;
	@Column(name="ae_name",nullable = false,length=30)
	private String name;
	@Column(name="ae_constituency",nullable = false,length=30)
	private String constituency;
	@Column(name="ae_eid")
	private int eid;
	@Column(name="ae_title",nullable = false,length=30)
	private String title;
	@CreationTimestamp
	private Date appliedtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getConstituency() {
		return constituency;
	}
	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}
	public Date getAppliedtime() {
		return appliedtime;
	}
	public void setAppliedtime(Date appliedtime) {
		this.appliedtime = appliedtime;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
