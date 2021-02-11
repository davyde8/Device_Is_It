function Device (idDevice, modello, marca, tipoDevice, memoria, ram, display, batteria, fotocamera, cpu, peso, os, img){

	this.idDevice=idDevice;
	this.modello=modello;
	this.marca=marca;
	this.tipoDevice=tipoDevice;
	this.memoria=memoria;
	this.ram=ram;
	this.display=display;
	this.batteria=batteria;
	this.fotocamera=fotocamera;
	this.cpu=cpu;
	this.peso=peso;
	this.os=os;
	this.img=img;
	
}


$(document).ready(function(){ $("#formDevice").on("submit", function(e){
	
	e.preventDefault();

     var modello=document.getElementById("modello").value;
	 var marca=document.getElementById("marca").value;
	 var tipoDevice=document.getElementById("tipoDevice").value;
	 var memoria=document.getElementById("memoria").value;
	 var ram=document.getElementById("ram").value;
	 var display=document.getElementById("display").value;
	 var batteria=document.getElementById("batteria").value;
	 var fotocamera=document.getElementById("fotocamera").value;
	 var cpu=document.getElementById("cpu").value;
	 var peso=document.getElementById("peso").value;
	 var os=document.getElementById("os").value;
	 var img=document.getElementById("img").value;
	
	
	var device = new Device (null,modello, marca, tipoDevice, memoria, ram, display, batteria, fotocamera, cpu, peso, os, img);
	
	
	$.ajax({
			  url: "AggiungiDevice",  
	          method: "POST",	          
	          data: JSON.stringify(device),	          
	          contentType: "application/json",	          
	          success: function(risposta){
	          console.log(JSON.stringify(risposta));							  
			  window.location.href="/index";	         
	          },	          
	          fail: function( jqXHR, textStatus ) {
	  			alert( "Request failed: " + textStatus );
	          }        
	    });	

	});

});
		
	


