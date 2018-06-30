package com.bridgelabz.rest.service;

import javax.servlet.http.HttpServletRequest;

import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;

public interface UserService {

	void insert(RegisterModel registerModel,HttpServletRequest request);

	boolean isUserExist(String email);

	boolean isCheckCredentials(String password, String email);

	User getUserDetails(String email);
	
	 boolean getUserById(String token);
	 
	 void updateUser(User user);

}