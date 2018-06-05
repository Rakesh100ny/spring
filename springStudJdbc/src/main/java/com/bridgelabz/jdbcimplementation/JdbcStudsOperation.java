package com.bridgelabz.jdbcimplementation;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.bridgelabz.dao.JdbcOperations;
import com.bridgelabz.dao.StudentRowMapper;
import com.bridgelabz.model.Student;

public class JdbcStudsOperation extends JdbcDaoSupport implements JdbcOperations 
{

	
	@Override
	public int getStudentId() {
		String sql = "select max(stud_id) as maxid from student";
		int maxid=  getJdbcTemplate().queryForInt(sql);
				
		System.out.println("studId : "+maxid);
		if (maxid == 0)
			maxid = 1;
		else
			maxid++;
		
		return maxid;
	}

	@Override
	public boolean insert(Student student) {
		String sql = "insert into student values(?,?,?,?,?,?)";
			int rowAffected=getJdbcTemplate().update(sql, new Object[] { student.getStudId(),student.getStudFirstName(),
			   student.getStudLastName(),student.getStudAddress(),student.getStudDepartment(),student.getStudMobileNo()});
			if (rowAffected > 0) {
				return true;
			} else {
				return false;
			}
	}

	@Override
	public boolean update(Student student, int choice)
	{
		int rowAffected=0;
		String sql="";
		switch (choice) {
		case 1 :  sql="update student set stud_fName=? where stud_id=?";
		rowAffected=getJdbcTemplate().update(sql, new Object[] {student.getStudFirstName(), student.getStudId()});
			break;

		case 2 : sql="update student set stud_lName=? where stud_id=?";
		         rowAffected=getJdbcTemplate().update(sql, new Object[]{student.getStudLastName(),student.getStudId()});
			
			break;

		case 3 :sql="update student set stud_Address=? where stud_id=?";
		         rowAffected=getJdbcTemplate().update(sql, new Object[] {student.getStudAddress(),student.getStudId()}); 
			
			break;

		case 4 : sql="update student set stud_dept=? where stud_id=?";
		rowAffected=getJdbcTemplate().update(sql, new Object[] {student.getStudDepartment(),student.getStudId()});
			
			break;

		case 5 :sql="update student set stud_mNo=? where stud_id=?";
		rowAffected=getJdbcTemplate().update(sql, new Object[] {student.getStudMobileNo(),student.getStudId()});
			
			break;

		default:System.out.println("\n\t\t\t\tInvalid Choice...!");
			
		}
		if (rowAffected > 0) {
			return true;
		} else {
			return false;
		}
	
	}

	@Override
	public boolean delete(Student student) 
	{
	 String sql="delete from student where stud_id=?";
	 int rowAffected=getJdbcTemplate().update(sql,student.getStudId());
	 if (rowAffected > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Student display() {
		
		String sql="select * from student";
		Student student = (Student) getJdbcTemplate().queryForObject(sql,new StudentRowMapper());
	 return student;
		
	}

	
}
