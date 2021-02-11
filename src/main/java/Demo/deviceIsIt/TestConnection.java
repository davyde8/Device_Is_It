package Demo.deviceIsIt;

import java.util.List;

import Demo.deviceIsIt.model.Utente;
import Demo.deviceIsIt.persistance.DBManager;
import Demo.deviceIsIt.persistance.dao.UtenteDAO;

public class TestConnection {
	
	public static void main(String[] args) {
		UtenteDAO uDao = DBManager.getInstance().utenteDAO();
		List<Utente> utenti = uDao.findAll();
		for (Utente u : utenti) {
			System.out.println(u.getNome());
			System.out.println(u.getCognome());
		}
		
	}

}
