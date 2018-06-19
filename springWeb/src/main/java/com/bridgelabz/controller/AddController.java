package com.bridgelabz.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bridgelabz.service.AddService;

@Controller
public class AddController 
{
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String displayIndex(HttpServletRequest request,HttpServletResponse response)
	{
	 return "index";
	}
	
	
	
	
 @RequestMapping(value="/index",method=RequestMethod.POST)	
 public ModelAndView indexExecute(@RequestParam("t1") int i,@RequestParam("t2") int j)
 {
  AddService addService=new AddService();
  int k = addService.add(i, j);
  ModelAndView modelAndView=new ModelAndView("display");
  modelAndView.addObject("result", k);
  
  return modelAndView; 	 
 }
}
