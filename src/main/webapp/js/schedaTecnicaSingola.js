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

$(document).ready(function(){

	var preferito= document.getElementById ("btnPreferiti").addEventListener ("click", function(){
		
	   var id = document.getElementById("idDevice").value;		
	   var device = new Device (id, null, null, null, null, null, null, null, null, null, null, null, null);	   

		$.ajax({
				  url: "addPreferiti",  
		          method: "post",	         
		          data: JSON.stringify(device),	       
		          contentType: "application/json",	         
		          success: function(risposta){				  				
			  		if(risposta=="success"){
						$('#conferma').modal('show');					
					}
					if(risposta=="presente"){				
						$('#esiste').modal('show');					
					}				
		          },	          		                
		    });	
		
	});	
	
});