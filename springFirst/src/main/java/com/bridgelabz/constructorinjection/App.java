package com.bridgelabz.constructorinjection;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
     
	ApplicationContext context=new ClassPathXmlApplicationContext("com/bridgelabz/constructorinjection/spring.xml");	
	
	Tyre t=(Tyre)context.getBean("tyre1");
	System.out.println(t);
	
	}

}
