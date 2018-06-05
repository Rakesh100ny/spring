package com.bridgelabz.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

//Advice   ->  What -> Before,After
//PointCut -> Where 

@Component
@Aspect
@EnableAspectJAutoProxy
public class Helper {
    
	@After("execution(public void show())")
	public void log()
	{
	 System.out.println("show called");	
	}
}
