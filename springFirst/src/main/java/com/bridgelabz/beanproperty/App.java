package com.bridgelabz.beanproperty;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
     
	ApplicationContext context=new ClassPathXmlApplicationContext("com/bridgelabz/beanproperty/spring.xml");	
	
	Tyre t=(Tyre)context.getBean("tyre");
	System.out.println(t);
	
	}

}
