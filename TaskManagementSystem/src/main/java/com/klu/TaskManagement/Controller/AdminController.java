package com.klu.TaskManagement.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klu.TaskManagement.DAO.Admin_DAO;
import com.klu.TaskManagement.DAO.Project_DAO;
import com.klu.TaskManagement.DAO.Task_DAO;
import com.klu.TaskManagement.DAO.User_DAO;
import com.klu.TaskManagement.model.Admin;
import com.klu.TaskManagement.model.Project;
import com.klu.TaskManagement.model.Tasks;
import com.klu.TaskManagement.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class AdminController {
	@Autowired
	Admin_DAO admindao;
	@Autowired
	User_DAO userdao;
	@Autowired
	Task_DAO taskdao;
	@Autowired
	Project_DAO projectdao;
	@GetMapping("/adminregister")
	  public ModelAndView empreg()
	   {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("adminreg");
	     return mv;
	   }
	@PostMapping("/adminregister")
	public ModelAndView insertUser(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String msg = null;

	    try {
	    	String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean active = request.getParameter("active") != null; // Check if the checkbox is checked

            Admin admin = new Admin();
            admin.setUsername(username);
            admin.setPassword(password);
            admin.setActive(active);

	        // Assuming you have a UserService class with an adduser method
	        msg = admindao.addAdmin(admin);

	        mv.setViewName("adminlogin");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("displayerror");
	        mv.addObject("message", msg);
	    }

	    return mv;
	}
	
	@GetMapping("/adminEdit")
	public ModelAndView adminEdit(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    HttpSession session = request.getSession();
	    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");

	    if (loggedInAdmin == null) {
	        // Handle the case where the admin is not logged in.
	        mv.setViewName("adminLogin"); // Redirect to the admin login page
	    } else {
	        mv.addObject("admin", loggedInAdmin);
	        mv.setViewName("editadmin"); // Create a view for editing admin details
	    }

	    return mv;
	}
	@GetMapping("/updateTask")
	public ModelAndView getUpdateTaskForm(HttpServletRequest request,@RequestParam(name = "taskId", required = true) Long taskId) {
	    ModelAndView mv = new ModelAndView();

	    // Fetch the task based on the taskId
	    Tasks task = taskdao.getTaskById(taskId);
	    String uname=task.getUser().getName();

	    if (task != null) {
	        // Add the task object to the model
	        mv.addObject("task", task);
	        List<User> userList = userdao.viewalluser();
		       mv.addObject("users", userList);
		       mv.addObject("name", uname);
	        mv.setViewName("updateTask"); // Replace with the appropriate view name
	    } else {
	        mv.addObject("message", "Task not found");
	        mv.setViewName("adminhome"); // Redirect to the admin's home page
	    }

	    return mv;
	}

	@PostMapping("/updateTask")
	public ModelAndView updateTask(
	    HttpServletRequest request,
	    @RequestParam Long taskId,
	    @RequestParam String title,
	    @RequestParam String description,
	    @RequestParam int userId
	) {
	    ModelAndView mv = new ModelAndView();
	    String msg = null;
	    HttpSession session = request.getSession();

	    // Fetch the task based on the taskId
	    Tasks task = taskdao.getTaskById(taskId);
	    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");

	    if (loggedInAdmin == null) {
	        // Handle the case where the admin is not logged in
	        mv.setViewName("adminlogin"); // Redirect to the admin login page
	        return mv;
	    }

	    if (task != null) {
	        // Update the task's details
	        task.setTitle(title);
	        task.setDescription(description);

	        // Fetch the user based on the userId
	        User user = userdao.viewUserbyId(userId);

	        if (user != null) {
	            // Update the user associated with the task
	            task.setUser(user);
	            taskdao.updateTask(task);

	            msg = "Task updated successfully";
	        } else {
	            msg = "User not found";
	        }
	    } else {
	        msg = "Task not found";
	    }

	    mv.addObject("uname", loggedInAdmin.getUsername());
	    long ecount = admindao.empcount();
        long ccount = admindao.taskcount();
        
        // Retrieve completed and uncompleted tasks
        List<Tasks> completedTasks = taskdao.getCompletedTasks();
        List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

        mv.addObject("uname", loggedInAdmin.getUsername());
        mv.addObject("ecount", ecount);
        mv.addObject("ccount", ccount);
        
        // Pass the completed and uncompleted tasks to the JSP
        mv.addObject("completedTasks", completedTasks);
        mv.addObject("uncompletedTasks", uncompletedTasks);

	    mv.addObject("message", msg);
	    mv.setViewName("adminhome"); // Redirect to the admin's home page

	    return mv;
	}



	@PostMapping("/adminUpdate")
	public ModelAndView adminUpdate(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    String msg = null;

	    try {
	        HttpSession session = request.getSession();
	        Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");

	        if (loggedInAdmin == null) {
	            // Handle the case where the admin is not logged in
	            mv.setViewName("adminlogin"); // Redirect to the admin login page
	            return mv;
	        }

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        boolean active = request.getParameter("active") != null; // Check if the checkbox is checked

	        // Retrieve the admin to be updated
	        Admin adminToUpdate = admindao.getAdminById(loggedInAdmin.getId());

	        if (adminToUpdate != null) {
	            // Update the admin's details
	            adminToUpdate.setUsername(username);
	            adminToUpdate.setPassword(password);
	            adminToUpdate.setActive(active);

	            // Save the updated admin using your Admin_DAO
	            msg = admindao.updateAdmin(adminToUpdate);
	            Admin a = admindao.checkadminlogin(username, password);
	           mv.addObject(adminToUpdate);
	           session.setAttribute("loggedInAdmin", a);
	           long ecount = admindao.empcount();
	           long ccount = admindao.taskcount();
	           
	           // Retrieve completed and uncompleted tasks
	           List<Tasks> completedTasks = taskdao.getCompletedTasks();
	           List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

	           mv.addObject("uname", loggedInAdmin.getUsername());
	           mv.addObject("ecount", ecount);
	           mv.addObject("ccount", ccount);
	           
	           // Pass the completed and uncompleted tasks to the JSP
	           mv.addObject("completedTasks", completedTasks);
	           mv.addObject("uncompletedTasks", uncompletedTasks);

	           mv.addObject("message", msg);
	            mv.setViewName("adminhome"); // Redirect to the admin's home after a successful update
	            mv.addObject("message", "Admin details updated successfully");
	        } else {
	            mv.setViewName("error"); // Handle the case where the admin is not found
	            mv.addObject("errorMessage", "Admin not found.");
	        }
	    } catch (Exception e) {
	        mv.setViewName("error"); // Handle any errors that occur during the update
	        mv.addObject("errorMessage", e.getMessage());
	    }

	    return mv;
	}

	

	@GetMapping("adminlogin")
	   public ModelAndView adminlogin()
	   {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("adminlogin");
	     return mv;
	   }
	
	   
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request, HttpSession session) {
	    ModelAndView mv = new ModelAndView();

	    String uname = request.getParameter("uname");
	    String pwd = request.getParameter("pwd");

	    Admin a = admindao.checkadminlogin(uname, pwd);

	    if (a != null) {
	        // Create a session and store the logged-in admin's information
	        session.setAttribute("loggedInAdmin", a);

	        // Retrieve completed and uncompleted tasks
	        List<Tasks> completedTasks = taskdao.getCompletedTasks();
	        List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

	        mv.setViewName("adminhome");
	        long ecount = admindao.empcount();
	        long ccount = admindao.taskcount();
	        mv.addObject("uname", uname);
	        mv.addObject("ecount", ecount);
	        mv.addObject("ccount", ccount);

	        // Pass the completed and uncompleted tasks to the JSP
	        mv.addObject("completedTasks", completedTasks);
	        mv.addObject("uncompletedTasks", uncompletedTasks);
	    } else {
	        mv.setViewName("adminlogin");
	        mv.addObject("message", "Login Failed");
	    }
	    return mv;
	}

	   @GetMapping("/adminhome")
	   public ModelAndView adminLoginPage(HttpSession session) {
	       ModelAndView mv = new ModelAndView();

	       // Check if the admin is already logged in
	       Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	       if (loggedInAdmin != null) {
	           // Admin is already logged in, redirect to admin home
	           long ecount = admindao.empcount();
	           long ccount = admindao.taskcount();
	           
	           // Retrieve completed and uncompleted tasks
	           List<Tasks> completedTasks = taskdao.getCompletedTasks();
	           List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

	           mv.addObject("uname", loggedInAdmin.getUsername());
	           mv.addObject("ecount", ecount);
	           mv.addObject("ccount", ccount);
	           
	           // Pass the completed and uncompleted tasks to the JSP
	           mv.addObject("completedTasks", completedTasks);
	           mv.addObject("uncompletedTasks", uncompletedTasks);

	           mv.setViewName("adminhome");
	       } else {
	           // Admin is not logged in, show the login page
	           mv.setViewName("adminlogin");
	       }

	       return mv;
	   }

		




	   @GetMapping("/createTask")
	   public ModelAndView createTask(HttpServletRequest request) {
	       ModelAndView mv = new ModelAndView();
	       mv.setViewName("createTask");

	       // Fetch the list of users and add it to the model
	       List<User> userList = userdao.viewalluser();
	       mv.addObject("users", userList);

	       return mv;
	   }

	   @GetMapping("/createProject")
	   public ModelAndView createProjectForm(HttpServletRequest request) {
	       ModelAndView mv = new ModelAndView();
	       mv.setViewName("createProject");
	       
	       // Retrieve the list of users
	       List<User> userList = userdao.viewalluser();
	       mv.addObject("users", userList);
	       
	       return mv;
	   }

	   @PostMapping("/createProject")
	   public ModelAndView createProject(
	       HttpServletRequest request,
	       @RequestParam String title,
	       @RequestParam String description,
	       @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date submissionDate,
	       @RequestParam int userId // Add this parameter to get the selected user
	   ) {
	       ModelAndView mv = new ModelAndView();
	       String message = null;

	       // Check if the user is logged in
	       HttpSession session = request.getSession();
	       Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	       
	       if (loggedInAdmin == null) {
	           // Handle the case where the admin is not logged in
	           mv.setViewName("adminlogin");
	           return mv;
	       }

	       try {
	           // Fetch the currently logged-in admin
	           Admin admin = admindao.getAdminById(loggedInAdmin.getId());

	           if (admin != null) {
	               // Create a new project with "submitted" set to false
	               Project project = new Project();
	               project.setTitle(title);
	               project.setDescription(description);
	               project.setCreatedDate(new Date());
	               project.setSubmissionDate(submissionDate);

	               // Set the "submitted" status to false
	               project.setSubmitted(false);

	               // Fetch the selected user based on userId and associate with the project
	               User selectedUser = userdao.viewUserbyId(userId);
	               if (selectedUser != null) {
	                   project.setUser(selectedUser);
	               } else {
	                   message = "Selected user not found.";
	                   mv.addObject("message", message);
	                   mv.setViewName("adminhome");
	                   return mv;
	               }

	               // Save the project using your Project_DAO
	               projectdao.saveProject(project);

	               message = "Project created successfully";
	           } else {
	               message = "Admin not found";
	           }

	           // Retrieve employee count and task count
	           long ecount = admindao.empcount();
	           long ccount = admindao.taskcount();

	           // Retrieve completed and uncompleted tasks
	           List<Tasks> completedTasks = taskdao.getCompletedTasks();
	           List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

	           // Add these values to the model
	           mv.addObject("uname", loggedInAdmin.getUsername());
	           mv.addObject("ecount", ecount);
	           mv.addObject("ccount", ccount);
	           mv.addObject("completedTasks", completedTasks);
	           mv.addObject("uncompletedTasks", uncompletedTasks);
	       } catch (Exception e) {
	           message = e.getMessage();
	       }

	       mv.setViewName("adminhome");
	       mv.addObject("message", message);
	       
	       return mv;
	   }



	    @GetMapping("/viewProjects")
	    public ModelAndView viewAllProjects( ) {
	        ModelAndView mv = new ModelAndView();
	       
	        mv.setViewName("viewProject"); 
	        List<Project> projectList = projectdao.getAllProjects();
	        mv.addObject("projectList", projectList);
	        return mv;
	  
		   }

	   @PostMapping("/createTask")
	   public ModelAndView createTask1(@RequestParam String title, @RequestParam String description, @RequestParam int userId, HttpServletRequest request) {
	       ModelAndView mv = new ModelAndView();
	       HttpSession session = request.getSession();
		    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	       String message = null;

	       try {
	           // Fetch the User based on the userId
	           User user = userdao.viewUserbyId(userId);

	           // Create a new task
	           Tasks task = new Tasks();
	           task.setTitle(title);
	           task.setDescription(description);
	           task.setCompleted(false);

	           // Associate the task with the user
	           task.setUser(user);

	           // Save the task
	           message = taskdao.createTask(task);

	           // Store user-related information in the session
	           session.setAttribute("loggedInUser", user);

	           mv.setViewName("adminhome");
	           long ecount = admindao.empcount();
	           long ccount = admindao.taskcount();
	           
	           // Retrieve completed and uncompleted tasks
	           List<Tasks> completedTasks = taskdao.getCompletedTasks();
	           List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

	           mv.addObject("uname", loggedInAdmin.getUsername());
	           mv.addObject("ecount", ecount);
	           mv.addObject("ccount", ccount);
	           
	           // Pass the completed and uncompleted tasks to the JSP
	           mv.addObject("completedTasks", completedTasks);
	           mv.addObject("uncompletedTasks", uncompletedTasks);
	           mv.addObject("message", message);
	       } catch (Exception e) {
	           message = e.getMessage();
	           mv.setViewName("displayerror");
	           mv.addObject("message", message);
	       }

	       return mv;
	   }
	   @GetMapping("/edituser")
	   public ModelAndView editUser(HttpServletRequest request, @RequestParam(name = "userId", required = true) int userId) {
	       ModelAndView mv = new ModelAndView();
	       HttpSession session = request.getSession();
		    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");

	       // Fetch the user based on the userId
	       User user = userdao.viewUserbyId(userId);

	       if (user != null) {
	           mv.addObject("user", user);
	           mv.addObject("admin",loggedInAdmin);
	           mv.setViewName("adminuseredit"); // Create an "edituser" view for editing user details
	       } else {
	           mv.addObject("errorMessage", "User not found.");
	           mv.setViewName("edituser"); // Handle the case where the user is not found
	       }

	       return mv;
	   }

	   @PostMapping("/admiUpdateUser")
	   public ModelAndView updateUser(
	       @RequestParam int userId,
	       @RequestParam String name,
	       @RequestParam String gender,
	       @RequestParam String email,
	       @RequestParam String password,
	       @RequestParam String department,HttpServletRequest request
	   ) {
		   HttpSession session = request.getSession();
		    Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");

	       ModelAndView mv = new ModelAndView();
	       try {
	           // Fetch the user based on the userId
	           User user = userdao.viewUserbyId(userId);

	           if (user != null) {
	               // Update the user's details
	               user.setName(name);
	               user.setGender(gender);
	               user.setEmail(email);
	               user.setPassword(password);
	               user.setDepartment(department);

	               long ecount = admindao.empcount();
		           long ccount = admindao.taskcount();
		           
		           // Retrieve completed and uncompleted tasks
		           List<Tasks> completedTasks = taskdao.getCompletedTasks();
		           List<Tasks> uncompletedTasks = taskdao.getUncompletedTasks();

		           mv.addObject("uname", loggedInAdmin.getUsername());
		           mv.addObject("ecount", ecount);
		           mv.addObject("ccount", ccount);
		           
		           // Pass the completed and uncompleted tasks to the JSP
		           mv.addObject("completedTasks", completedTasks);
		           mv.addObject("uncompletedTasks", uncompletedTasks);
	               mv.setViewName("adminhome");
 // Redirect to the admin's home page after a successful update
	               mv.addObject("message", "User details updated successfully");
	           } else {
	               mv.setViewName("error"); // Handle the case where the user is not found
	               mv.addObject("errorMessage", "User not found.");
	           }
	       } catch (Exception e) {
	           mv.setViewName("error"); // Handle any errors that occur during the update
	           mv.addObject("errorMessage", e.getMessage());
	       }

	       return mv;
	   }
	   @GetMapping("/downloadPdf")
	    public void downloadPdf(@RequestParam int projectId, HttpServletResponse response) {
	        // Retrieve the PDF data for the specified project using your service (replace with your data retrieval logic)
	        byte[] pdfData = projectdao.getPdfDataForProject(projectId);

	        if (pdfData != null) {
	            try {
	                // Set response headers for PDF file
	                response.setContentType("application/pdf");
	                response.setHeader("Content-Disposition", "attachment; filename=project_" + projectId + ".pdf");

	                // Write the PDF data to the response output stream
	                OutputStream outputStream = response.getOutputStream();
	                outputStream.write(pdfData);
	                outputStream.flush();
	            } catch (IOException e) {
	                // Handle exceptions (e.g., log them or show an error message)
	            }
	        }
	   }




	    

	       @PostMapping("/deleteTask")
	       public ModelAndView deleteTask(HttpServletRequest request,@RequestParam Long taskId) {
	           ModelAndView mv = new ModelAndView();

	           taskdao.deleteTask(taskId);

	           mv.setViewName("deleteTask"); // Replace with your admin home view
	           return mv;
	       }
	       @GetMapping("viewuser")
		   public ModelAndView viewallemps()
		   {
			   ModelAndView mv = new ModelAndView();
			   mv.setViewName("viewallemps");
			   
			   List<User> userlist = admindao.viewallemployees();
			   mv.addObject("userdata", userlist);
			   return mv;
		   }
	       @GetMapping("viewtask")
		   public ModelAndView viewalltasks(HttpServletRequest request)
		   {
			   ModelAndView mv = new ModelAndView();
			   mv.setViewName("viewalltasks");
			   
			   List<Tasks> tasklist =taskdao.getAllTasks();
			   mv.addObject("tasklist", tasklist);
			   return mv;
		   }
	       @PostMapping("/deleteUser")
	       public ModelAndView deleteUser(HttpServletRequest request,@RequestParam int userId) {
	           userdao.deleteByUserId(userId);
	           ModelAndView mv = new ModelAndView();
			   mv.setViewName("deleteuser");
	           return mv;
	       }
	       @GetMapping("/adminlogout")
	       public ModelAndView adminLogout(HttpSession session) {
	           ModelAndView mv = new ModelAndView();
	           
	           // Check if the admin is already logged in
	           Admin loggedInAdmin = (Admin) session.getAttribute("loggedInAdmin");
	           if (loggedInAdmin != null) {
	               // Admin is logged in, so we can log them out by invalidating the session
	               session.invalidate();
	               mv.addObject("message", "Admin logged out successfully");
	           } else {
	               // Admin is not logged in, show an appropriate message
	               mv.addObject("message", "You are not logged in as an admin");
	           }
	           
	           mv.setViewName("adminlogin"); // Redirect to the login page or your desired page
	           return mv;
	       }
	       
}

	   
