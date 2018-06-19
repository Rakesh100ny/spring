package com.bridgelabz.service;

import com.bridgelabz.model.User;

public interface UserService 
{
	 int getUserId();

	 boolean insert(User user);

	 boolean getUserEmailId(String email);

	 boolean getUserPassword(String password, String email);

	 User getUserDetails(String email);
}
