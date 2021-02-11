//alert("Sono nel file javascript!!");
window.addEventListener("load", function(){ //"load"-->al caricamento della pagina inizializziamo il form per effettuare login e sign up
	checklogin();
});

var modalLogin=true;

function  checklogin(){
	 
	$("#registrati").click(function() {	
		$("#first").fadeOut("fast", function() {
			$("#second").fadeIn("fast");
			modalLogin=false;
		});
	});
	
	$("#accedi").click(function() {
		$("#second").fadeOut("fast", function() {
			$("#first").fadeIn("fast");
			modalLogin=true;
		});
	});
}


function Utente (email, nome, cognome,username, password, newsletter, bloccato){
	this.email=email;
	this.nome=nome;
	this.cognome=cognome;
	this.username=username;
	this.password=password;
	this.newsletter=newsletter;
	this.bloccato=bloccato;	
}

$(document).ready(function(){ 
	
	var Login = document.getElementById("loginForm");
		document.getElementById("btnLogin").addEventListener("submit", function () {
 	 	Login.submit();
	});
	
	var Registrazione = document.getElementById("formRegistrazione");
		document.getElementById("btnIscriviti").addEventListener("submit", function () {
 	 	Registrazione.submit();
	});
	
	var recupPassword = document.getElementById("recuperoPassword");
		document.getElementById("btnRecuperoPassword").addEventListener("submit", function () {
 	 	recupPassword.submit();
	});
	

	
	$("#loginForm").on("submit", function(e){
		
		if(modalLogin){
			e.preventDefault();
			var email1 = document.getElementById("emailLogin").value;
			var password1 = document.getElementById("passwordLogin").value;
			
			var utente1= new Utente(email1,null,null,null,password1,null,null);
		
			$.ajax({
					  url: "Serviziologin",  
			          method: "POST",	         
			          data: JSON.stringify(utente1),	       
			          contentType: "application/json",	         
			          success: function(risposta){				  									
						if(risposta=="success"){
							location.reload();
						}					
						if(risposta=="error"){
							$('#showErrorLogin').modal('show');						
						}
						if(risposta=="bloccato"){
							$('#showBlockedLogin').modal('show');						
						} 
						if (risposta=="nonRegistrato"){
							$('#showNonRegistrato').modal('show');						
						}									
			          },	            	  
			    });	
		}
	});


	$("#formRegistrazione").on("submit", function(e){

		e.preventDefault();		
		var nome = document.getElementById("nome").value;
		var cognome = document.getElementById("cognome").value;
		var username = document.getElementById("username").value;
		var email2 = document.getElementById("email").value;
		var password2 = document.getElementById("password").value;
		var newsletter;
		if (document. getElementById("newsletter").checked) {
			newsletter=true;
		}
		else {
			newsletter=false;
		}
		
		var utente2= new Utente(email2,nome,cognome,username,password2,newsletter,null);
	
		$.ajax({
				  url: "ServizioRegistrazione",  
		          method: "POST",	         
		          data: JSON.stringify(utente2),	       
		          contentType: "application/json",	         
		          success: function(risposta){				  									
					if(risposta=="success"){
						location.reload();
					}					
					if(risposta=="error"){
						$('#showErrorRegistrazione').modal('show');						
					}									
		          },	            	  
		    });	
	});
	
	
	$("#recuperoPassword").on("submit", function(e){
		
		$("#btnRecuperoPassword").prop("disabled", true);
		$("#btnRecuperoPassword").html(`<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...`);  

		e.preventDefault();			
		var email3 = document.getElementById("emailRecupero").value;
		var utente3= new Utente(email3,null,null,null,null,null,null);
		$.ajax({
				  url: "RecuperoPassword",  
		          method: "POST",	         
		          data: JSON.stringify(utente3),	       
		          contentType: "application/json",	         
		          success: function(risposta){				  									
					if(risposta=="success"){
						$("#btnRecuperoPassword").prop("disabled", false);
						$("#btnStartUploads i").removeAttr('class');						
						$("#btnStartUploads i").addClass('class="btn btn-sm btn-outline-info"');
						 $("#btnRecuperoPassword").html(`recupera`);
						$('#invioNuovaPassword').modal('show');	
					}														
		          },	            	  
		    });	
	});	
	
	$("#chiudi").on("click", function(e){
		$('#recuperaPassword').modal('hide');	
	});
	
	
});

		


