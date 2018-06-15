package com.bridgelabz.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Employee_Details")
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String empName;

	/* 
	  When Employee has car but here i didnot save session
	  then hibernate doesnot automatically save b'coz Vehicle has...
	  Vehicle has an Entity that's why i want to persist it to save automatically..
	  then i just used cascade=CascadeType.PERSIST and i just persist employee by...
	  persist method shown in App.java....!
	*/
	@OneToMany(cascade=CascadeType.PERSIST)
	private Collection<Vehicle> vehicles=new ArrayList<Vehicle>();
	
	public Collection<Vehicle> getVehicles() {
		return vehicles;
	}

	public void setVehicles(Collection<Vehicle> vehicles) {
		this.vehicles = vehicles;
	}
/*  ----------------ManyToMany------------------     
     @ManyToMany
	private Collection<Vehicle> vehicle = new ArrayList<Vehicle>();


	public Collection<Vehicle> getVehicle() {
		return vehicle;
	}

	public void setVehicle(Collection<Vehicle> vehicle) {
		this.vehicle = vehicle;
	}
*/

    /*	----------OneToMany Relaitionship----------
    @OneToMany(mappedBy="employee")
	@JoinTable(name="EMP_VEHICLE",joinColumns=@JoinColumn(name="EMP_ID"),inverseJoinColumns=@JoinColumn(name="VEHICLE_ID"))
	private Collection<Vehicle> vehicle = new ArrayList<Vehicle>();

	public Collection<Vehicle> getVehicle() {
		return vehicle;
	}

	public void setVehicle(Collection<Vehicle> vehicle) {
		this.vehicle = vehicle;
	}
*/



	/*
	  ----------- OneToOne Relaitionship----------
	  
	  @OneToOne
	  
	  @JoinColumn(name="VEHICLE_ID")
      private Vehicle vehicle;
	  
	  public Vehicle getVehicle() { return vehicle; }
	  
	  public void setVehicle(Vehicle vehicle) { this.vehicle = vehicle; }
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

}
