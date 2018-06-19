package com.bridgelabz.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bridgelabz.dao.JDBCOperation;
import com.bridgelabz.model.User;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		response.setContentType("text/html");
		
		String email=request.getParameter("email");
		
						
		
		
			ResultSet resultSet = JDBCOperation.getUserDetails(email);
            User user=new User();
           
            HttpSession session = request.getSession();
   		    
   		
            
            try {
				while (resultSet.next()) {
					user.setId(resultSet.getInt(1));
					user.setFirstName(resultSet.getString(2));
					user.setLastName(resultSet.getString(3));
					user.setEmail(resultSet.getString(4));
					user.setPassword(resultSet.getString(5));
					session.setAttribute("user",user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
            response.sendRedirect("welcome");

		
		
	 }

}
