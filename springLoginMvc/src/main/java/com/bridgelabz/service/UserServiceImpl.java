package com.bridgelabz.service;

import com.bridgelabz.dao.UserDao;
import com.bridgelabz.model.User;

public class UserServiceImpl implements UserService{

	
	UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public int getUserId() {
		return userDao.getUserId();
	}

	@Override
	public boolean insert(User user) {
		return userDao.insert(user);
	}

	@Override
	public boolean getUserEmailId(String email) {
		return userDao.getUserEmailId(email);
	}

	@Override
	public boolean getUserPassword(String password, String email) {
		return userDao.getUserPassword(password, email);
	}

	@Override
	public User getUserDetails(String email) {
		return userDao.getUserDetails(email);
	}

}
