window.addEventListener("load", function(){ //"load"-->al caricamento della pagina inizializziamo il form per effettuare login e sign up
	checklogin();
});

function  checklogin(){
	 
	$("#signup").click(function() {	
		$("#first").fadeOut("fast", function() {
			$("#second").fadeIn("fast");
		});
	});
	
	$("#signin").click(function() {
		$("#second").fadeOut("fast", function() {
			$("#first").fadeIn("fast");
		});
	});
}
