package Demo.deviceIsIt.model;

public class Utente {
	
	private String email;
	private String nome;
	private String cognome;
	private String password;
	private String username;
	private boolean newsletter;
	private boolean bloccato;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public boolean isNewsletter() {
		return newsletter;
	}
	public void setNewsletter(boolean newsletter) {
		this.newsletter = newsletter;
	}
	public boolean isBloccato() {
		return bloccato;
	}
	public void setBloccato(boolean bloccato) {
		this.bloccato = bloccato;
	}
	
	

}
