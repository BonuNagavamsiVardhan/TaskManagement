package com.klu.TaskManagement.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.klu.TaskManagement.Repo.Admin_Repo;
import com.klu.TaskManagement.Repo.Task_Repo;
import com.klu.TaskManagement.Repo.User_Repo;
import com.klu.TaskManagement.model.Admin;
import com.klu.TaskManagement.model.User;

import jakarta.transaction.Transactional;
@Repository
public class Admin_DAO {
	@Autowired
	public Admin_Repo admin;
	
	@Autowired
	private User_Repo user;
	@Autowired
	private Task_Repo task;

	public String addAdmin(Admin u)
	{
		admin.save(u);
		return "saved user data";
	}
	public List<User> viewallemployees() 
	{
		return user.findAll();
	}

	public String deleteemployee(int userId) 
	{
		Optional<User> obj =  user.findById(userId);
        String msg = null;
        if(obj.isPresent())
        {
          User emp = obj.get();
          user.delete(emp);
          msg = "Employee Deleted Successfully";
        }
        else
        {
          msg = "Employee Not Found";
        }
        return msg;
	}

	public User viewemployeebyid(int eid) 
	{
		Optional<User> obj =  user.findById(eid);
        
        if(obj.isPresent())
        {
          User emp = obj.get();
          
          return emp;
        }
        else
        {
          return null;
        }
		
	}
	public Admin getAdminById(int adminId) {
	    Optional<Admin> adminOptional = admin.findById(adminId);
	    return adminOptional.orElse(null);
	}

	
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return admin.checkadminlogin(uname, pwd);
	}
	  @Transactional
	    public String updateAdmin(Admin u) {
	        admin.save(u);
	        return "admin data updtated";
	    }



	public long empcount() 
	{
		return user.count();
	}
	public long taskcount() 
	{
		return task.count();
	}

	public int updatestatus(boolean status, int eid) 
	{
		return admin.updatestatus(status, eid);
	}


}
