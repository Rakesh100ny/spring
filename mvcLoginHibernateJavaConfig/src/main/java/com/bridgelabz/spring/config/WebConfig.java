package com.bridgelabz.spring.config;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.bridgelabz.spring.dao.UserDao;
import com.bridgelabz.spring.dao.UserDaoOperations;
import com.bridgelabz.spring.interceptor.Validation;
import com.bridgelabz.spring.service.UserService;
import com.bridgelabz.spring.service.UserServiceImpl;
import com.bridgelabz.spring.utility.EmailUtility;

@Configuration
@EnableWebMvc
@PropertySource("classpath:email.properties")
@ComponentScan(basePackages = "com.bridgelabz.spring")

public class WebConfig implements WebMvcConfigurer {
	
	@Value("${mail.transport.protocol}")
	private String protocol;

	@Value("${mail.host}")
	private String host;

	@Value("${mail.port}")
	private String port;
	
	@Value("${mail.smtp.auth}")
	private String auth;
	
	@Value("${mail.smtp.starttls.enable}")
	private String starttls;
	
	@Value("${mail.user}")
	private String userName;
	
	@Value("${mail.pass}")
	private String password;

	@Bean
	public ViewResolver getViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/bs/");
	}

	@Bean
	public UserDao userDao() {
		return new UserDaoOperations();
	}

	@Bean
	public UserService userService() {
		return new UserServiceImpl();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new Validation(userService())).addPathPatterns("/*Process");
	}

	
	@Bean
	public Session getSession() {
		// We could be more flexible and have auth based on whether there's a username
		// and starttls based on a property.
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", Integer.parseInt(port));
		properties.put("mail.transport.protocol", protocol);
		properties.put("mail.smtp.auth", auth);
		properties.put("mail.smtp.starttls.enable", starttls);

		return Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		});
	}

	@Bean
	public EmailUtility EmailUtility() {
		return new EmailUtility(getSession());
	}

}
