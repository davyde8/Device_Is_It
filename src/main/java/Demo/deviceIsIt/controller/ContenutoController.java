package Demo.deviceIsIt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Demo.deviceIsIt.model.Commento;
import Demo.deviceIsIt.model.Contenuto;
import Demo.deviceIsIt.model.Device;
import Demo.deviceIsIt.model.Utente;
import Demo.deviceIsIt.persistance.DBManager;

@Controller
public class ContenutoController {
	
	@PostMapping("Contenuto")
	public String getContenuto(HttpSession session, Model model, @RequestParam Integer id) {
		
		Contenuto cont = DBManager.getInstance().ContenutoDAO().findByPrimaryKey(id);
		model.addAttribute(cont);

		List <Commento> commenti = DBManager.getInstance().CommentoDAO().findByContenuto(id);
		
		for (Commento c: commenti) {
			c.setutente(DBManager.getInstance().utenteDAO().findUsername(c.getutente()));
		}
		
		model.addAttribute("listaCommenti",commenti);
		return "ContenutoRichiesto";
	}
	
	@GetMapping("newRecensione")
	public String newRecensioneSmartphone(HttpSession session, Model model) {
		
		int tipoContenuto= 2;
		String titoloContenuto= "Nuova Recensione";
		
		model.addAttribute("titoloContenuto", titoloContenuto );
		model.addAttribute("tipoContenuto", tipoContenuto);
		
		return "creaContenuto";
	}
	
	@GetMapping("newArticolo")
	public String newArticolo(HttpSession session, Model model) {
		
		int tipoContenuto= 1;
		String titoloContenuto= "Nuovo Articolo";
		model.addAttribute("titoloContenuto", titoloContenuto );
		model.addAttribute("tipoContenuto", tipoContenuto);
	
		return "creaContenuto";
	}
	
		
	@GetMapping("newDevice")
	public String newSchedaTecnicaSmartphone(HttpSession session, Model model) {
		
		String titoloContenuto= "Nuovo Device";
		model.addAttribute("titoloContenuto", titoloContenuto );
		
		return "creaDevice";
	}
		
	
	 @PostMapping("setContenuto")
	public String setContenuto(HttpSession session, Model model, @RequestParam Integer idContenuto ) {
		
		String titoloContenuto="";
		Contenuto contenuto = DBManager.getInstance().ContenutoDAO().findByPrimaryKey(idContenuto);
		if(contenuto.getTipo()==1)
			titoloContenuto= "Modifica Articolo";
		else
			titoloContenuto= "Modifica Recensione";
		
		model.addAttribute("contenuto", contenuto );
		model.addAttribute("titoloContenuto", titoloContenuto);
		model.addAttribute("tipoContenuto", contenuto.getTipo());
		
		return "modificaContenuto";
	}
	 
	 @PostMapping("deleteContenuto")
		public String deleteContenuto(HttpSession session, Model model, @RequestParam Integer idContenuto ) {
		
		 List<Commento> commenti= DBManager.getInstance().CommentoDAO().findByContenuto(idContenuto);
		 for (int i = 0; i<commenti.size(); i++)
			 DBManager.getInstance().CommentoDAO().delete(commenti.get(i).getidcommento());
		 
		 DBManager.getInstance().ContenutoDAO().delete(idContenuto);
		 
			return "redirect:/";
		}
	
	 @PostMapping("setDevice")
		public String setDevice(HttpSession session, Model model, @RequestParam Integer idDevice ) {
			
		 	String titoloContenuto="Modifica Device";		
		 	Device device = DBManager.getInstance().deviceDAO().findByPrimaryKey(idDevice);
					
			model.addAttribute("device", device );
			model.addAttribute("titoloContenuto", titoloContenuto);
			model.addAttribute("tipoDevice", device.getTipoDevice());
			
			return "modificaDevice";
		}
	 
	 @PostMapping("setProfilo")
		public String setProfilo(HttpSession session, Model model, @RequestParam String email ) {
			
		 	Utente u = DBManager.getInstance().utenteDAO().findByPrimaryKey(email);
			model.addAttribute("utente", u );

			
			return "modificaProfilo";
		}
	 
	 
	 @PostMapping("deleteDevice")
		public String deleteDevice(HttpSession session, Model model, @RequestParam Integer idDevice ) {
		
		 DBManager.getInstance().deviceDAO().delete(idDevice);
		 
			return "redirect:/";
		}
	 
	 
	 @GetMapping("ricercaUtenti")
		public String risultato() {					
			return "ricercaUtenti";
		}
	 
	 
	
}
