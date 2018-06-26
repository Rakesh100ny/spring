package com.bridgelabz.spring.service;

import java.util.List;

import com.bridgelabz.spring.model.User;


public interface UserService 
{

	 void insert(User user);

	 boolean getUserEmailId(String email);

	 boolean getUserPassword(String password, String email);

	 List<User> getUserDetails(String email);
}