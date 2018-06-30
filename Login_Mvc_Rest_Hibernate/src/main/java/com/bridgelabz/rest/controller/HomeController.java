package com.bridgelabz.rest.controller;

 import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bridgelabz.rest.exception.UserNotFoundException;
import com.bridgelabz.rest.jms.MessageSender;
import com.bridgelabz.rest.model.EmailModel;
import com.bridgelabz.rest.model.ForgotModel;
import com.bridgelabz.rest.model.LoginModel;
import com.bridgelabz.rest.model.PasswordModel;
import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;
import com.bridgelabz.rest.service.UserService;
import com.bridgelabz.rest.utility.Token;
import com.bridgelabz.rest.validation.UserValidation;

@RestController
public class HomeController {
	@Autowired
	UserService userService;

   	@Autowired
	private UserValidation userValidation;
   	
   	@Autowired
   	private MessageSender messageSender;

   	
   	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(userValidation);
	}

	/*-------------------------------Register a User-----------------------------------------------*/

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Void> registerUser(@Validated @RequestBody RegisterModel registerModel, BindingResult result,
			HttpServletRequest request) {
		System.out.println("Creating User with unique Email-Id " + registerModel.getEmail());

		if (userService.isUserExist(registerModel.getEmail())) {
			System.out.println("A User with Email-Id " + registerModel.getEmail() + " Already Exist");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}
		
		if(result.hasErrors())
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);	
		}
		
		System.out.println("URL : "+request.getRequestURL());
		userService.insert(registerModel,request);

		return new ResponseEntity<Void>(HttpStatus.CREATED);

	}

	/*-------------------------------Login a User-----------------------------------------------*/

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<User> loginUser(@Validated @RequestBody LoginModel loginModel, BindingResult result) throws UserNotFoundException {
		System.out.println("Creating User with unique Email-Id " + loginModel.getEmail());

		if(result.hasErrors())
		{
			return new ResponseEntity<User>(HttpStatus.BAD_REQUEST);	
		}

		if(!userService.isUserExist(loginModel.getEmail()))
		{
		 throw new UserNotFoundException("User Not Found...!");	
		}
		
		if (!userService.isCheckCredentials(loginModel.getPassword(), loginModel.getEmail())) {
			System.out.println("A User with Email-Id " + loginModel.getEmail() + " and Password " + loginModel.getPassword() + " is Invalid");
			return new ResponseEntity<User>(HttpStatus.CONFLICT);
		}

	
		User user = userService.getUserDetails(loginModel.getEmail());

		return new ResponseEntity<User>(user, HttpStatus.OK);
	}

	@RequestMapping(value = "/verifytoken/{token:.+}", method = RequestMethod.GET)
	public ResponseEntity<String> token(@PathVariable("token") String token) throws UserNotFoundException, NumberFormatException, SignatureException {

		System.out.println("Token : " + token);
		System.out.println("Ranu");

		User user= userService.getUserById(token);
		
		if (user != null) {
			user.setActivated(true);
			userService.updateUser(user);
			return new ResponseEntity<String>("User is Successfully Activated...!", HttpStatus.OK);
		} else {
			 throw new UserNotFoundException("User Not Found...!");	
		}

	}
	
	@RequestMapping(value="/forgotpassword",method=RequestMethod.POST)
	public ResponseEntity<String> forgotpassword(@Validated @RequestBody ForgotModel forgotModel, BindingResult result,HttpServletRequest request) throws UserNotFoundException
	{
		if(result.hasErrors())
		{
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);	
		}	
		
		System.out.println("forgot Email : "+forgotModel.getEmail());
		
	 User user=userService.getUserDetails(forgotModel.getEmail());
	 
	 System.out.println("User : "+user);
	  
	 if(user!=null)
	 {
	  String token=Token.generateToken(user.getId());
	  
	  EmailModel emailModel= userService.getEmailModel(token,request,user);
	  	 
	  messageSender.sendMessage(emailModel);
		return new ResponseEntity<String>("Reset Password...!", HttpStatus.OK);

	 }
	 else
	 {
		 throw new UserNotFoundException("User Not Found...!");
	 }
	 
	 
		
	}
	
	@RequestMapping(value = "/resetpassword/{token:.+}", method = RequestMethod.POST)
	public ResponseEntity<String> restpassword(@Validated @RequestBody PasswordModel passwordModel,@PathVariable("token") String token) throws SignatureException, UserNotFoundException {

		System.out.println("Token : " + token);

		User user= userService.getUserById(token);
		
		if (user != null) {
			user.setPassword(BCrypt.hashpw(passwordModel.getPassword(), BCrypt.gensalt(12)));
			System.out.println("password : " + user.getPassword());

			userService.updateUser(user);
			return new ResponseEntity<String>("Password is Successfully Updated...!", HttpStatus.OK);
		} else {
			 throw new UserNotFoundException("User Not Found...!");	
		}


	}

}
