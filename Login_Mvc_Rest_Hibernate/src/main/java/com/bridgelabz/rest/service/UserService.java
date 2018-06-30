package com.bridgelabz.rest.service;

import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;

import com.bridgelabz.rest.model.EmailModel;
import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;

public interface UserService {

	void insert(RegisterModel registerModel,HttpServletRequest request);

	boolean isUserExist(String email);

	boolean isCheckCredentials(String password, String email);

	User getUserDetails(String email);
	
	 User getUserById(String token) throws NumberFormatException, SignatureException;
	 
	 void updateUser(User user);

	EmailModel getEmailModel(String token,HttpServletRequest request,User user);

}