package com.bridgelabz.spring.dao;

import java.util.List;

import com.bridgelabz.spring.model.User;


public interface UserDao 
{
	 void insert(User user);

	 boolean getUserEmailId(String email);

	 boolean getUserPassword(String password, String email);

     List<User> getUserDetails(String email);
 
 
 
}