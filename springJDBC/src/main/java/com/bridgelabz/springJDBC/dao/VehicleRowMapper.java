package com.bridgelabz.springJDBC.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.bridgelabz.springJDBC.model.Vehicle;

public class VehicleRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		Vehicle vehicle=new Vehicle();
		vehicle.setVehicleNo(rs.getString("VEHICLE_NO"));
		vehicle.setColor(rs.getString("COLOR"));
		vehicle.setWheel(rs.getInt("WHEEL"));
		vehicle.setSeat(rs.getInt("SEAT"));
		return vehicle;
	
	}

}
