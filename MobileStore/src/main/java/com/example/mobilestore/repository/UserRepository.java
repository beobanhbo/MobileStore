package com.example.mobilestore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.mobilestore.entities.User;

public interface UserRepository extends JpaRepository<User, Long>{
	
	public User findByUsernameAndPassword(String username, String password);
}
