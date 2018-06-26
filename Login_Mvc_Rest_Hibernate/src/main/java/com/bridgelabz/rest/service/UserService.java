package com.bridgelabz.rest.service;

import com.bridgelabz.rest.model.User;

public interface UserService {

	void insert(User user);

	boolean isUserExist(String email);

	boolean isCheckPassword(String password, String email);

	User getUserDetails(String email);
}