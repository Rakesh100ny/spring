package com.bridgelabz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView displayIndex(HttpServletRequest request,HttpServletResponse response )
	{
	 ModelAndView mv=new ModelAndView("index");
	 return mv;
	}
	
	@RequestMapping(value="/display", method=RequestMethod.POST)
	public ModelAndView indexExecute(@RequestParam("t1") int i,@RequestParam("t2") int j)
	{
     int k=i+j;
     System.out.println("k : "+k);
     ModelAndView mv=new ModelAndView();
     mv.setViewName("display");
     mv.addObject("results", k);
     return mv;
	}
	
	
}
