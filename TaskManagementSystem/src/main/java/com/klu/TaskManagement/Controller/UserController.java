	package com.klu.TaskManagement.Controller;
	
	import java.util.Date;
import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
	import org.springframework.http.ResponseEntity;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PathVariable;
	import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
	
	import com.klu.TaskManagement.DAO.Admin_DAO;
import com.klu.TaskManagement.DAO.Project_DAO;
import com.klu.TaskManagement.DAO.Task_DAO;
import com.klu.TaskManagement.DAO.User_DAO;
	import com.klu.TaskManagement.Repo.Task_Repo;
	import com.klu.TaskManagement.Repo.User_Repo;
	import com.klu.TaskManagement.model.EmailModel;
import com.klu.TaskManagement.model.Project;
import com.klu.TaskManagement.model.Tasks;
import com.klu.TaskManagement.model.User;
	
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpSession;
	
	@Controller
	public class UserController {
		@Autowired
		User_DAO userdao;
		@Autowired
		User_Repo userrepo;
		 @Autowired
		    private Task_DAO task;
		 @Autowired
		 Task_Repo taskrepo;
		 @Autowired
		 Project_DAO projectdao;
		 @Autowired
		   EmailModel em;
	

		    @GetMapping("/createTeam")
		    public ModelAndView createTeamForm(HttpServletRequest request) {
		        ModelAndView mv = new ModelAndView();
		        mv.setViewName("createTeam");
		        return mv;
		    }

		    

//		    @GetMapping("/viewTeams")
//		    public ModelAndView viewTeams(HttpServletRequest request) {
//		        ModelAndView mv = new ModelAndView();
//		        HttpSession session = request.getSession();
//		        Integer userId = (Integer) session.getAttribute("eid");
//
//		        if (userId == null) {
//		            mv.setViewName("redirect:/login");
//		            return mv;
//		        }
//
//		        // Retrieve teams created by the user
//		        List<Team> userTeams = teamDAO.getTeamsAssignedToUser(userId);
//
//		        mv.addObject("userTeams", userTeams);
//		        mv.setViewName("viewTeams");
//
//		        return mv;
//		    }
		 @GetMapping("/editUser")
		 public ModelAndView editUser(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView();

		     HttpSession session = request.getSession();
		     Integer eid = (Integer) session.getAttribute("eid");

		     if (eid == null) {
		         // Handle the case where the user is not logged in.
		         // You can redirect to the login page or take appropriate action.
		         mv.setViewName("redirect:/login"); // Redirect to the login page
		     } else {
		         User user = userdao.viewUserbyId(eid); // Replace with your method to get a user by ID

		         if (user != null) {
		             mv.addObject("user", user);
		             mv.setViewName("edituser"); // Create an "edituser" view for editing user details
		         } else {
		             mv.addObject("errorMessage", "User not found.");
		             mv.setViewName("edituser"); // Handle the case where the user is not found
		         }
		     }

		     return mv;
		 }
		 @GetMapping("/viewSubmittedProjects")
		 public ModelAndView viewSubmittedProjects(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView();

		     HttpSession session = request.getSession();
		     Integer userId = (Integer) session.getAttribute("eid");

		     if (userId == null) {
		         // Handle the case where the user is not logged in
		         mv.setViewName("login");
		         return mv;
		     }

		     // Retrieve submitted projects associated with the user
		     List<Project> submittedProjects = projectdao.getSubmittedProjects(userId);

		     mv.addObject("submittedProjects", submittedProjects);
		     mv.setViewName("viewSubmittedProjects"); // Create a view for displaying submitted projects

		     return mv;
		 }

		 @GetMapping("/submitProject")
		 public ModelAndView submitProjectForm(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView();
		     
		     HttpSession session = request.getSession();
		     Integer userId = (Integer) session.getAttribute("eid");

		     if (userId == null) {
		         // Handle the case where the user is not logged in
		         mv.setViewName("login");
		         return mv;
		     }

		     List<Project> projectList = projectdao.getnotSubmittedProjects(userId);

		     mv.addObject("projectList", projectList);
		     mv.setViewName("submitproject"); // Create a view for displaying the project submission form

		     return mv;
		 }

		 @PostMapping("/submitProject")
		 public ModelAndView submitProject(
		     HttpServletRequest request,
		     @RequestParam int projectId,
		     @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date submissionDate,
		     @RequestParam("pdfFile") MultipartFile pdfFile // Handle the uploaded PDF file
		 ) {
		     ModelAndView mv = new ModelAndView();
		     String message = null;

		     try {
		         HttpSession session = request.getSession();
		         Integer userId = (Integer) session.getAttribute("eid");

		         if (userId == null) {
		             // Handle the case where the user is not logged in
		             mv.setViewName("login");
		             return mv;
		         }

		         // Fetch the selected project based on projectId
		         Project project = projectdao.getProjectById(projectId);

		         if (project != null) {
		             // Check if the submission date is valid
		             if (submissionDate != null) {
		                 Date currentDate = new Date();
		                 if (submissionDate.after(currentDate)) {
		                     message = "Submission date cannot be in the future.";
		                 } else {
		                     // Set the submission date for the project
		                     project.setSubmissionDate(submissionDate);

		                     // Handle the uploaded PDF file
		                     if (!pdfFile.isEmpty()) {
		                         byte[] pdfData = pdfFile.getBytes();
		                         project.setPdfFile(pdfData);
		                         // Set the project as "submitted"
		                         project.setSubmitted(true);
		                         
		                         // Associate the project with the user
		                         project.setUser(userdao.viewUserbyId(userId));

		                         // Save the updated project with the PDF file using your Project_DAO
		                         projectdao.saveProject(project);

		                         message = "Project submitted successfully with PDF file.";
		                     } else {
		                         message = "PDF file is empty.";
		                     }
		                 }
		             } else {
		                 message = "Invalid submission date.";
		             }
		         } else {
		             message = "Project not found.";
		         }
		     } catch (Exception e) {
		         message = e.getMessage();
		     }

		     mv.addObject("message", message);
		     mv.setViewName("dashboard");
		     return mv;
		 }


		 @PostMapping("/updateUser")
		 public ModelAndView updateUser(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView();
		     String msg = null;

		     try {
		         HttpSession session = request.getSession();
		         Integer eid = (Integer) session.getAttribute("eid");

		         if (eid == null) {
		             // Handle the case where the user is not logged in
		             mv.setViewName("login"); // Redirect to the login page
		             return mv;
		         }

		         String name = request.getParameter("name");
		         String gender = request.getParameter("gender");
		         String email = request.getParameter("email");
		         String password = request.getParameter("password");
		         String department = request.getParameter("department");

		         User user = userdao.viewUserbyId(eid); // Retrieve the user to be updated

		         if (user != null) {
		             // Update the user's details
		             user.setName(name);
		             user.setGender(gender);
		             user.setEmail(email);
		             user.setPassword(password);
		             user.setDepartment(department);

		             // Save the updated user using your User_DAO
		             msg = userdao.updateUser(user);
		             long taskCount = userdao.taskcount(eid);
		             mv.addObject("taskCount", taskCount);
		             List<Tasks> completedTasks = taskrepo.getCompletedTasks(eid);
					    List<Tasks> uncompletedTasks = taskrepo.getUncompletedTasks(eid);
					    mv.addObject("taskCount", taskCount);
					    mv.addObject("completedTasks", completedTasks);
					    mv.addObject("uncompletedTasks", uncompletedTasks);
		             mv.setViewName("dashboard"); // Redirect to the user's dashboard after a successful update
		             mv.addObject("message", "User details updated successfully");
		             session.setAttribute("eid", eid); // Maintain the session attribute
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

		 @GetMapping("/viewTasks")
		 public ModelAndView viewTasks(HttpServletRequest request) {
		     ModelAndView mv = new ModelAndView();
		     HttpSession session = request.getSession();
		     int assigneeName = (int) session.getAttribute("eid");
	
		     List<Tasks> tasks = taskrepo.findByUserId(assigneeName);
		     // Use the repository method
		     mv.addObject("tasks", tasks);
		     mv.setViewName("usertasks");
	
		     return mv;
		 }
	
	
		@GetMapping("")
		public String homePage()
		{
			return "home";
		}
		@GetMapping("/register")
		  public ModelAndView empreg()
		   {
		     ModelAndView mv = new ModelAndView();
		     mv.setViewName("register");
		     return mv;
		   }
		@PostMapping("/register")
		public ModelAndView insertUser(HttpServletRequest request) {
		    ModelAndView mv = new ModelAndView();
		    String msg = null;
	
		    try {
		        String name = request.getParameter("name");
		        String gender = request.getParameter("gender");
		        String email = request.getParameter("email");
		        String password = request.getParameter("password");
		        String department = request.getParameter("department");
	
		        User user = new User();
	
		        user.setName(name);
		        user.setGender(gender);
		        user.setEmail(email);
		        user.setPassword(password);
		        user.setDepartment(department);
	
		        // Assuming you have a UserService class with an adduser method
		        msg = userdao.addUser(user);
	
		        mv.setViewName("login");
	//	          String frommail="meghanadhnaidu999@gmail.com";
	//	      String toemail=email;
	//	      String subject="welcome to emailing";
	//	      String text="Hello hai sir";
	//	      msg=em.sendEmail(frommail, toemail, subject, text);
		          mv.addObject("message", msg);
		        mv.addObject("message", msg);
		    } catch (Exception e) {
		        msg = e.getMessage();
		        mv.setViewName("displayerror");
		        mv.addObject("message", msg);
		    }
	
		    return mv;
		}
		@GetMapping("login") // URI & method name can be different
		   public ModelAndView userLogin()
		   {
		     ModelAndView mv = new ModelAndView();
		     mv.setViewName("login");
		     return mv;
		   }
		
		@PostMapping("login")
		   public ModelAndView checkemplogin(HttpServletRequest request)
		   {
			   ModelAndView mv = new ModelAndView();
			   
			   String email = request.getParameter("email");
		       String pwd = request.getParameter("pwd");
				   
			   User u = userdao.checkUser(email, pwd);
				   
			   if(u!=null)
			   {
				   //session
				   
				   HttpSession session = request.getSession();
				   
				   session.setAttribute("eid", u.getId());  //eid is a session variable
				   session.setAttribute("ename", u.getName()); //ename is a session variable
				   
				   //session
				   
				   
				   mv.setViewName("dashboard");
				    List<Tasks> completedTasks = taskrepo.getCompletedTasks(u.getId());
				    List<Tasks> uncompletedTasks = taskrepo.getUncompletedTasks(u.getId());
				   long taskCount = userdao.taskcount(u.getId()); 
				    mv.addObject("taskCount", taskCount);
				    mv.addObject("completedTasks", completedTasks);
				    mv.addObject("uncompletedTasks", uncompletedTasks);
			   }
			   else
			   {
				   mv.setViewName("login");
				   mv.addObject("message", "Login Failed");
			   }
			   return mv;
		   }
		@GetMapping("dashboard")
		public ModelAndView userHome(HttpServletRequest request) {
		    HttpSession session = request.getSession();
	
		    Integer eid = (Integer) session.getAttribute("eid");
		    String ename = (String) session.getAttribute("ename");
	
		    // Check if eid and ename are null
		    if (eid == null || ename == null) {
		        ModelAndView errorModel = new ModelAndView("error");
		        errorModel.addObject("errorMessage", "User information not found in the session.");
		        return errorModel;
		    }
	
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("dashboard");
		   
	
		    mv.addObject("eid", eid);
		    mv.addObject("ename", ename);
		    List<Tasks> completedTasks = taskrepo.getCompletedTasks(eid);
		    List<Tasks> uncompletedTasks = taskrepo.getUncompletedTasks(eid);
		   long taskCount = userdao.taskcount(eid); 
		    mv.addObject("taskCount", taskCount);
		    mv.addObject("completedTasks", completedTasks);
		    mv.addObject("uncompletedTasks", uncompletedTasks);
		   
	
		    return mv;
		}
	
	
	
		@GetMapping("view")
		   public ModelAndView viewempdemo(@RequestParam("id") int uid,HttpSession sessionx)
		   {
		     User u = userdao.viewUserbyId(uid);
		     ModelAndView mv = new ModelAndView();
		     mv.setViewName("view");
		     mv.addObject("user", u);
		     return mv;
		   }
		
		@GetMapping("/logout")
	    public ModelAndView userLogout(HttpSession session) {
	        ModelAndView mv = new ModelAndView();
	
	        // Invalidate the user's session to log them out
	        session.invalidate();
	
	        mv.setViewName("login"); // Redirect to the login page or your desired page
	        mv.addObject("message", "Logout Successfully");
	
	        return mv;
	    }
		

		@PostMapping("/updateTaskStatus/{taskId}")
	    public ModelAndView updateTaskStatus(
	            @PathVariable Long taskId,
	            @RequestParam Boolean newStatus,
	            HttpServletRequest request
	    ) {
	        ModelAndView mv = new ModelAndView();

		     HttpSession session = request.getSession();
	        Tasks ts = task.getTaskById(taskId);
	        if (ts != null) {
	            ts.setCompleted(newStatus);
	            task.updateTask(ts);
	        }
	        
	        mv.setViewName("redirect:/dashboard");	       
	        return mv;
	    }
		    
	}
	
	
