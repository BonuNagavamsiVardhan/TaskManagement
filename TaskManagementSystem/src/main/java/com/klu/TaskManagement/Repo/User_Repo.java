package com.klu.TaskManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.klu.TaskManagement.model.*;

@Repository
public interface User_Repo extends JpaRepository<User, Integer> {
    @Query("SELECT u FROM User u WHERE u.email = :email AND u.password = :pwd")
    public User checkUser(@Param("email") String email, @Param("pwd") String pwd);
    @Modifying
    @Query("DELETE FROM User u WHERE u.id = :userId")
    void deleteByUserId(@Param("userId") int userId);
    
   
}
