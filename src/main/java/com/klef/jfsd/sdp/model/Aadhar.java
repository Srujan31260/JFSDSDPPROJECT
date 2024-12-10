package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="aadhar_table")
public class Aadhar
{
	@Id
	@Column(name="aadhar_number",length=20)
	private String aadharno;
	@Column(name="status", nullable=false, length=30)
	private String status;
	public String getAadharno() {
		return aadharno;
	}
	public void setAadharno(String aadharno) {
		this.aadharno = aadharno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Aadhar [aadharno=" + aadharno + ", status=" + status + "]";
	}

}

