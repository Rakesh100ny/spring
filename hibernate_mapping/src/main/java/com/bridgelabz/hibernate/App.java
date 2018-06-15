package com.bridgelabz.hibernate;

import javax.persistence.CascadeType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bridgelabz.model.Employee;
import com.bridgelabz.model.Vehicle;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
     Employee employee=new Employee();
     employee.setEmpName("First Employee");
     
     Vehicle vehicle1=new Vehicle();
     vehicle1.setVehicleName("Car");
     
     Vehicle vehicle2=new Vehicle();
     vehicle2.setVehicleName("Jeep");
     
     
     /*employee.setVehicle(vehicle); //@OneToOne Relationship 
     employee.getVehicle().add(vehicle1);
     employee.getVehicle().add(vehicle2);
     */
     
     /*ManyToOne Relainship
      vehicle1.setEmployee(employee);
      vehicle2.setEmployee(employee);
     */
     
     /*----------ManyToMany RelaitionShip-------
     employee.getVehicle().add(vehicle1);
     employee.getVehicle().add(vehicle2);
     
     vehicle1.getEmployees().add(employee);
     vehicle2.getEmployees().add(employee);
     
     */
     
     employee.getVehicles().add(vehicle1);
     employee.getVehicles().add(vehicle2);
     
     SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
     Session session=sessionFactory.openSession();
     session.beginTransaction();
     /* session.save(employee); //When Employee has car but here i didnot save session....
     session.save(vehicle1);    //then hibernate doesnot automatically save b'coz Vehicle has... 
     session.save(vehicle2);    //Vehicle has an Entity that's why i want to persist it to save automatically..
                                //then i just used cascade=CascadeType.PERSIST and i just persist employee by... 
                                //persist method shown in below....!
                                 
    */                               
     session.persist(employee);                              
     session.getTransaction().commit();
    }
}
