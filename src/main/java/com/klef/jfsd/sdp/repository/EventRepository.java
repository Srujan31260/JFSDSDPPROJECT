package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Event;
@Repository
public interface EventRepository extends JpaRepository<Event, Integer>
{
	public List<Event> findByConstituency(String constituency);
}
