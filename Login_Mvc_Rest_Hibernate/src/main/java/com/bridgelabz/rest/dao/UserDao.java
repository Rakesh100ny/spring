package com.bridgelabz.rest.dao;

import com.bridgelabz.rest.model.User;



public interface UserDao 
{
	 
	 void insert(User user);

	 long isUserExist(String email);

	 User isCheckPassword(String password, String email);
    
	 User getUserDetails(String email);
 
 
 
}