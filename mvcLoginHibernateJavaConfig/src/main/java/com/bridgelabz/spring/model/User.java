package com.bridgelabz.spring.model;

import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name="User_Info")
public class User {
	
	@Id
	@Column(name="User_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="User_fName")
	private String firstName;
	
	@Column(name="User_lName")
	private String lastName;

	@Column(name="User_mailId")
	private String email;
	
	@Column(name="User_pass")
	private String password;


	public User() 
	{
	
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}