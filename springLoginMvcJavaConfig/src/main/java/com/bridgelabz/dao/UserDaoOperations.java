package com.bridgelabz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bridgelabz.model.User;

@Repository
public class UserDaoOperations implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public UserDaoOperations() {
	}

	@Override
	public int getUserId() {
	 String sql="select max(id) as userId from register";
	 int userId=jdbcTemplate.queryForInt(sql);
	
	 if(userId==0)
	  userId=1;
	 else
	  userId++;	
	 
	 return userId;
	}

	@Override
	public boolean insert(User user)
	{
		System.out.println("userId Dao : "+user.getId());
		String sql = "insert into register values(?,?,?,?,?)";
		int rowAffected=jdbcTemplate.update(sql, new Object[] {user.getId(),user.getFirstName(),user.getLastName(),user.getEmail(),user.getPassword() });
		if (rowAffected > 0) {
			return true;
		} else {
			return false;
		}		
		
	}

	@Override
	public boolean getUserEmailId(String email) {
		
		String sql="SELECT COUNT(*) FROM register WHERE email=?";
		int result=jdbcTemplate.queryForObject(sql,Integer.class, new Object[] {email});
		
		System.out.println("result Dao : "+result);
			 
		     if(result>=1)
			 {
			  return true;
			 }
			 else
			 {
			  return false;	 
			 }
	}

	@Override
	public boolean getUserPassword(String password, String email) {
		String sql="select password from register where email=?";
		String result=jdbcTemplate.queryForObject(sql, new Object[] {email}, String.class);
				
		System.out.println("password Dao : "+result);
		 if(result.equals(password))
		 {
		  return true;
		 }
		 else
		 {
		  return false;	 
		 }
	}

	@Override
	public User getUserDetails(String email) {
		String sql="select * from register where email=?";
		User user=(User) jdbcTemplate.queryForObject(sql, new Object[] {email},new UserRowMapper());
		
		return user;
	}
	
	

}
