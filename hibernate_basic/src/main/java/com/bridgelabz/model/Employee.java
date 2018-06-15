package com.bridgelabz.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Employee_Details")
public class Employee {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String firstName;
	
	private String LastName;
	
	private String dept;
    
	@Temporal(TemporalType.DATE)
	private Date date;
    
	private String description;

	//----------EAGER initialization----------------------
	@ElementCollection(fetch=FetchType.EAGER)
    @JoinTable(name="USER_ADDRESS",joinColumns=@JoinColumn(name="USER_ID"))
	private Collection<Address> listOfAddresses=new ArrayList<Address>();
	
	public Collection<Address> getListOfAddresses() {
		return listOfAddresses;
	}

	public void setListOfAddresses(Collection<Address> listOfAddresses) {
		this.listOfAddresses = listOfAddresses;
	}
	
/* -----------------Collection through hibernate annotation library-------------
 * but in generator has error occured so resolve if tym is available   
 
 	@ElementCollection
    @JoinTable(name="USER_ADDRESS",joinColumns=@JoinColumn(name="USER_ID"))
	@GenericGenerator(strategy="sequence", name = "sequence-gen")
	@CollectionId(columns = { @Column(name="ADDRESS_ID") }, generator = "sequence-gen", type = @Type(type="long"))
    private Collection<Address> listOfAddresses=new ArrayList<Address>();
	
	public Collection<Address> getListOfAddresses() {
		return listOfAddresses;
	}

	public void setListOfAddresses(Collection<Address> listOfAddresses) {
		this.listOfAddresses = listOfAddresses;
	}
*/
	
	/*
   @JoinTable(name="USER_ADDRESS",joinColumns=@JoinColumn(name="USER_ID"))
	@ElementCollection
	private Set<Address> listOfAddresses=new HashSet<Address>();

	public Set<Address> getListOfAddresses() {
		return listOfAddresses;
	}

	public void setListOfAddresses(Set<Address> listOfAddresses) {
		this.listOfAddresses = listOfAddresses;
	}
	*/	
  	
	/*
	@Embedded
	@AttributeOverrides({
	 @AttributeOverride(name="street",column=@Column(name="HOME_STREET_NAME")),
	 @AttributeOverride(name="city",column=@Column(name="HOME_CITY_NAME")),
	 @AttributeOverride(name="state",column=@Column(name="HOME_STATE_NAME")),
	 @AttributeOverride(name="pincode",column=@Column(name="HOME_PIN_CODE"))
	})
	private Address homeAddress;


	@Embedded
	private Address officeAddress;
	
	public Address getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(Address homeAddress) {
		this.homeAddress = homeAddress;
	}

	public Address getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(Address officeAddress) {
		this.officeAddress = officeAddress;
	}*/




	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}


	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}


}
