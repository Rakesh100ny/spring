package com.bridgelabz.spring_constructor;

import java.io.IOException;
import java.util.Properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

public class Client {

	public static void main(String[] args) {

		ApplicationContext context=new GenericXmlApplicationContext("beans2.xml");
		Product tv=context.getBean("tv",Battery.class);
		Product cdrw=context.getBean("cdrw",Disc.class);
		Product dvdrw=context.getBean("dvdrw", Disc.class);
		
				
		System.out.println(tv);
		System.out.println(cdrw);
		System.out.println(dvdrw);
		
		
		ShoppingCart cart1 = (ShoppingCart) context.getBean("shoppingCart");
		cart1.addItem(tv);
		cart1.addItem(cdrw);
		System.out.println("Shopping cart 1 contains " + cart1.getItems());
		 
		ShoppingCart cart2 = (ShoppingCart) context.getBean("shoppingCart");
		cart2.addItem(dvdrw);
		System.out.println("Shopping cart 2 contains " + cart2.getItems());
		
		Resource resource = new ClassPathResource("discounts.properties");
		Properties props = null;
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			
			System.err.println("IOExecption [Client.java] : "+e.getMessage());
		}
		
		System.out.println("And don't forget our discounts!");
		System.out.println(props);
		
		
		System.out.println();
		
		Product bestSeller = (Product) context.getBean("bestSeller");
		System.out.println("Best Product in the Market : "+bestSeller);		
	}

}
