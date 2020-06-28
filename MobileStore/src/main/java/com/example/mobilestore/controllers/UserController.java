package com.example.mobilestore.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.mobilestore.repository.UserRepository;
import com.example.mobilestore.entities.User;
@RestController
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("/list")
	 public List<User> getAllUsers() {
	 return userRepository.findAll();
	 }
	@PostMapping("/signin")
	 public ResponseEntity<User> signIn(@Validated @RequestBody User u) {
	 User user = userRepository.findByNameAndPassword(u.getName(), 
	u.getPassword());
	
	 if (user == null) {
	 return ResponseEntity.ok(null);
	 }
	
	 return ResponseEntity.ok(user);
	 }
}
