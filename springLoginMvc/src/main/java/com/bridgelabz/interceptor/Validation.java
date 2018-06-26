package com.bridgelabz.interceptor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bridgelabz.service.UserService;

public class Validation extends HandlerInterceptorAdapter {
	private static final String EMAIL_REGEX = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	// static Pattern object, since pattern is fixed
	private static Pattern pattern;

	// non-static Matcher object because it's created from the input String
	private Matcher matcher;

	public Validation() {
		pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
	}

	public boolean validateEmail(String email) {
		matcher = pattern.matcher(email);
		return matcher.matches();
	}
	
	@Autowired
	UserService userService;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String registerPress = request.getParameter("register");
		String loginPress = request.getParameter("login");
		String senMailPress = request.getParameter("sendMail");
		String fName = request.getParameter("firstName");
		String lName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		System.out.println("registerPress : " + registerPress);
		System.out.println("loginPress    : " + loginPress);
		System.out.println("sendMailPress : " + senMailPress);
		
		if (registerPress == null) {
			registerPress = "xyz";
		} 
		
		if (loginPress == null) {
			loginPress = "xyz";
		}
		
		if(senMailPress==null)
		{
		 senMailPress="xyz";	
		}
			
		System.out.println("registerPress : " + registerPress);
		System.out.println("loginPress    : " + loginPress);
		System.out.println("sendMailPress : " + senMailPress);

		if (registerPress.equals("register")) {
			System.out.println("r1");
			if (fName.equals("") || lName.equals("") || email.equals("") || password.equals("")) {
				System.out.println("r2");
				ModelAndView modelAndView = new ModelAndView("register");
				modelAndView.addObject("error", "Blank Fields Not Allowed - All Fields Compulsory...!");
				throw new ModelAndViewDefiningException(modelAndView);
			} else {
				System.out.println("r3");
				boolean ok1 = false, ok2 = false, ok3 = false, ok4 = false;

				char str[] = fName.toCharArray();
				String error = "";

				if (str.length <= 10) {
					for (int i = 0; i < str.length; i++) {
						if (((str[i] >= 'a' && str[i] <= 'z') || (str[i] >= 'A' && str[i] <= 'Z')) || str[i] == ' ') {
							ok1 = true;
						} else {
							ok1 = false;
							error = "First Name Must be String";
						}
					}
				} else {
					ok1 = false;
					error = "Enter First Name, Maximum length 10 Character";
				}

				char arr[] = lName.toCharArray();

				if (arr.length <= 10) {
					for (int i = 0; i < arr.length; i++) {
						if (((arr[i] >= 'a' && arr[i] <= 'z') || (arr[i] >= 'A' && arr[i] <= 'Z')) || arr[i] == ' ') {
							ok2 = true;
						} else {
							ok2 = false;
							error = "Last Name Must Be String";
						}
					}
				} else {
					ok2 = false;
					error = "Enter Last Name, Maximum length 10 Character";
				}

				ok3 = userService.getUserEmailId(email);

				if (ok3) {
					error = "User is Already Exist...Please Enter Unique Information";
				}

				System.out.println("ok1 : " + ok1);
				System.out.println("ok2 : " + ok2);
				System.out.println("ok3 : " + ok3);
				System.out.println("ok4 : " + ok4);

				ok4 = validateEmail(email);

				System.out.println("ok4 : " + ok4);

				if (!ok4) {
					error = "Invalid Email-Id...Please Enter correct Email-Id";
				}

				if (ok1 && ok2 && !ok3 && ok4) {
					return true;
				} else {
					ModelAndView modelAndView = new ModelAndView("register");
					modelAndView.addObject("error", error);
					throw new ModelAndViewDefiningException(modelAndView);
				}

			}

		} else if (loginPress.equals("login")) {
			System.out.println("r1");

			if (email.equals("") || password.equals("")) {
				System.out.println("r2");
				ModelAndView modelAndView = new ModelAndView("login");
				modelAndView.addObject("error", "Blank Fields Not Allowed - All Fields Compulsory...!");
				throw new ModelAndViewDefiningException(modelAndView);
			} else {
				System.out.println("r3");
				boolean ok = userService.getUserPassword(password, email);

				if (ok) {
					return true;
				} else {

					ModelAndView modelAndView = new ModelAndView("login");
					modelAndView.addObject("error", "Login Id and Password is Invalid...!");
					throw new ModelAndViewDefiningException(modelAndView);
				}

			}

		}
		else
		if(senMailPress.equals("sendMail"))
		{
			if (email.equals(""))
			{
				System.out.println("r1");
				ModelAndView modelAndView = new ModelAndView("userForgotPass");
				modelAndView.addObject("error", "Blank Fields Not Allowed - All Fields Compulsory...!");
				throw new ModelAndViewDefiningException(modelAndView);
			}
			else
			{
				System.out.println("r2");

				boolean ok = validateEmail(email);

				System.out.println("ok : " + ok);

	
				if (ok) {
					return true;
				} else {

					ModelAndView modelAndView = new ModelAndView("forgot");
					modelAndView.addObject("error", "Invalid Email-Id...Please Enter correct Email-Id");
					throw new ModelAndViewDefiningException(modelAndView);
				}
			}
		}

		return false;
	}
}
