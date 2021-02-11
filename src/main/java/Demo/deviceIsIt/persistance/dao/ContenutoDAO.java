package Demo.deviceIsIt.persistance.dao;

import java.util.List;
import Demo.deviceIsIt.model.Contenuto;

public interface ContenutoDAO {

	public void save(Contenuto contenuto);  // Create  == insert/store
	public void saveWithoutDevice(Contenuto contenuto);
	public Contenuto findByPrimaryKey(int idContenuto);     // Retrieve  == select stud
	public List<Contenuto> findAll();     //  select*
	public List<Contenuto> findArticoli();
	public List<Contenuto> findRecensioni();
	public List<Contenuto> findLastThreeArticoli();
	public List<Contenuto> findLastThreeRecensioni();
	public void update(Contenuto c); //Update
	public void updateWithoutDevice(Contenuto c); //Update
	public void delete(int idContenuto); //Delete	
	public List<Contenuto> findByTipology(Integer tipologia);
	public List<Contenuto> findRecensioniPc();
	public List<Contenuto> findRecensioniSmartphone();
	public List<Contenuto> researchResultArticoli(String string);
	public List<Contenuto> researchResultRecensioni(String string);
	public int getNumCommenti(int idContenuto); 
	public boolean existRecensione(Integer idDevice);
	public Contenuto getRecensioneByDevice(Integer idDevice);
	
}
