package com.bridgelabz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bridgelabz.model.User;

public class UserRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user=new User();
		user.setId(rs.getInt("id"));
		user.setFirstName(rs.getString("fName"));
		user.setLastName(rs.getString("lName"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		return user;
	}

}
