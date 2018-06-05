package com.bridgelabz.dao;

 

import com.bridgelabz.model.Student;


public interface JdbcOperations
{
	int getStudentId();
	
	boolean insert(Student student);

	boolean update(Student student, int choice);

	boolean delete(Student student);

	Student display();
}
