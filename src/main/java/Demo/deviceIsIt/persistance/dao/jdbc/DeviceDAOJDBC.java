package Demo.deviceIsIt.persistance.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Demo.deviceIsIt.model.Device;
import Demo.deviceIsIt.persistance.DBSource;
import Demo.deviceIsIt.persistance.dao.DeviceDAO;

public class DeviceDAOJDBC implements DeviceDAO {
	
	DBSource dbSource;
	
	public DeviceDAOJDBC(DBSource dbSource) {
		this.dbSource= dbSource;
	}
	
	@Override
	public void save(Device device) {
		Connection conn;
		try {
			conn = dbSource.getConnection();
			String query = "insert into device values(default,?,?,?,?,?,?,?,?,?,?,?,?);"; // prendiamo la query
			PreparedStatement st = conn.prepareStatement(query); // creiamo lo statement
			st.setString(1, device.getModello());
			st.setString(2, device.getMarca());
			st.setInt(3, device.getTipoDevice());
			st.setString(4, device.getMemoria());
			st.setString(5, device.getRam());
			st.setString(6, device.getDisplay());
			st.setString(7, device.getBatteria());
			st.setString(8, device.getFotocamera());
			st.setString(9, device.getCPU());
			st.setString(10, device.getPeso());
			st.setString(11, device.getOs());
			st.setString(12, device.getImg());
			st.executeUpdate();
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Device findByPrimaryKey(Integer idDevice) {
		Device device = new Device();
		try {
			
			Connection con = dbSource.getConnection();
			String query = "select * from device where id=?;";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, idDevice);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {				
				device.setIdDevice(rs.getInt("id"));				
				device.setModello(rs.getString("modello"));
				device.setMarca(rs.getString("marca"));
				device.setTipoDevice(rs.getInt("tipodevice"));
				device.setMemoria(rs.getString("memoria"));
				device.setRam(rs.getString("ram"));
				device.setDisplay(rs.getString("display"));
				device.setBatteria(rs.getString("batteria"));
				device.setFotocamera(rs.getString("fotocamera"));
				device.setCPU(rs.getString("cpu"));
				device.setPeso(rs.getString("peso"));
				device.setOs(rs.getString("os"));
				device.setImg(rs.getString("img"));				
			}
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return device;
	}

	@Override
	public List<Device> findAll() {
		List<Device> devices = new ArrayList <Device>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select * from device";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Device device = new Device();
				device.setIdDevice(rs.getInt("id"));				
				device.setModello(rs.getString("modello"));
				device.setMarca(rs.getString("marca"));
				device.setTipoDevice(rs.getInt("tipodevice"));
				device.setMemoria(rs.getString("memoria"));
				device.setRam(rs.getString("ram"));
				device.setDisplay(rs.getString("display"));
				device.setBatteria(rs.getString("batteria"));
				device.setFotocamera(rs.getString("fotocamera"));
				device.setCPU(rs.getString("cpu"));
				device.setPeso(rs.getString("peso"));
				device.setOs(rs.getString("os"));
				device.setImg(rs.getString("img"));
				devices.add(device);				
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return devices;
	}

	@Override
	public void update(Device device) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update device SET modello = ?, marca = ?, tipoDevice = ?, memoria = ?, ram=?, display = ?, batteria = ?, fotocamera = ?, cpu = ?, peso = ?, os = ?, img = ? WHERE id=?;";
			PreparedStatement st = connection.prepareStatement(update);			
			st.setString(1, device.getModello());
			st.setString(2, device.getMarca());
			st.setInt(3, device.getTipoDevice());
			st.setString(4, device.getMemoria());
			st.setString(5, device.getRam());
			st.setString(6, device.getDisplay());
			st.setString(7, device.getBatteria());
			st.setString(8, device.getFotocamera());
			st.setString(9, device.getCPU());
			st.setString(10, device.getPeso());
			st.setString(11, device.getOs());
			st.setString(12, device.getImg());
			st.setInt(13, device.getIdDevice());
			st.executeUpdate();
			st.close();
		
		} catch (SQLException e) {
			e.printStackTrace();			
		}
	}

	@Override
	public void delete(int idDevice) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String delete = "delete FROM device WHERE id = ?;";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, idDevice);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	@Override
	public List<Device> findByTipology(Integer tipologia) {
		List<Device> devices = new ArrayList <Device>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select * from device where tipodevice=?;";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1, tipologia);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Device device = new Device();
				device.setIdDevice(rs.getInt("id"));				
				device.setModello(rs.getString("modello"));
				device.setMarca(rs.getString("marca"));
				device.setTipoDevice(rs.getInt("tipodevice"));
				device.setMemoria(rs.getString("memoria"));
				device.setRam(rs.getString("ram"));
				device.setDisplay(rs.getString("display"));
				device.setBatteria(rs.getString("batteria"));
				device.setFotocamera(rs.getString("fotocamera"));
				device.setCPU(rs.getString("cpu"));
				device.setPeso(rs.getString("peso"));
				device.setOs(rs.getString("os"));
				device.setImg(rs.getString("img"));
				devices.add(device);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return devices;
	}
	
	
	

	@Override
	public List<Device> findByModello(String modello) {	
		
			String cerca="%"+modello+"%";
			List<Device> devices = new ArrayList <Device>();
			
			try {
				Connection con = dbSource.getConnection();
				String query = "select * from device where modello Ilike ?;";
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, cerca);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					Device device = new Device();
					device.setIdDevice(rs.getInt("id"));				
					device.setModello(rs.getString("modello"));
					device.setMarca(rs.getString("marca"));
					device.setTipoDevice(rs.getInt("tipodevice"));
					device.setMemoria(rs.getString("memoria"));
					device.setRam(rs.getString("ram"));
					device.setDisplay(rs.getString("display"));
					device.setBatteria(rs.getString("batteria"));
					device.setFotocamera(rs.getString("fotocamera"));
					device.setCPU(rs.getString("cpu"));
					device.setPeso(rs.getString("peso"));
					device.setOs(rs.getString("os"));
					device.setImg(rs.getString("img"));
					devices.add(device);
				}
				st.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return devices;		
	}

	@Override
	public List<Device> researchResultSmartphone(String string) {
		List<Device> devices = new ArrayList <Device>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select *  from device where modello ILIKE ? or marca ILIKE ? or memoria ILIKE ? or "
								   + "ram ILIKE ? or display ILIKE ? or batteria ILIKE ? or fotocamera ILIKE ? or cpu ILIKE ? or "
								   + "peso ILIKE ? or os ILIKE ? group by(id) having tipodevice=1;"; 
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, string);
			st.setString(2, string);
			st.setString(3, string);
			st.setString(4, string);
			st.setString(5, string);
			st.setString(6, string);
			st.setString(7, string);
			st.setString(8, string);
			st.setString(9, string);
			st.setString(10, string);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Device device = new Device();
				device.setIdDevice(rs.getInt("id"));				
				device.setModello(rs.getString("modello"));
				device.setMarca(rs.getString("marca"));
				device.setTipoDevice(rs.getInt("tipodevice"));
				device.setMemoria(rs.getString("memoria"));
				device.setRam(rs.getString("ram"));
				device.setDisplay(rs.getString("display"));
				device.setBatteria(rs.getString("batteria"));
				device.setFotocamera(rs.getString("fotocamera"));
				device.setCPU(rs.getString("cpu"));
				device.setPeso(rs.getString("peso"));
				device.setOs(rs.getString("os"));
				device.setImg(rs.getString("img"));
				devices.add(device);
			}
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return devices;
	}

	@Override
	public List<Device> researchResultComputer(String string) {
		List<Device> devices = new ArrayList <Device>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select *  from device where marca ILIKE ? or modello ILIKE ? or memoria ILIKE ? or "
								   + "ram ILIKE ? or display ILIKE ? or batteria ILIKE ? or fotocamera ILIKE ? or cpu ILIKE ? or "
								   + "peso ILIKE ? or os ILIKE ? group by(id) having tipodevice=2;"; 
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, string);
			st.setString(2, string);
			st.setString(3, string);
			st.setString(4, string);
			st.setString(5, string);
			st.setString(6, string);
			st.setString(7, string);
			st.setString(8, string);
			st.setString(9, string);
			st.setString(10, string);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Device device = new Device();
				device.setIdDevice(rs.getInt("id"));				
				device.setModello(rs.getString("modello"));
				device.setMarca(rs.getString("marca"));
				device.setTipoDevice(rs.getInt("tipodevice"));
				device.setMemoria(rs.getString("memoria"));
				device.setRam(rs.getString("ram"));
				device.setDisplay(rs.getString("display"));
				device.setBatteria(rs.getString("batteria"));
				device.setFotocamera(rs.getString("fotocamera"));
				device.setCPU(rs.getString("cpu"));
				device.setPeso(rs.getString("peso"));
				device.setOs(rs.getString("os"));
				device.setImg(rs.getString("img"));
				devices.add(device);
			}
			st.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return devices;
	}
	
	
	
}
