package Demo.deviceIsIt.persistance.dao;

import java.util.List;

import Demo.deviceIsIt.model.TipologiaContenuto;

public interface TipologiaContenutoDAO {

	public void save(TipologiaContenuto tipoContenuto);  // Create  == insert/store
	public TipologiaContenuto findByPrimaryKey(int idTipologia);     // Retrieve  == select stud
	public List<TipologiaContenuto> findAll();     //  select*
	public void update(TipologiaContenuto tipoContenuto); //Update
	public void delete(TipologiaContenuto tipoContenuto); //Delete
	
}
