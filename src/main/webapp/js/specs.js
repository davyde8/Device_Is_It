$(document).ready(function(){ 

 	$('#confermaEliminazione').on('show.bs.modal', function(e) {
	    var Id = $(e.relatedTarget).data('id-device');
	    $(e.currentTarget).find('input[name="idDevice"]').val(Id);
	});
	
});