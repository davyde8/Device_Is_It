function Contenuto(id, data, device, testo, titolo,tipo,img, anteprima){
	this.id=id;
	this.data=data;
	this.device=device;
	this.testo=testo;
	this.titolo=titolo;
	this.tipo=tipo;
	this.img=img;
	this.anteprima=anteprima;
}

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

		var cercaModelli= document.getElementById ("btnCercaModello").addEventListener ("click", function(){
	
		var modello = document.getElementById("modello").value;
		
		var device = new Device (null, modello, null, null, null, null, null, null, null, null, null, null, null);
		
		$.ajax({
				  url: "findModello",  
		          method: "post",	         
		          data: JSON.stringify(device),	       
		          contentType: "application/json",	         
		          success: function(risposta){				  
					$('#device').empty();					
					jQuery.each(risposta, function(index, item) {						
						$('<option>').val(item.idDevice).text(item.modello).appendTo('#device');																	          			
			       });
			  
		          },	          
		          fail: function( jqXHR, textStatus ) {
		  			alert( "Request failed: " + textStatus );
		          }        
		    });	
	 });	

	

	$("#formSetContenuto").on("submit", function(e){
	
	e.preventDefault();
	
	var data = new Date();
	var idContenuto =  document.getElementById("idContenuto").value;
	var device =  document.getElementById("device").value;
	var testo = document.getElementById("testo").value;
	var titolo = document.getElementById("titoloRec").value;
	var tipo = document.getElementById("tipoContenuto").value;
	var img= document.getElementById("img").value;
	var anteprima=document.getElementById("anteprima").value;

	var contenuto = new Contenuto (idContenuto,data,device,testo,titolo,tipo,img,anteprima);
	
	$.ajax({
			  url: "ModificaContenuto",  
	          method: "POST",	         
	          data: JSON.stringify(contenuto),	       
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

