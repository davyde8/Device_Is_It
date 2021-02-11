package Demo.deviceIsIt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Demo.deviceIsIt.model.Commento;
import Demo.deviceIsIt.model.Utente;
import Demo.deviceIsIt.persistance.DBManager;

@Controller
public class UtentiController {
	
	@PostMapping("home/Aggiornamento")
	public String aggiorna(@RequestParam String firstname, @RequestParam String lastname,  @RequestParam String email, @RequestParam String password ){
		
		Utente u = new Utente(); //!!!!!!!!!!controllare che i campi non inseriti siano vuoti e non null per i controlli sottostanti
		u.setEmail(email);
		
		Utente newu = new Utente();
		if(!firstname.equals(""))
			newu.setNome(firstname);
		if(!lastname.equals(""))
			newu.setCognome(lastname);
		if(!password.equals(""))
			newu.setPassword(password);
		
		DBManager.getInstance().utenteDAO().update(u, newu); // aggiorniamo l'utente sul db
		
		System.out.println("works");
		
		return "index";
	}
	
	@PostMapping("deleteUser")
	public String deleteUtente(HttpSession session, Model model,  @RequestParam String email) {
		
		List<Commento> commenti= DBManager.getInstance().CommentoDAO().findByUser(email);
		 for (int i = 0; i<commenti.size(); i++)
			 DBManager.getInstance().CommentoDAO().delete(commenti.get(i).getidcommento());
		
		 System.out.println("commenti eliminati");

		System.out.println("Email da eliminare: " + email);
		
		DBManager.getInstance().utenteDAO().delete(email);;
		
		return "redirect:/doLogout";
	}
	
	@PostMapping("deleteUserByAdmin")
	public String deleteUser(HttpSession session, Model model,  @RequestParam String email) {
		
		List<Commento> commenti= DBManager.getInstance().CommentoDAO().findByUser(email);
		 for (int i = 0; i<commenti.size(); i++)
			 DBManager.getInstance().CommentoDAO().delete(commenti.get(i).getidcommento());				
		
		DBManager.getInstance().utenteDAO().delete(email);;
		
		return "redirect:/listaUtenti";
	}
	
	@PostMapping("blockUser")
	public String bloccaUser(HttpSession session, Model model,  @RequestParam String email) {

		DBManager.getInstance().utenteDAO().setBloccato(email);			
		
		return "redirect:/listaUtenti";
	}
	
	@PostMapping("unblockUser")
	public String sbloccaUser(HttpSession session, Model model,  @RequestParam String email) {	
		
		DBManager.getInstance().utenteDAO().setSbloccato(email);
		
		return "redirect:/listaUtenti";
	}
	
}
