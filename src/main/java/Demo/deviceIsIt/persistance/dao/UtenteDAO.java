package Demo.deviceIsIt.persistance.dao;

import java.util.List;

import Demo.deviceIsIt.model.Utente;

public interface UtenteDAO {

	public boolean save(Utente utente);  // Create  == insert/store
	public Utente findByPrimaryKey(String email);     // Retrieve  == select stud
	public List<Utente> findAll();     //  select*
	public List<Utente> findAllOtherUsers(String email);     //  select*
	public void update(Utente old, Utente newu); //Update
	public void updateWithoutPsw(Utente old, Utente newu);
	public void delete(String email); //Delete	
	public String findUsername(String email);
	public boolean checkPassword(String email, String password);
	public String getUsername(String email);
	public boolean existsUser(String email);
	public List<Utente> getIscrittiNewsletter();
	public boolean existsUsername (String username);
	public void setPassword(String email, String password); //Update
	public boolean checkBloccato(String email);
	public void setBloccato(String email); //Update
	public void setSbloccato(String email); //Update
	public List<Utente> findByName(String cercaNome);     // Retrieve  == select stud
	
}
