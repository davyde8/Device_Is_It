$(document).ready(function(){
	var API_KEY = "AIzaSyDOU5nEmtoJpBNCaZn8qI6ChsZ4iizwbQU"
  	var video = ''

	window.addEventListener("load", function(){ 
		
	    var search = $("#search").val()
	    
	    videoSearch(API_KEY,search,3)
	});
		
  
  $("#form").submit(function(event){
    event.preventDefault()

    var search = $("#search").val()
    
    videoSearch(API_KEY,search,3)
  })
  
  function videoSearch(key,search,maxResults){
    $("#videos").empty()
    
    $.get("https://www.googleapis.com/youtube/v3/search?key=" + key + "&type=video&part=snippet&maxResults=" + maxResults + "&q=" + search,function(data){
      
      data.items.forEach(item => {
        video = `<iframe width="350" height="200" src="https://www.youtube.com/embed/${item.id.videoId}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>`
        
        $("#videos").append(video)
      });
    })
  }
})
