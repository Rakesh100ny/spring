package com.bridgelabz.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan({"com.bridgelabz"})
public class springDemoWebConfig
{
 @Bean	
 public InternalResourceViewResolver viewResolver()
 {
  InternalResourceViewResolver vr=new InternalResourceViewResolver();
  vr.setPrefix("/WEB-INF/view/");
  vr.setSuffix(".jsp");
  
  return vr;
	 
 }
/* @Bean
 public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/bs/");
}*/
}
