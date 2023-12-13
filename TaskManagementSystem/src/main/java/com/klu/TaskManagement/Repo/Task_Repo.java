package com.klu.TaskManagement.Repo;

import com.klu.TaskManagement.model.Tasks;
import com.klu.TaskManagement.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface Task_Repo extends JpaRepository<Tasks, Long> {
    List<Tasks> findByUserId(User user);
    List<Tasks> findByUserId(int id);
    void deleteByUserId(int id);
	long countTasksByUserId(int userId);
	@Query("SELECT t FROM Tasks t WHERE t.completed = true AND t.user.id = :id")
    List<Tasks> getCompletedTasks(Integer id);

    @Query("SELECT t FROM Tasks t WHERE t.completed = false AND t.user.id = :id")
    List<Tasks> getUncompletedTasks(Integer id);
    
    List<Tasks> findByCompleted(boolean completed);

	
}
