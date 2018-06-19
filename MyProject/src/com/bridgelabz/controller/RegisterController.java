package com.bridgelabz.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bridgelabz.dao.JDBCOperation;

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	 response.setContentType("text/html"); 
	 PrintWriter printWriter=response.getWriter();	
	 String fName=request.getParameter("fname");
	 String lName=request.getParameter("lname");
	 String email=request.getParameter("email");
	 String password=request.getParameter("password");
	 
	 boolean flag=JDBCOperation.insertRegister(fName, lName, email, password);
	 
	 if(flag)
	 {
	  printWriter.println("<h3 class=\"text-info text-center\">User Record is successfully Inserted...!</h3>");
	
	 }
	 else
	 {
	  printWriter.println("<h3 class=\"text-danger text-center\">User Record is failed...!</h3>");
	  RequestDispatcher requestDispatcher=request.getRequestDispatcher("register");
	  requestDispatcher.forward(request, response);
	 }
	}

}
