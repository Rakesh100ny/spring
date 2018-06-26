package com.bridgelabz.spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bridgelabz.spring.dao.UserDao;
import com.bridgelabz.spring.model.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Transactional
	@Override
	public void insert(User user) 
	{
	 	
	 userDao.insert(user);
	}

	@Transactional
	@Override
	public boolean getUserEmailId(String email) {
		return userDao.getUserEmailId(email);
	}
  
	@Transactional
	@Override
	public boolean getUserPassword(String password, String email) {
		return userDao.getUserPassword(password, email);
	}

	@Transactional
	@Override
	public List<User> getUserDetails(String email) {
		return userDao.getUserDetails(email);
	}



	
}