package com.klu.TaskManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klu.TaskManagement.model.Admin;

import jakarta.transaction.Transactional;

@Repository
public interface Admin_Repo extends JpaRepository<Admin, Integer> {
    @Query("SELECT a FROM Admin a WHERE a.username = ?1 AND a.password = ?2")
    public Admin checkadminlogin(String uname, String pwd);

    @Modifying
    @Transactional
    @Query("UPDATE Admin a SET a.active = ?1 WHERE a.id = ?2")
    public int updatestatus(boolean status, int id);
}
