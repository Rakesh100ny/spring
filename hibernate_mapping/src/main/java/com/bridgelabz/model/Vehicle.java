package com.bridgelabz.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
public class Vehicle {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String vehicleName;
	
/*	if vehicle has not owner/user then hibernate throw Exception 
 *  So sometime to ignoe and handles those type Exception i just use 
 *  @NotFound annotation which is org.hibernate.annotations.NotFound provide 
 *  not provide by JPA------------------------------------------------------
   
	@ManyToOne
	@NotFound(action=NotFoundAction.IGNORE)
	private Employee employee;

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}*/

	
	/* -----------ManyToMany------------
	  
    @ManyToMany(mappedBy="vehicle")
	private Collection<Employee> employees = new ArrayList<Employee>();

	public Collection<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(Collection<Employee> employees) {
		this.employees = employees;
	}*/

	/*
	 * ----------ManyToOne Relaitionships------------
	 * 
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="EMP_ID") private Employee employee;
	 * 
	 * public Employee getEmployee() { return employee; }
	 * 
	 * public void setEmployee(Employee employee) { this.employee = employee; }
	 */
	


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVehicleName() {
		return vehicleName;
	}

	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}

}
