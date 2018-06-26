package com.bridgelabz.rest.service;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.bridgelabz.rest.dao.UserDao;
import com.bridgelabz.rest.model.User;
import com.bridgelabz.rest.utility.EmailUtility;
import com.bridgelabz.rest.utility.Token;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Transactional
	@Override
	public void insert(User user) 
	{
	 user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));	
	 System.out.println("password : "+user.getPassword());
	 userDao.insert(user);
	 
	 String token=Token.generateToken(user.getId());
	 
	 System.out.println("Token : "+token);
	 
	 String url ="<a href='http://localhost:8080/Login_Mvc_Rest_Hibernate/tokenvalue/"+token+"' ></a>";
	 System.out.println("Url : "+url);
	 
	 String subject = "link to activate your account";
	 
	 try {
		EmailUtility.sendEmail(user.getEmail(), subject, url);
	} catch (AddressException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (MessagingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	}

	@Transactional
	@Override
	public boolean isUserExist(String email) {
		long count=userDao.isUserExist(email);
		
		System.out.println("count : "+count);

		if(count>=1)
		 {
          return true;
		 }
		 else
		 {
		  return false;	 
		 }

	}
  
	@Transactional
	@Override
	public boolean isCheckPassword(String password, String email) {
		User user=userDao.isCheckPassword(password, email);
		
		if(user!=null)
		{
			if(BCrypt.checkpw(password, user.getPassword())) 
			{
				return true;
			}
			else
			{
			  return false;	
			}	
		}
		return false;
		
	}

	@Transactional
	@Override
	public User getUserDetails(String email) {
		return userDao.getUserDetails(email);
	}

}