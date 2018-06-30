package com.bridgelabz.rest.service;

import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.bridgelabz.rest.dao.UserDao;
import com.bridgelabz.rest.jms.MessageSender;
import com.bridgelabz.rest.model.EmailModel;
import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;
import com.bridgelabz.rest.utility.Token;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Autowired
	User user;
	
/*	@Autowired
	EmailModel emailModel;
*/	
	@Autowired
	MessageSender messageSender;
	
	@Transactional
	@Override
	public void insert(RegisterModel registerModel,HttpServletRequest request) 
	{
	 user.setFirstName(registerModel.getFirstName());
	 user.setLastName(registerModel.getLastName());
	 user.setEmail(registerModel.getEmail());
	 user.setPassword(registerModel.getPassword());
	 user.setMobileNo(registerModel.getMobileNo());
	 	
	
	 user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));	
	 System.out.println("password : "+user.getPassword());
	 
	 userDao.insert(user);
	 
	 System.out.println("User Id : "+user.getId());
	 	
	 String token=Token.generateToken(user.getId());
	 
	 System.out.println("Token : "+token);
	 
	 StringBuffer URL=request.getRequestURL();
	 System.out.println("URL : "+URL);
	 
	 String url ="<a href="+URL.substring(0, URL.lastIndexOf("/"))+"/tokenvalue/"+token+" ></a>";
/*	 System.out.println("Url : "+url);
*/	 
	 String subject = "link to activate your account";
	 
	 EmailModel emailModel=new EmailModel();
	 emailModel.setSubject(subject);
	 emailModel.setTo(user.getEmail());
	 emailModel.setUrl(url);
	 
	 
	 messageSender.sendMessage(emailModel);
	
	 
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
	public boolean isCheckCredentials(String password, String email) {
		User user=userDao.isCheckPassword(email);
		
		if(user!=null)
		{
			if(BCrypt.checkpw(password, user.getPassword()) && user.isActivated()==true) 
			{
				System.out.println("r1");
				return true;
			}
			else
			{
				System.out.println("r2");
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

	@Transactional
	@Override
	public boolean getUserById(String token)
	{
		try {
			User user=userDao.getUserById(Integer.parseInt(Token.getParseJWT(token)));
			
			if(user!=null)
			{
			 user.setActivated(true);
			  updateUser(user);
			  return true;
			}
			else
			{
				System.out.println("Something was wrong...!");
				return false;
			}
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Transactional
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

}