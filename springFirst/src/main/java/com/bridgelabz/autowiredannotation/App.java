package com.bridgelabz.autowiredannotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
     
	ApplicationContext context=new ClassPathXmlApplicationContext("com/bridgelabz/autowiredannotation/spring.xml");	
	
    Car car=(Car)context.getBean("car");
	car.drive();
	}

}
