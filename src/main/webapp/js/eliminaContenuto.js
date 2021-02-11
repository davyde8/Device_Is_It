$(document).ready(function(){ 

 	$('#confermaEliminazione').on('show.bs.modal', function(e) {
	    var Id = $(e.relatedTarget).data('id-contenuto');
	    $(e.currentTarget).find('input[name="idContenuto"]').val(Id);
	});
	
});
