package com.bridgelabz.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.bridgelabz.dao.UserDao;
import com.bridgelabz.model.User;

public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	public int getUserId() {
		return userDao.getUserId();
	}

	
	public boolean insert(User user) {
		return userDao.insert(user);
	}

	
	public boolean getUserEmailId(String email) {
		return userDao.getUserEmailId(email);
	}

	public boolean getUserPassword(String password, String email) {
		return userDao.getUserPassword(password, email);
	}


	public User getUserDetails(String email) {
		return userDao.getUserDetails(email);
	}

}
