package Demo.deviceIsIt.model;

import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

	private static Mail instance = null; 
	private static String Server="smtp.gmail.com";
	private static String Porta="587";
	private static String myEmail="deviceisit@gmail.com";
	private static String myPass="Password.1";
	private String anteprima="";
	private String titolo="";
	 
	 
	 
	public static Mail getInstance() {
		if (instance == null) {
			instance = new Mail();
		}
		return instance;
	}
	 
	private Mail() {}
	 
	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		String tag1="<h1>";
		String tag2="</h1><br>";
		this.titolo = tag1+titolo+tag2;
	}

	public String getAnteprima() {
		return anteprima;
	}

	public void setAnteprima(String anteprima) {
		this.anteprima = anteprima;
	}

	public void inviaNewsletter(List<Utente> iscritti) throws Exception {
    	 				
        Properties properties = new Properties();

         
         properties.put("mail.smtp.auth", "true");        
         properties.put("mail.smtp.starttls.enable", "true");       
         properties.put("mail.smtp.host", Server);        
         properties.put("mail.smtp.port", Porta);
       
         Session session = Session.getInstance(properties, new Authenticator() {
             @Override
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(myEmail, myPass);
             }
         });
 	 		    		            
         for (Utente u: iscritti) {
			Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(u.getEmail()));
            message.setSubject("Device Is It: un nuovo contenuto ti aspetta!");
            message.setContent(creaEmail(titolo,anteprima), "text/html");
            Transport.send(message);
		}

	}
	
	
	public String ResetPassword(String emailUtente) throws Exception {

			String nuovaPassword=generaPassword();
		    Properties properties = new Properties();
	         
	         properties.put("mail.smtp.auth", "true");	        
	         properties.put("mail.smtp.starttls.enable", "true");	        
	         properties.put("mail.smtp.host", Server);	         
	         properties.put("mail.smtp.port", Porta);
	        
	         Session session = Session.getInstance(properties, new Authenticator() {
	             @Override
	             protected PasswordAuthentication getPasswordAuthentication() {
	                 return new PasswordAuthentication(myEmail, myPass);
	             }
	         });
	 	 		    		            
	         
	        Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(emailUtente));
            message.setSubject("Device Is It: Reset Password");
            message.setContent(creaEmailResetpassword(nuovaPassword), "text/html");
            Transport.send(message);
            
            return nuovaPassword;

	 } 
				
	
		private String generaPassword(){
			
			String AlphaNumericString = 
					 "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789"
	                + "abcdefghijklmnopqrstuvxyz"; 
			
			StringBuilder sb = new StringBuilder(20); 
			
			for (int i = 0; i < 8; i++) { 
				int index  = (int)(AlphaNumericString.length() * Math.random()); 
				sb.append(AlphaNumericString .charAt(index)); 
			} 
	
			return sb.toString();
			
		}
	
		private String creaEmail(String titolo, String testo) {
			String corpoEmail="<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "<head>\r\n"
					+ "  <meta charset=\"utf-8\">\r\n"
					+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
					+ "  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n"
					+ "  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n"
					+ "  <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n"
					+ "  <link href=\"https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap\" rel=\"stylesheet\">\r\n"
					+ "   \r\n"
					+ "</head>\r\n"
					+ "<style>\r\n"
					+ "\r\n"
					+ "#logo{\r\n"
					+ "	font-family: 'Kaushan Script', cursive;\r\n"
					+ "	color:#fec503;\r\n"
					+ "	font-size: 60px;\r\n"
					+ "	margin-right: 15px;\r\n"
					+ "	text-decoration: none;	\r\n"
					+ "}\r\n"
					+ "#head{\r\n"
					+ " background-color: #343A40;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "#footer{\r\n"
					+ "height:10px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "</style>\r\n"
					+ "<body>\r\n"
					+ "\r\n"
					+ "<div class=\"jumbotron text-center\" id=\"head\"style=\"margin-bottom:0\">\r\n"
					+ "  <p id=\"logo\">Device Is It</p> \r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<div class=\"container\" style=\"margin-top:30px\">	\r\n"
					+ "   <h1>"+titolo+"</h1>\r\n"
					+ "   <br><h6 style=\"padding-bottom:100px\">"+testo+"</h6>\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<div class=\"jumbotron text-center\" id=\"footer\" style=\"margin-bottom:0\">\r\n"
					+ "  <p>Il nostro team ti aspetta</p>\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "</body>\r\n"
					+ "</html>";
		
		
			return corpoEmail;
		}
		
		
		private String creaEmailResetpassword(String password) {
			String corpoEmail="<!DOCTYPE html>\r\n"
					+ "<html lang=\"en\">\r\n"
					+ "<head>\r\n"
					+ "  <meta charset=\"utf-8\">\r\n"
					+ "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
					+ "  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">\r\n"
					+ "  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\r\n"
					+ "  <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n"
					+ "  <link href=\"https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap\" rel=\"stylesheet\">\r\n"
					+ "   \r\n"
					+ "</head>\r\n"
					+ "<style>\r\n"
					+ "\r\n"
					+ "#logo{\r\n"
					+ "	font-family: 'Kaushan Script', cursive;\r\n"
					+ "	color:#fec503;\r\n"
					+ "	font-size: 60px;\r\n"
					+ "	margin-right: 15px;\r\n"
					+ "	text-decoration: none;	\r\n"
					+ "}\r\n"
					+ "#head{\r\n"
					+ " background-color: #343A40;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "#footer{\r\n"
					+ "height:10px;\r\n"
					+ "}\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "</style>\r\n"
					+ "<body>\r\n"
					+ "\r\n"
					+ "<div class=\"jumbotron text-center\" id=\"head\"style=\"margin-bottom:0\">\r\n"
					+ "  <p id=\"logo\">Device Is It</p> \r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<div class=\"container\" style=\"margin-top:30px\">	\r\n"
					+ "   <h1>Ecco la tua nuova password</h1>\r\n"
					+ "   <br><h3 class=\"text-center\" style=\"padding-bottom:100px\">"+password+"</h3>\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "<div class=\"jumbotron text-center\" id=\"footer\" style=\"margin-bottom:0\">\r\n"
					+ "  <p>Il nostro team ti aspetta</p>\r\n"
					+ "</div>\r\n"
					+ "\r\n"
					+ "</body>\r\n"
					+ "</html>";
		
		
			return corpoEmail;
		}
	   
	
	    	
	
}
