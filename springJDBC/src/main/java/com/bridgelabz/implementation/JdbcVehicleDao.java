package com.bridgelabz.implementation;


/*import com.bridgelabz.springJDBC.dao.JdbcDaoSupport;
*/
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import com.bridgelabz.springJDBC.dao.VehicleDao;
import com.bridgelabz.springJDBC.dao.VehicleRowMapper;
import com.bridgelabz.springJDBC.model.Vehicle;

public  class JdbcVehicleDao extends JdbcDaoSupport implements VehicleDao {
	
			
		public void insert(final Vehicle vehicle) {
			String sql = "INSERT INTO vehicle (VEHICLE_NO, COLOR, WHEEL, SEAT) "
			+ "VALUES (?, ?, ?, ?)";
			getJdbcTemplate().update(sql, new Object[] { vehicle.getVehicleNo(),
			vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat() });
			}	
			
	public void update(Vehicle vehicle)
	{
		String sql = "UPDATE vehicle SET color = ? WHERE vehicle_no = ?";
			    vehicle.setColor("tan");
			    vehicle.setVehicleNo("TEM0002");
				getJdbcTemplate().update(sql, new Object[] {vehicle.getColor(), vehicle.getVehicleNo()});	
	}

	public void delete(Vehicle vehicle) 
	{
		String sql = "delete from vehicle where vehicle_no = ?";
	    vehicle.setVehicleNo("TEM00010");
		getJdbcTemplate().update(sql, new Object[] { vehicle.getVehicleNo()});	
	}
	

	public Vehicle findByVehicleNo(String vehicleNo) {
		String sql = "SELECT * FROM vehicle WHERE VEHICLE_NO = ?";
		Vehicle vehicle = (Vehicle) getJdbcTemplate().queryForObject(sql,
		new Object[] { vehicleNo }, new VehicleRowMapper());
		return vehicle;
		}
		
		}




