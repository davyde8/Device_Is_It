function Utente (email, nome, cognome, password, username, newsletter, bloccato){

	this.email=email;
	this.nome=nome;
	this.cognome=cognome;
	this.password=password;
	this.username=username;
	this.newsletter=newsletter;
	this.bloccato=bloccato;
	
}

$(document).ready(function(){ 

 	$('#confermaBloccoProfilo').on('show.bs.modal', function(e) {
 		var bloccaEmail = $(e.relatedTarget).data('email-blocca');	   
	    $(e.currentTarget).find('input[name="email"]').val(bloccaEmail);
	});
	
 	$('#confermaSbloccoProfilo').on('show.bs.modal', function(e) {
	    var sbloccaEmail = $(e.relatedTarget).data('email-sblocca');	  
	    $(e.currentTarget).find('input[name="email"]').val(sbloccaEmail);
	});
	
	$('#confermaEliminazioneProfilo').on('show.bs.modal', function(e) {
	    var email = $(e.relatedTarget).data('email-elimina');	  
	    $(e.currentTarget).find('input[name="email"]').val(email);
	});
		
	
	var btn= document.getElementById ("btnCercaUtente").addEventListener("click", function(){	    		
			
			var find = document.getElementById('toFind').value;					
			var utente = new Utente(null,find,null,null,null,null,null);
				
			$.ajax({
				  url: "findUtenti",  
		          method: "post",	         
		          data: JSON.stringify(utente),	       
		          contentType: "application/json",	         
		          success: function(risposta){	
					if(risposta == "fail"){
						alert("la ricerca non ha prodotto nessun risultato");						
					}
					if(risposta =="success"){
						window.location.href="ricercaUtenti";
					}				  
		          },	          		             
		    });	
	});
		
		
});

