package com.klu.TaskManagement.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.TaskManagement.Repo.Project_Repo;
import com.klu.TaskManagement.Repo.Task_Repo;
import com.klu.TaskManagement.Repo.User_Repo;
import com.klu.TaskManagement.model.Tasks;
import com.klu.TaskManagement.model.User;

import jakarta.transaction.Transactional;
@Service
public class User_DAO {
	@Autowired
	User_Repo user;
	
	@Autowired
	private Project_Repo project;
	@Autowired
	private Task_Repo task;
	
	public String addUser(User u)
	{
		user.save(u);
		return "saved user data";
	}
	public List<User> viewalluser() 
	{
		return user.findAll();
	}
	public long taskcount(int userId) {
	    return task.countTasksByUserId(userId);
	}

	
	public User viewUserbyId(int uid)
	{
		Optional<User> u= user.findById(uid);
		if(u.isPresent())
		{
			User u1=u.get();
			return u1;
		}
		else
		{
			return null;
		}
	}
	
	public User checkUser(String email, String pwd) 
	{
		return user.checkUser(email, pwd);
	}
	

	public List<User> getAllUsers() {
	    return user.findAll();
	}
    @Transactional
	public void deleteByUserId(int userId) {
	    task.deleteByUserId(userId);
	    project.deleteProjectsByUserId(userId);
	    user.deleteById(userId);
	}
    @Transactional
    public String updateUser(User u) {
        user.save(u);
        return "user data updtated";
    }
    public long countAllUsers() {
        return user.count();
    }
    public List<Tasks> getCompletedTasks(List<Tasks> tasks) {
        List<Tasks> completedTasks = new ArrayList<>();
        for (Tasks task : tasks) {
            if (task.isCompleted()) {
                completedTasks.add(task);
            }
        }
        return completedTasks;
    }

    // Function to get uncompleted tasks from a list of tasks
    public List<Tasks> getUncompletedTasks(List<Tasks> tasks) {
        List<Tasks> uncompletedTasks = new ArrayList<>();
        for (Tasks task : tasks) {
            if (!task.isCompleted()) {
                uncompletedTasks.add(task);
            }
        }
        return uncompletedTasks;
    }


}
