package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Politician;

@Repository
public interface PoliticianRepository extends JpaRepository<Politician, Integer>
{
	@Query("select p from Politician p where p.email=?1 and p.password=?2 ")
	public Politician checkpolilogin(String email,String password);
}
