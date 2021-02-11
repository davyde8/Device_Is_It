package Demo.deviceIsIt.persistance.dao;

import java.util.List;

import Demo.deviceIsIt.model.Device;

public interface DeviceDAO {
	
	public void save(Device device);  // Create
	public Device findByPrimaryKey(Integer idDevice);     // Retrieve
	public List<Device> findAll();       
	public void update(Device device); //Update
	public void delete(int  idDevice); //Delete	
	public List<Device> findByTipology(Integer tipologia);
	public List<Device> findByModello(String tipologia);
	public List<Device> researchResultSmartphone(String string);
	public List<Device> researchResultComputer(String string);
	
}
