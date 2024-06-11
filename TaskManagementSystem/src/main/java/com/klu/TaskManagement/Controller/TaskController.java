package com.klu.TaskManagement.Controller; 
 
import java.util.Optional; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.GetMapping; 
import org.springframework.web.bind.annotation.PathVariable; 
import org.springframework.web.bind.annotation.PostMapping; 
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.bind.annotation.ResponseBody; 
import org.springframework.web.servlet.ModelAndView; 
 
import com.klu.TaskManagement.DAO.Task_DAO; 
import com.klu.TaskManagement.Repo.Task_Repo; 
import com.klu.TaskManagement.model.Tasks; 
 
import ch.qos.logback.core.model.Model; 
 
@Controller 
public class TaskController { 
 
    @Autowired 
    private Task_Repo taskrepo; 
    @Autowired 
    private Task_DAO taskdao; 
//    @PostMapping("/deleteTask") 
//    public ModelAndView deleteTask(@RequestParam("taskId") Long taskId) { 
//        ModelAndView mv = new ModelAndView(); 
// 
//        try { 
//            taskdao.deleteTask(taskId); // Implement this method in your service class. 
//            mv.setViewName("redirect:/viewalltasks"); // Redirect to the viewalltasks page after successful deletion. 
//        } catch (Exception e) { 
//            // Handle any exceptions or errors during the deletion process. 
//            // You can add an error message to the model to display on the page. 
//            mv.addObject("deleteError", "Failed to delete the task."); 
//            mv.setViewName("redirect:/viewalltasks"); // Redirect to the viewalltasks page with an error message. 
//        } 
// 
//        return mv; 
//    } 
    @PostMapping("/completeTask") 
    @ResponseBody 
    public String completeTask(@RequestParam Long taskId) { 
        Optional<Tasks> taskOptional = taskrepo.findById(taskId); 
        if (taskOptional.isPresent()) { 
            Tasks task = taskOptional.get(); 
            task.setCompleted(true); 
            taskrepo.save(task); 
            return "success"; 
        } else { 
            return "error"; 
        } 
    } 
    






    
}