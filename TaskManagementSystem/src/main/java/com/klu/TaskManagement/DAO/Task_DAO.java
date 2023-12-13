package com.klu.TaskManagement.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.klu.TaskManagement.model.Tasks;
import com.klu.TaskManagement.model.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import com.klu.TaskManagement.Repo.Task_Repo;

@Service
public class Task_DAO {

    @Autowired
    private Task_Repo task;

   
   
    public List<Tasks> getAllTasks() {
        return task.findAll();
    }
  
    public String createTask(Tasks tasks) {
        task.save(tasks);
        return "created";
    }

    public Tasks updateTask(Tasks tasks) {
        return task.save(tasks);
    }

    public void deleteTask(Long taskId) {
        task.deleteById(taskId);
    }

	public Tasks getTaskById(Long taskId) {
		return task.getById(taskId);
	}
	 public List<Tasks> getCompletedTasks() {
	        return task.findByCompleted(true);
	    }

	    public List<Tasks> getUncompletedTasks() {
	        return task.findByCompleted(false);
	    }
}
