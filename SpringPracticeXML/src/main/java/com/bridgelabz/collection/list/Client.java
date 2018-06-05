package com.bridgelabz.collection.list;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


public class Client {

	public static void main(String[] args) {
		ApplicationContext context=new GenericXmlApplicationContext("list.xml");
		SequenceGenerator generator=(SequenceGenerator)context.getBean("sequenceGenerator");
		System.out.println(generator.getSequence());
		System.out.println(generator.getSequence());
	}

}
