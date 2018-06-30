package com.bridgelabz.rest.controller;

 import java.security.SignatureException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.bridgelabz.rest.model.LoginModel;
import com.bridgelabz.rest.model.RegisterModel;
import com.bridgelabz.rest.model.User;
import com.bridgelabz.rest.service.UserService;
import com.bridgelabz.rest.validation.UserValidation;

@RestController
public class HomeController {
	@Autowired
	UserService userService;

   	@Autowired
	private UserValidation userValidation;

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

	@RequestMapping(value = "/tokenvalue/{token:.+}", method = RequestMethod.GET)
	public ResponseEntity<String> token(@PathVariable("token") String token) throws SignatureException {

		System.out.println("Token : " + token);
		System.out.println("Ranu");

		boolean flag = userService.getUserById(token);

		if (flag) {
			return new ResponseEntity<String>("User is Successfully Activated...!", HttpStatus.OK);
		}

		return new ResponseEntity<String>("User is not Successfully Activated...!", HttpStatus.CONFLICT);

	}

}
