package com.bridgelabz.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseUtill {
	public static void close(Statement statement) {
		try {
			if (statement != null) {
				statement.close();
			}
		}  catch (SQLException e) {
			  System.err.println("Sql alert[DatabaseUtill.java] : "+e.getMessage());	
			}
			catch (Exception e) {
           e.printStackTrace();
			}
	}

	public static void close(PreparedStatement preparedStatement) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
		}  catch (SQLException e) {
			  System.err.println("Sql alert[DatabaseUtill.java] : "+e.getMessage());	
			}
			catch (Exception e) {
           e.printStackTrace();
			}
	}

	public static void close(ResultSet resultSet) {
	
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
				  System.err.println("Sql alert[DatabaseUtill.java] : "+e.getMessage());	
				}
				catch (Exception e) {
                 e.printStackTrace();
				}
			}
	}

	
	public static void close(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
			}
		}  catch (SQLException e) {
			  System.err.println("Sql alert[DatabaseUtill.java] : "+e.getMessage());	
			}
			catch (Exception e) {
           e.printStackTrace();
			}
	}

}
