package Demo.deviceIsIt.model;

import java.sql.Date;

public class Contenuto {
	
	private int id;
	private Date data;
	private int device;
	private String testo;
	private String titolo;
	private int tipo;
	private String img;
	private String anteprima;
	private int numCommenti;
	
	
	public int getNumCommenti() {
		return numCommenti;
	}
	public void setNumCommenti(int numCommenti) {
		this.numCommenti = numCommenti;
	}
	
	public int getid() {
		return id;
	}
	public void setIdContenuto(int id) {
		this.id = id;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public int getDevice() {
		return device;
	}
	public void setDevice(int device) {
		this.device = device;
	}
	public String getTesto() {
		return testo;
	}
	public void setTesto(String testo) {
		this.testo = testo;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public void setAnteprima (String anteprima) {
		this.anteprima= anteprima;
	}
	
	public String getAnteprima() {
		return anteprima;
	}
	

}
