package com.bridgelabz.aop;

import java.util.Arrays;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class CalculatorLoggingAspect {
 private Log log=LogFactory.getLog(this.getClass());
 
 public void logBefore(JoinPoint joinPoint)
 { 
  log.info("The method "+joinPoint.getSignature().getName()+" () begins with "+Arrays.toString(joinPoint.getArgs()));	
  System.out.println("Object : "+joinPoint.getTarget());  // Get Object    
 }
 
 public void logAfter(JoinPoint joinPoint)
 {
  log.info("The method "+joinPoint.getSignature().getName()+" () ends");	 
 }
 
 public void logAfterReturning(JoinPoint joinPoint,Object result)
 {
  log.info("The Method "+joinPoint.getSignature().getName()+" () end with "+result);	 
 }
 
 public void logAfterThrowing(JoinPoint joinPoint,IllegalArgumentException e)
 {
  log.error("Illegal argument "+Arrays.toString(joinPoint.getArgs())+" in "+joinPoint.getSignature().getName()+" ()");	 
 }
 
 public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable 
 {

	 try {
		 
	 log.info("The method " + joinPoint.getSignature().getName()+ "() begins with " + Arrays.toString(joinPoint.getArgs())); //Before Advice
	 Object result = joinPoint.proceed();
	 log.info("The method " + joinPoint.getSignature().getName()+ "() ends with " + result); //After Returning
	 return result;
	 } catch (IllegalArgumentException e) {
     //After Throwing
     log.error("Illegal argument "
	 + Arrays.toString(joinPoint.getArgs()) + " in "+ joinPoint.getSignature().getName() + "()");
	 throw e;
   }
  // After Finally..!
 }
}