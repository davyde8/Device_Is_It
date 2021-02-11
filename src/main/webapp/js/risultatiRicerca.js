$(document).ready(function(){ 

 	$('#confermaEliminazioneContenuto').on('show.bs.modal', function(e) {
	    var Id = $(e.relatedTarget).data('id-contenuto');
	    $(e.currentTarget).find('input[name="idContenuto"]').val(Id);
	});
		
});

$(document).ready(function(){ 

 	$('#confermaEliminazioneDevice').on('show.bs.modal', function(e) {
	    var Id = $(e.relatedTarget).data('id-device');
	    $(e.currentTarget).find('input[name="idDevice"]').val(Id);
	});
		
});