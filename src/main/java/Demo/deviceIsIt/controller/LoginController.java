package Demo.deviceIsIt.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller // identifica la classe come Servlet
public class LoginController {

		
	@GetMapping("doLogout")	
	public String logout(HttpSession session) {
			session.invalidate();
//			return "logoutSuccess";
			return "redirect:/";
	}
	
	
	
}