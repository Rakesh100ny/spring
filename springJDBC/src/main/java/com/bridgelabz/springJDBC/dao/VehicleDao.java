package com.bridgelabz.springJDBC.dao;

import com.bridgelabz.springJDBC.model.Vehicle;

public interface VehicleDao {
	
	void insert(Vehicle vehicle);
	/*void update(Vehicle vehicle);
	void delete(Vehicle vehicle);*/
	Vehicle findByVehicleNo(String vehicleNo);
}
