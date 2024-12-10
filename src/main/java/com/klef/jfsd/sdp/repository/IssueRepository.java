package com.klef.jfsd.sdp.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Issue;

import jakarta.transaction.Transactional;

@Repository
public interface IssueRepository extends JpaRepository<Issue, Integer>
{
	public  List<Issue> findByConstituency(String constituency);
	
	@Modifying
	@Transactional
	@Query("update Issue i set i.solution=?1 where i.rid=?2")
	public int updateissue(String solution,int rid);
	
	public List<Issue> findByAdno(String adno);
	

}
