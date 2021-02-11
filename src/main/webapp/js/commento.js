function Commento(idcommento,contenuto, testo, data, utente,mipiace){
	this.idcommento=idcommento;
	this.contenuto= contenuto;
	this.testo=testo;
	this.data=data;
	this.utente=utente;
	this.mipiace=mipiace;
	
}		
$(document ).ready(function() {
    
	var btnCommento = document.getElementById ("submitCommento").addEventListener ("click", function(){
		
		const o_date = new Intl.DateTimeFormat;
		const f_date = (m_ca, m_it) => Object({...m_ca, [m_it.type]: m_it.value});
		const m_date = o_date.formatToParts().reduce(f_date, {});		
		
		var user = document.getElementById("user").value;
		var email = document.getElementById("emailUtente").value;		
		var data= new Date();
		var idcontenuto = document.getElementById("idContenuto").value;
		var testo = $("#testoCommento").val();
		var commento = new Commento(null,idcontenuto,testo,data,email,null);
		
		$.ajax({
			  url: "AggiungiCommento",  
	          method: "POST",
	          data: JSON.stringify(commento),
	          contentType: "application/json",	          
	          success: function(risposta){														
					
//					document.getElementById("nuoviCommenti").innerHTML +=					
//					"<div class=\"comment col-12 mt-4 text-justify float-left\">"+			                	 	                			   
//                    "<div class=\"row\">"+
//                    "<div class=\"col\">"+
//                	"<h4 style=\"padding-left: 10px; padding-right: 20px\">"+user+"</h4> <span>"+
//					 m_date.year+ '-' + m_date.month + '-' +m_date.day+"</div>"+			                  			                     
//                 	"<div class=\"row\" style=\"padding-right: 10px\">"+
//                 	"<c:if test=\"${usernameLogged == \'admin@admin.it\' || username == commento.utente}\">"+
//				    "<div class=\"col\" style=\"margin: 0px; padding: 0px\">"+
//				    "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"icon-cog\"></i></a>"+					                       					  
//                    "<div class=\"dropdown-menu\">"+	                        								                  			                      
//                    "<button type=\"submit\" class=\" btn btn-block btn-outline-danger\" style=\"float:right\"> Elimina commento</button>"+ 										                 
//				    "</div> </div></c:if><div>"+
//			        "<div class=\"col\" >"+
//				    "<button  class=\"btn btn-outline-danger btn-sm\" style=\"float:right; width:50px; padding:0px\">"+			                    			                   					                     				                   
//				    "<div class=\"row\">"+
//					" <i class=\"far fa-heart\" style=\"padding:6px 8px 6px 20px ; \"></i>"+ 
//					"<p style=\"margin:0px; padding-top:2px; padding-bottom: 0px; \">0</p>"+	
//				    "</div></button> </div></div></div></div><br><p>"+commento.testo+"</p></div>"; 					
//					document.getElementById(testoCommento).innerText("");

					location.reload();					     
				},
	          fail: function( jqXHR, textStatus ) {
	  			alert( "Request failed: " + textStatus );
	          }        
	    });	
	});
	
	
	
	$("#formDeleteCommento").on("submit", function(e){
		
		e.preventDefault();			
		var numCommento = document.getElementById("idComm").value;		
		var eliminaCommento = new Commento(numCommento,null,null,null,null,null);
		
		$.ajax({
				  url: "deleteCommento",  
		          method: "POST",	         
		          data: JSON.stringify(eliminaCommento),	       
		          contentType: "application/json",	         
		          success: function(risposta){				  									
					if(risposta=="success"){
						location.reload();
					}																	
		          },	            	  
		    });	
		
		
		
	});
	
	
});


function addLike(idBottone){
	
    var commento = new Commento(idBottone,null,null,null,null,null);	
	var user = document.getElementById("user").value;
	
	if(user!=null) {		
		$.ajax({
			  url: "AggiungiMiPiace",  
	          method: "POST",
	          data: JSON.stringify(commento),
	          contentType: "application/json",	          
	          success: function(risposta){														       
				var txt = document.getElementById(idBottone).innerText;					
				var num = parseInt(txt);				
				document.getElementById(idBottone).innerHTML=num+1;			
			},
	          fail: function( jqXHR, textStatus ) {
	  			alert( "Request failed: " + textStatus );
	          }        
	    });				
	}				
	
}

