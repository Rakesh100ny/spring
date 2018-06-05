package com.bridgelabz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bridgelabz.model.Student;

public class StudentRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
	    Student student=new Student();
	    student.setStudId(rs.getInt(1));
	    student.setStudFirstName("stud_fName");
	    student.setStudLastName("stud_lName");
	    student.setStudAddress("stud_address");
	    student.setStudDepartment("stud_dept");
	    student.setStudMobileNo(6);
	    
	    
		return student;
	}

}
