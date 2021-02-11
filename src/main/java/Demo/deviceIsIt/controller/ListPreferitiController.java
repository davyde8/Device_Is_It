package Demo.deviceIsIt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Demo.deviceIsIt.persistance.DBManager;

@Controller
public class ListPreferitiController {
	
	@PostMapping("deletePreferito")
	public String deletePreferito(HttpSession session, Model model, @RequestParam int idDevice) {	
		
		String email = session.getAttribute("usernameLogged").toString();
		
		DBManager.getInstance().ListaPreferitiDAO().deletePreferito(email, idDevice);
		
		return "redirect:/listaPreferiti";
	}

}
