package com.bridgelabz.implementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.bridgelabz.springJDBC.dao.VehicleDao;
import com.bridgelabz.springJDBC.model.Vehicle;

public class JdbcVehicleDao implements VehicleDao {
	private DataSource dataSource;
	public void setDataSource(DataSource dataSource)
	{
	this.dataSource = dataSource;
	}
	
	public void insert(Vehicle vehicle) {
		String sql = "INSERT INTO vehicle (VEHICLE_NO, COLOR, WHEEL, SEAT) "
				+ "VALUES (?, ?, ?, ?)";
				Connection conn = null;
				try {
				conn = dataSource.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, vehicle.getVehicleNo());
				ps.setString(2, vehicle.getColor());
				ps.setInt(3, vehicle.getWheel());
				ps.setInt(4, vehicle.getSeat());
				ps.executeUpdate();
				ps.close();
				} catch (SQLException e) {
				throw new RuntimeException(e);
				} finally {
				if (conn != null) {
				try {
		
					conn.close();
				} catch (SQLException e) {}
				}
				}
				}	

	/*public void update(Vehicle vehicle) {
		
	}

	public void delete(Vehicle vehicle) {

	}*/
	

	public Vehicle findByVehicleNo(String vehicleNo) {
		String sql = "SELECT * FROM vehicle WHERE VEHICLE_NO = ?";
		Connection conn = null;
		try {
		conn = dataSource.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, vehicleNo);
		Vehicle vehicle = null;
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
		vehicle = new Vehicle(rs.getString("VEHICLE_NO"),
		rs.getString("COLOR"), rs.getInt("WHEEL"),
		rs.getInt("SEAT"));
		}
		rs.close();
		ps.close();
		return vehicle;
		} catch (SQLException e) {
		throw new RuntimeException(e);
		} finally {
		if (conn != null) {
		try {
		conn.close();
		} catch (SQLException e) {}
		}
		}
		}

}
