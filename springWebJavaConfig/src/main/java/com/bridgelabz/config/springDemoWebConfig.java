package com.bridgelabz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan({"com.bridgelabz.controller"})
public class springDemoWebConfig
{
 @Bean	
 public InternalResourceViewResolver viewResolver()
 {
  InternalResourceViewResolver vr=new InternalResourceViewResolver();
  vr.setPrefix("/JSP/");
  vr.setSuffix(".jsp");
  
  return vr;
	 
 }
 	
}
