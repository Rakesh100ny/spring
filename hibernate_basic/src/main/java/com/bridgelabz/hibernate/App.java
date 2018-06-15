package com.bridgelabz.hibernate;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bridgelabz.model.Address;
import com.bridgelabz.model.Employee;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
        Employee emp=new Employee();
		emp.setFirstName("Rakesh");
		emp.setLastName("Baberwal");
		emp.setDept("IT");
        emp.setDate(new Date());
        emp.setDescription("Description of the user goes here");

/*		Employee emp2 = new Employee();
		emp2.setFirstName("Vikas");
		emp2.setLastName("Baberwal");
		emp2.setDept("CSE");
        emp2.setDate(new Date());
        emp2.setDescription("Description of the user goes here");
*/
        /*---------Address Object Implimentation----------- 
       
        Address address1=new Address();
        address1.setStreet("Pokrana ki gali");
        address1.setCity("Jaitaran");
        address1.setPincode("306302");
        address1.setState("Rajasthan");
      
        
        
        Address address2=new Address();
        address2.setStreet("devnar");
        address2.setCity("Mumbai");
        address2.setPincode("500001");
        address2.setState("Maharashtra");
      
        
        emp1.setHomeAddress(address1);
        emp1.setOfficeAddress(address2);
        
        
        address2.setStreet("silk board");
        address2.setCity("Banglore");
        address2.setPincode("560102");
        address2.setState("Karnartaka");
      
        emp2.setHomeAddress(address1);
        emp2.setOfficeAddress(address2);
*/        
       
        
  /*----------Set Approaches-----------
        
        Address address1=new Address();
        address1.setStreet("Pokrana ki gali");
        address1.setCity("Jaitaran");
        address1.setPincode("306302");
        address1.setState("Rajasthan");
      
        
        
        Address address2=new Address();
        address2.setStreet("devnar");
        address2.setCity("Mumbai");
        address2.setPincode("500001");
        address2.setState("Maharashtra");
        
        emp1.getListOfAddresses().add(address1);
        emp1.getListOfAddresses().add(address2);
        
        address2.setStreet("silk board");
        address2.setCity("Banglore");
        address2.setPincode("560102");
        address2.setState("Karnartaka");
      
       emp2.getListOfAddresses().add(address1);
       emp2.getListOfAddresses().add(address2);
     
        */

      /*----------Coolection Approaches-----------
              
        Address address1=new Address();
        address1.setStreet("Pokrana ki gali");
        address1.setCity("Jaitaran");
        address1.setPincode("306302");
        address1.setState("Rajasthan");
      
        
        
        Address address2=new Address();
        address2.setStreet("devnar");
        address2.setCity("Mumbai");
        address2.setPincode("500001");
        address2.setState("Maharashtra");
        
        emp1.getListOfAddresses().add(address1);
        emp1.getListOfAddresses().add(address2);
        
      */
        
        Address address1=new Address();
        address1.setStreet("Pokrana ki gali");
        address1.setCity("Jaitaran");
        address1.setPincode("306302");
        address1.setState("Rajasthan");
      
        
        
        Address address2=new Address();
        address2.setStreet("devnar");
        address2.setCity("Mumbai");
        address2.setPincode("500001");
        address2.setState("Maharashtra");
        
        emp.getListOfAddresses().add(address1);
        emp.getListOfAddresses().add(address2);
        
       
       SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(emp);
		session.getTransaction().commit();
		session.close();
	
        emp=null;
		
		session=sessionFactory.openSession();
        emp = session.get(Employee.class,1);
        session.close(); // session is close but EGER initialzation so load the size before the session close. 
		System.out.println("Address Size     : "+emp.getListOfAddresses().size());
		
	/*	System.out.println("id          : "+emp1.getId());
		System.out.println("First_Name  : "+emp1.getFirstName());
		System.out.println("Last_Name   : "+emp1.getLastName());
		System.out.println("Address     : "+emp1.getListOfAddresses());
		System.out.println("Department  : "+emp1.getDept());
		System.out.println("Join_Date   : "+emp1.getDate());
		System.out.println("Description : "+emp1.getDescription());
    */		
	/*	Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(emp);
		tx.commit();
		session.close();
    */
 }
}
