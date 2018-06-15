package com.bridgelabz.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.bridgelabz.model.FourWheeler;
import com.bridgelabz.model.TwoWheeler;
import com.bridgelabz.model.Vehicle;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
     Vehicle vehicle=new Vehicle();
     vehicle.setVehicleName("Car");
     
     TwoWheeler bike=new TwoWheeler();
     bike.setVehicleName("Bike");
     bike.setSteeringHandle("Bike Steering Handle");
    
     FourWheeler car=new FourWheeler();
     car.setVehicleName("Car");
     car.setSteeringWheel("Porsche Steering Wheel");
     
     SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
     Session session=sessionFactory.openSession();
     session.beginTransaction();
     session.save(vehicle);
     session.save(bike);
     session.save(car);
     session.beginTransaction().commit();
     session.close();
    }
}
