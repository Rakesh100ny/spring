package com.bridgelabz.controller;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bridgelabz.model.User;
import com.bridgelabz.service.UserService;
import com.bridgelabz.utility.EmailUtility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping("/")
	public ModelAndView redirectState() {
		return new ModelAndView("redirect:/register");
	}

	@RequestMapping(value = "/forgot", method = RequestMethod.GET)
	public ModelAndView displayForgot(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("userForgotPass");
	}

	@RequestMapping(value = "/forgotProcess", method = RequestMethod.POST)
	public ModelAndView forgotProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		ModelAndView modelAndView=null;
		boolean flag = userService.getUserEmailId(user.getEmail());

		if (flag) 
		{
			String subject = "PASSWORD RECOVERY";
			User userInfo=userService.getUserDetails(user.getEmail());
			String content = "Your Password is " + userInfo.getPassword();
			try 
			{
			 EmailUtility.sendEmail(user.getEmail(),subject,content);
			} catch (AddressException e) 
			{
				e.printStackTrace();
			} catch (MessagingException e) 
			{
				e.printStackTrace();
			}
		    finally 
	        {
		     modelAndView = new ModelAndView("Result");
			 modelAndView.addObject("msg", "The e-mail was sent successfully");
            }
		}
		else 
		{
			modelAndView = new ModelAndView("forgot");
			modelAndView.addObject("error", "Please Enter Correct Email-Id...!");

		}
       return modelAndView;
	
	}
	
	
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public ModelAndView displayResult(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("Result");
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView displayRegister(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView registerProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {
		System.out.println("ranu");
		int userId = userService.getUserId();
		user.setId(userId);
		userService.insert(user);

		return new ModelAndView("redirect:/login");

	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public ModelAndView displayLoginPage(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView displayLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("login");
		modelAndView.addObject("msg", "Registration Successfully...Please Login");

		return modelAndView;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {

		ModelAndView modelAndView = null;
		user = userService.getUserDetails(user.getEmail());
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		System.out.println("--------------------------");
		System.out.println("id : " + user.getId());
		System.out.println("fName : " + user.getFirstName());
		System.out.println("lName : " + user.getLastName());
		System.out.println("email : " + user.getEmail());
		System.out.println("password : " + user.getPassword());

		modelAndView = new ModelAndView("redirect:/welcome");

		return modelAndView;
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView displayWelcome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("user") != null) {
			System.out.println("rakesh");
			modelAndView = new ModelAndView("welcome");
			modelAndView.addObject("user", session.getAttribute("user"));

		} else {
			System.out.println("soni");
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("msg", "Please Login First");
		}

		return modelAndView;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		System.out.println("logout");
		session.removeAttribute("user");
		session.invalidate();

		return new ModelAndView("login");

	}
}
