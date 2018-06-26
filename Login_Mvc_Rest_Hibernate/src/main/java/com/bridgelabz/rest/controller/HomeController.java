package com.bridgelabz.rest.controller;

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
	public ResponseEntity<Void> registerUser(@RequestBody @Validated User user, BindingResult result,HttpServletRequest request) {
		System.out.println("Creating User with unique Email-Id " + user.getEmail());

		if (userService.isUserExist(user.getEmail())) {
			System.out.println("A User with Email-Id " + user.getEmail() + " Already Exist");
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}

		userService.insert(user);
		
		
		return new ResponseEntity<Void>(HttpStatus.CREATED);

	}

	/*-------------------------------Login a User-----------------------------------------------*/

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<User> loginUser(@RequestBody @Validated User user, BindingResult result) {
		System.out.println("Creating User with unique Email-Id " + user.getEmail());

		if (!userService.isCheckPassword(user.getPassword(), user.getEmail())) {
			System.out.println(
					"A User with Email-Id " + user.getEmail() + " and Password " + user.getPassword() + " is Invalid");
			return new ResponseEntity<User>(HttpStatus.CONFLICT);
		}

		user= userService.getUserDetails(user.getEmail());

		return new ResponseEntity<User>(user, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/tokenvalue/{token}",method=RequestMethod.GET)
	public ResponseEntity<String> token(@PathVariable("token") String token){
		
		/*user=userService.
		user.setActivated(true);
		
		System.out.println("isActivated : "+user.isActivated());*/
		
		return new ResponseEntity<String>("User is Successfully Activated...!",HttpStatus.OK);
	}

}
