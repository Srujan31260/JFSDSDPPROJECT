package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.AppliedEvents;



@Repository
public interface AppliedEventsRepository extends JpaRepository<AppliedEvents, Integer>
{
	@Query("select e from AppliedEvents e where e.Aadhaarno=?1")
	public List<AppliedEvents> findByAadhaarno(String aadhaarno);
	public List<AppliedEvents> findByConstituency(String constituency);
}
