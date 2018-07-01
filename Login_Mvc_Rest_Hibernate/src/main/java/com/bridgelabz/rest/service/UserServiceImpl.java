package com.bridgelabz.rest.service;

import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bridgelabz.rest.dao.UserDao;
import com.bridgelabz.rest.exception.UserNotFoundException;
import com.bridgelabz.rest.jms.MessageSender;
import com.bridgelabz.rest.model.EmailModel;
import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;
import com.bridgelabz.rest.utility.RedisUtility;
import com.bridgelabz.rest.utility.Token;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private User user;

	@Autowired
	private EmailModel emailModel;

	@Autowired
	private MessageSender messageSender;

	@Autowired
	private RedisUtility redisUtility;

	@Transactional
	@Override
	public void insert(RegisterModel registerModel, HttpServletRequest request) {
		user.setFirstName(registerModel.getFirstName());
		user.setLastName(registerModel.getLastName());
		user.setEmail(registerModel.getEmail());
		user.setPassword(registerModel.getPassword());
		user.setMobileNo(registerModel.getMobileNo());

		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		System.out.println("password : " + user.getPassword());

		userDao.insert(user);

		System.out.println("User Id : " + user.getId());

		String token = Token.generateToken(user.getId());

		System.out.println("Token : " + token);

		StringBuffer URL = request.getRequestURL();
		System.out.println("URL : " + URL);

		String url = "<a href=" + URL.substring(0, URL.lastIndexOf("/")) + "/verifytoken/" + token + " ></a>";
		/*
		 * System.out.println("Url : "+url);
		 */
		String subject = "link to activate your account";

		emailModel.setSubject(subject);
		emailModel.setTo(user.getEmail());
		emailModel.setUrl(url);

		messageSender.sendMessage(emailModel);

		redisUtility.saveToken(Integer.toString(user.getId()), token);

		String tokenValue = redisUtility.getSaveToken(Integer.toString(user.getId()));

		System.out.println("Saved Token in Redis : " + tokenValue);

	}

	@Transactional
	@Override
	public boolean isUserExist(String email) {
		long count = userDao.isUserExist(email);

		System.out.println("count : " + count);

		if (count >= 1) {
			return true;
		} else {
			return false;
		}

	}

	@Transactional
	@Override
	public boolean isCheckCredentials(String password, String email) {
		User user = userDao.isCheckPassword(email);

		if (user != null) {
			if (BCrypt.checkpw(password, user.getPassword()) && user.isActivated() == true) {
				System.out.println("r1");
				return true;
			} else {
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
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Transactional
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public EmailModel getEmailModel(String token, HttpServletRequest request, User user) {
		StringBuffer URL = request.getRequestURL();
		System.out.println("URL : " + URL);

		String url = "<a href=" + URL.substring(0, URL.lastIndexOf("/")) + "/resetpassword/" + token + " ></a>";

		String subject = "link to rest your password";

		emailModel.setTo(user.getEmail());
		emailModel.setSubject(subject);
		emailModel.setUrl(url);
		return emailModel;
	}

	@Transactional
	@Override
	public void isVerified(String token) {
		String storedToken = null;
		try {
			storedToken = redisUtility.getSaveToken(Token.getParseJWT(token));
			System.out.println("isvarified storedToken : "+storedToken);
			redisUtility.expireSaveToken(Token.getParseJWT(token));
			if (storedToken.equals(token)) {

				User user = getUserById(Integer.parseInt(Token.getParseJWT(token)));

				if (user != null) {
					user.setActivated(true);
					updateUser(user);

				} else {
					throw new UserNotFoundException("User Not Found...!");
				}
			}
		} catch (NumberFormatException | SignatureException | UserNotFoundException e) {
			System.err.println("Exception [UserServiceImp.java] : " + e.getMessage());
		}

	}

	@Transactional
	@Override
	public void forgotPassword(String email, HttpServletRequest request) {
		User user = getUserDetails(email);
		if (user != null) {
			String token = Token.generateToken(user.getId());

			redisUtility.saveToken(Integer.toString(user.getId()), token);

			EmailModel emailModel = getEmailModel(token, request, user);

			messageSender.sendMessage(emailModel);

		} else {
			try {
				throw new UserNotFoundException("User Not Found...!");
			} catch (UserNotFoundException e) {
				e.printStackTrace();
			}
		}
	}

	@Transactional
	@Override
	public void restPassword(String token, String password) {
		System.out.println("rakesh2");
		try {
			String storedToken = redisUtility.getSaveToken(Token.getParseJWT(token));
			System.out.println("storedToken : "+storedToken);
			redisUtility.expireSaveToken(Token.getParseJWT(token));
			if (storedToken.equals(token)) {
				System.out.println("r1");
				User user = getUserById(Integer.parseInt(Token.getParseJWT(token)));

				
				if (user != null) {
					user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
					System.out.println("password : " + user.getPassword());

					updateUser(user);

				} else {
					throw new UserNotFoundException("User Not Found...!");
				}
			} else {
				System.out.println("Token is not matched");
			}
		} catch (SignatureException | UserNotFoundException e) {
			e.printStackTrace();
		}

	}
}
