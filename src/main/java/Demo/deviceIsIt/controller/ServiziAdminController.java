package Demo.deviceIsIt.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import Demo.deviceIsIt.model.Utente;
import Demo.deviceIsIt.persistance.DBManager;


@RestController
public class ServiziAdminController {

	
	@PostMapping("findUtenti")
	public String cercaUtenti(HttpSession session, @RequestBody Utente utente) {
		
		List<Utente>utentiTrovati= DBManager.getInstance().utenteDAO().findByName(utente.getNome());			
		
		if(utentiTrovati.size()!=0) {
			session.setAttribute("utentiTrovati", utentiTrovati);			
			return "success";
		}
		else {
			return "fail";
		}				
	}
	
	
}
