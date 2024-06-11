package com.klu.TaskManagement.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.TaskManagement.model.Project;

import jakarta.transaction.Transactional;

@Repository
public interface Project_Repo extends JpaRepository<Project, Integer> {
    // You can add custom query methods here if needed
	List<Project> findByUserIdAndSubmittedFalse(int userId);
	List<Project> findByUserIdAndSubmittedTrue(int userId);
	@Transactional
	@Modifying
	@Query("DELETE FROM Project p WHERE p.user.id = :userId")
	void deleteProjectsByUserId(@Param("userId") int userId);
}
