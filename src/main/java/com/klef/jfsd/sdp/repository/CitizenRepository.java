package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Citizen;

import jakarta.transaction.Transactional;

@Repository
public interface CitizenRepository extends JpaRepository<Citizen, String>
{
	@Query("select c from Citizen c where c.Aadhaarno=?1 and c.password=?2")
	public Citizen checkcitilogin(String Aadhaarno,String pwd);
	
	@Modifying
    @Transactional
    @Query("update Citizen c set c.password = ?2 where c.Aadhaarno = ?1")
    int updatePassword(String Aadhaarno, String newPassword);
	
}
