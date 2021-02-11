package Demo.deviceIsIt.persistance.dao;

import java.util.List;

import Demo.deviceIsIt.model.TipologiaDevice;

public interface TipologiaDeviceDAO {
	public void save(TipologiaDevice tipoDevice);  // Create  == insert/store
	public TipologiaDevice findByPrimaryKey(int idTipologia);     // Retrieve  == select stud
	public List<TipologiaDevice> findAll();     //  select*
	public void update(TipologiaDevice tipoDevice); //Update
	public void delete(TipologiaDevice tipoDevice); //Delete	

}
