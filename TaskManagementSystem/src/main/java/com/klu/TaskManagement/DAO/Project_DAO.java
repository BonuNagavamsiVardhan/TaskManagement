package com.klu.TaskManagement.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.klu.TaskManagement.Repo.Project_Repo;
import com.klu.TaskManagement.model.Project;
import com.klu.TaskManagement.model.User;

import java.util.List;

@Repository
@Transactional
public class Project_DAO {
    private final Project_Repo projectRepository;

    @Autowired
    public Project_DAO(Project_Repo projectRepository) {
        this.projectRepository = projectRepository;
    }

    // Save a project
    public void saveProject(Project project) {
        projectRepository.save(project);
    }

    // Get a project by its ID
    public Project getProjectById(int projectId) {
        return projectRepository.findById(projectId).orElse(null);
    }

    // Get all projects
    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    // Get submitted projects by user ID
    public List<Project> getnotSubmittedProjects(int userId) {
        return projectRepository.findByUserIdAndSubmittedFalse(userId);
    }
    public List<Project> getSubmittedProjects(int userId) {
        return projectRepository.findByUserIdAndSubmittedTrue(userId);
    }

    // Get PDF data for a project by project ID
    public byte[] getPdfDataForProject(int projectId) {
        Project project = projectRepository.findById(projectId).orElse(null);

        if (project != null) {
            return project.getPdfFile();
        }

        return null; // Return null if the project or PDF data is not found
    }

    // You can add more methods as needed
}
