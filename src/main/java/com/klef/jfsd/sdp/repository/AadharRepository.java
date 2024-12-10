package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Aadhar;


@Repository
public interface AadharRepository extends JpaRepository<Aadhar, String>
{
	@Query("select a from Aadhar a where a.aadharno=?1")
	public Aadhar checkaadhar(String aadharno );
}
