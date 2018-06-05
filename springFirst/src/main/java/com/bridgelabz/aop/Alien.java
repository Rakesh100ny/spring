package com.bridgelabz.aop;

import org.springframework.stereotype.Component;
//Aspect Oriented Programming
//Cross cuting concern -> Aspect

@Component
public class Alien
{
 public void show()
 {
   // log -> 2 lines	
  // security -> 1 lines
  // transaction -> Begin
	 
  // 15 statements -> Business Logic
	 
  // transaction -> commit	 
  System.out.println("Hello World");
  
 //log -> 2 lines
 }
}
