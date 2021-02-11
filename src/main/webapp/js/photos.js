$(document).ready(function(){ 
	$("#myForm").submit(function(event){
				event.preventDefault();
				$("#result").empty();
				var search = $("#search").val();
				var url = "https://api.unsplash.com/search/photos?query="+search+"&client_id=jGPfi8MT0clyQOH5sFYJdEhb1HiZMG_puAMFtW3X2sU";
				$.ajax({
					method:'GET',
					url:url,
					success: function(data){
						console.log(data);
						data.results.forEach(photo =>{
							$("#result").append(`
							<img id="fotoTrovate" src="${photo.urls.regular}"/>		
							
							`);
	
							});
					},
				});
			});
});