package com.bridgelabz.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bridgelabz.springJDBC.dao.VehicleDao;
import com.bridgelabz.springJDBC.model.Vehicle;


public class Main {

	public static void main(String[] args) {
		ApplicationContext context =new ClassPathXmlApplicationContext("beans.xml");
				VehicleDao vehicleDao = (VehicleDao) context.getBean("vehicleDao");
				Vehicle vehicle = new Vehicle("TEM0002", "Black", 5, 5);
				vehicleDao.insert(vehicle);
				vehicle = vehicleDao.findByVehicleNo("TEM0001");
				System.out.println("Vehicle No: " + vehicle.getVehicleNo());
				System.out.println("Color: " + vehicle.getColor());
				System.out.println("Wheel: " + vehicle.getWheel());
				System.out.println("Seat: " + vehicle.getSeat());
	}

}
