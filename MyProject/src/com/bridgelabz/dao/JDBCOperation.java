package com.bridgelabz.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bridgelabz.model.User;

import java.sql.Statement;

import java.sql.Connection;

public class JDBCOperation
{
	public static Connection getConnection() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/myuser";
		String user = "root";
		String password = "root";
		Connection connection = null;

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.err.println("\nCNF alert[DBConnectionManager.java] - " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("\nSQL alert[DBConnectionManager.java] - " + e.getMessage());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;

	}
	
	public static int getUserId()
	{
		int userId=0;	
	 Connection connection=getConnection();
	 try {
		Statement statement=connection.createStatement();
		ResultSet resultSet=statement.executeQuery("select max(id) as userid from register");
		resultSet.next();
		userId=resultSet.getInt("userid");
		
		if(userId==0)
		{
	     userId=1;
	    }
		else
		{
		 userId++;	
		}
	} catch (SQLException e) {
		System.err.println("\nSQL alert[JDBCOperation.java] - " + e.getMessage());
		
	}
	 
		
	 return userId;	
	}
	
  public static boolean insertRegister(String fName,String lName,String email,String password)
  {

   try {
	   User user=new User();
	   user.setId(getUserId());
	   user.setFirstName(fName);
	   user.setLastName(lName);
	   user.setEmail(email);
	   user.setPassword(password);
	   Connection connection=getConnection();
	   PreparedStatement insUser = connection.prepareStatement("insert into register values(?,?,?,?,?)");
	   
	   insUser.setInt(1, user.getId());
	   insUser.setString(2, user.getFirstName());
	   insUser.setString(3, user.getLastName());
	   insUser.setString(4, user.getEmail());
	   insUser.setString(5, user.getPassword());
	   
	   int rowAffected=insUser.executeUpdate();
	   
	   if(rowAffected>0)
	   {
		  return true; 
	   }
	   else
	   {
		  return false; 
	   }
	   
   } catch (SQLException e) {
	 System.err.println("Sql alert[JDBCOperation.java] : "+e.getMessage());
   }
   
   return false;
  }
  
  public static boolean getUserEmailId(String email)
  {
	   Connection connection=getConnection();
	   try {
		PreparedStatement getUserEmailId = connection.prepareStatement("select email from register");
		ResultSet resultSet=getUserEmailId.executeQuery();
		
		while(resultSet.next())
		{
		 if(resultSet.getString("email").equals(email))
		 {
		  return true;
		 }
		 else
		 {
		  return false;	 
		 }
		}
	} catch (SQLException e) {
		 System.err.println("Sql alert[JDBCOperation.java] : "+e.getMessage());
	}
	return false;
	  
  }

public static boolean getUserPassword(String password,String email) {
	   Connection connection=getConnection();
	   try {
		PreparedStatement getUserPassword = connection.prepareStatement("select password from register where email=?");
		getUserPassword.setString(1, email);
		ResultSet resultSet=getUserPassword.executeQuery();
		resultSet.next();
		
		 if(resultSet.getString("password").equals(password))
		 {
		  
	 
		  return true;
		 }
		 else
		 {
		  
	 		  return false;	 
		 }
		
	} catch (SQLException e) {
		 System.err.println("Sql alert[JDBCOperation.java] : "+e.getMessage());
	}
	return false;
}
 	
public static ResultSet getUserDetails(String email) {
	   Connection connection=getConnection();
	   ResultSet resultSet=null;
	   try {
		PreparedStatement getUserInfo = connection.prepareStatement("select * from register where email=?");
		getUserInfo.setString(1, email);
	    resultSet=getUserInfo.executeQuery();
	   
		 
		
	} catch (SQLException e) {
		 System.err.println("Sql alert[JDBCOperation.java] : "+e.getMessage());
	}
	return resultSet;
}


}
