package com.bridgelabz.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


import com.bridgelabz.dao.JDBCOperation;



public class BackEndValidation implements Filter {

    /**
     * Default constructor. 
     */
    public BackEndValidation() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 response.setContentType("text/html"); 
		 PrintWriter printWriter=response.getWriter(); 
		 String register=request.getParameter("register");
		 String login=request.getParameter("login");
		 String fName=request.getParameter("fname");
		 String lName=request.getParameter("lname");
		 String email=request.getParameter("email");
		 String password=request.getParameter("password");
		
		 
		
		 
		 if(register==null)
		 {
		  register="xyz";	 
		 }
		 else
		 if(login==null)
		 {
		  login="xyz";	 
		 }
		
		 
		 try
		 {
		 if(register.equals("register"))
		 {
				if(fName.equals("") || lName.equals("") || email.equals("") || password.equals(""))
				{
				 printWriter.println("<h3 class=\"text-danger text-center\">Blank Fields Not Allowed - All Fields Compulsory...!</h3>");
				 RequestDispatcher requestDispatcher=request.getRequestDispatcher("register");  
				 requestDispatcher.include(request, response);		
				}
				else
				{
					System.out.println("r3");
				 boolean ok1 = false,ok2=false,ok3=false;	
				 char str[]=fName.toCharArray();
				 String msg="";
				 
				 if(str.length<=10)
				 {
				  for(int i=0;i<str.length;i++)
				  {
				   if(((str[i]>='a' && str[i]<='z') || (str[i]>='A' && str[i]<='Z')) || str[i]==' ')
				   {
					ok1=true;
				   }
				   else
				   {
					ok1=false;
					msg="First Name Must be String";
				   }
				  }
				 }
				 else
				 {
				  ok1=false;
				  msg="Enter First Name, Maximum length 10 Character";
				 }
					
				 char arr[]=lName.toCharArray();
				 
				 
				 if(arr.length<=10)
				 {
				  for(int i=0;i<arr.length;i++)
				  {
				   if(((arr[i]>='a' && arr[i]<='z') || (arr[i]>='A' && arr[i]<='Z')) || arr[i]==' ')
				   {
					ok2=true;
				   }
				   else
				   {
					ok2=false;
					msg="Last Name Must Be String";
				   }
				  }
				 }
				 else
				 {
				  ok2=false;
				  msg="Enter Last Name, Maximum length 10 Character";
				 }
				 
				 ok3=JDBCOperation.getUserEmailId(email);
				 
				 if(ok3==true)
				 {
				  msg="User is Already Exist...Please Enter Unique Information"; 	 
				 }
				 
			
				 if(ok1==true && ok2==true && ok3==false)
				 {
					 chain.doFilter(request, response);  	 
				 }
				 else
				 {
				  printWriter.println("<h3 class=\"text-danger text-center\"> "+msg+"</h3>");
				  RequestDispatcher requestDispatcher=request.getRequestDispatcher("register");  
				  requestDispatcher.include(request, response); 
				 }
				 
				}
			 
		 }
		 else
		 if(login.equals("login"))
		 {
			
				if(email.equals("") || password.equals(""))
				{
				 printWriter.println("<h3 class=\"text-danger text-center\">Blank Fields Not Allowed - All Fields Compulsory...!</h3>");
				 RequestDispatcher requestDispatcher=request.getRequestDispatcher("login");  
				 requestDispatcher.include(request, response);	
				}
				else
				{
				 boolean ok=false;	
				 
				 String msg="";
				 
				 
				 ok=JDBCOperation.getUserPassword(password,email);
				   
				
			
				 if(ok)
				 {			
				  chain.doFilter(request, response);  	 
				 }
				 else
				 {
				  msg="Login Id and Password is Invalid...!";	 
				  printWriter.println("<h3 class=\"text-danger text-center\"> "+msg+"</h3>");
				  RequestDispatcher requestDispatcher=request.getRequestDispatcher("login");  
				  requestDispatcher.include(request, response);	 
				 }
				 
				}
		 
		  }
		 }
		 catch(NullPointerException e)
		 {
		  System.err.println("Null Pointer [BackEndValidation.java] : "+e.getMessage());	 
		 }
		 
		 
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
