<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

 <meta charset="ISO-8859-1">
 <link rel="stylesheet" href="css/footer.css" type="text/css"/>
 

 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
		  <style>
		    #map{
		      height:220px;
		      width: 100 px;
		    }
		  </style>
 
 <script src="./js/api.js"></script>
 
</head>
<body>

<!-- Footer inizio -->
    <footer class="footer-section" style="margin-top:5%">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="footer-left">
                        <div align="center" class="footer-logo">
                            <a href=""><img style="margin:0px" src="images/logo_deviceIsIt.png" alt=""></a>
                        </div>
                        <div align="center" class="footer-social">
	                        
	                            <a href="#"><i class="fa fa-facebook"></i></a>
	                            <a href="#"><i class="fa fa-instagram"></i></a>
	                            <a href="https://twitter.com/intent/tweet?button_hashtag=DeviceIsIt"><i class="fa fa-twitter"></i></a>	                        	   
	                   </div>
                    </div>
                </div>
                   
                <div class="col-lg-3" style="padding-right: 0px">
                	<div align="left" class="footer-widget">
	                	<ul>
                            <h5>Un team fantastico!</h5>
                            <li>Ci puoi trovare nelle sedi: </li>
                            <li><a href="https://it.wikipedia.org/wiki/Reggio_Calabria"> - Reggio Calabria</a></li>
                            <li><a href="https://it.wikipedia.org/wiki/Locri"> - Locri </a></li>
                            <li><a href="https://it.wikipedia.org/wiki/Cosenza"> - Cosenza </a></li>
                            <li><a href="https://it.wikipedia.org/wiki/Cittanova_(Italia)"> - Cittanova </a></li>	                           
	                    </ul>
	               </div>
                </div>
                <div class="col-lg-2" style="padding-right: 0px;">
                    <div align="left" class="footer-widget">
                        <h5>Informazioni</h5>
                        <ul style="padding-left: 0px">
                            <form method="get" action="/index">			          	
								  <li><button style="margin: 0px; padding: 0px" type="submit" class="btn btn-link"> Chi siamo</button></li>
				            </form>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div align="left" class="footer-widget">
                        <h5>Account</h5>
                        <ul style="padding-left: 0px">
                            
			                <c:if test="${usernameLogged == null}">  <!--  se non c'è un username loggato mostrami il login -->
				    			<li><a href="#" data-toggle="modal" data-target="#loginForm" >Il mio Profilo </a></li>  
				    		</c:if>
				    		
				    		<c:if test="${usernameLogged != null}"> <!-- se c'è un username loggato -->
			
				    			<div class="navbar-nav">             
			               			
				                        <form method="get" action="/profilo">
							          		<input type="hidden" id="email" name="email" value="${usernameLogged}">			          	
											<button style="margin: 0px; padding: 0px" type="submit" class="btn btn-link"> Il mio Profilo</button>
				                        </form>
				                 
				                </div>               
				    	    </c:if> 
                		</ul>
             		</div>
           		</div>
                
                
         <div id="map"class="col-lg-3" style="padding: 0px" >
		 <script>
		  function initMap(){
		      // Map options
		      var options = {
		        zoom:12,
		        center:{lat:39.35800,lng:16.22714}
		      }
		
		      // New map
		      var map = new google.maps.Map(document.getElementById('map'), options);
		
		      // Listen for click on map
		      google.maps.event.addListener(map, 'click', function(event){
		        // Add marker
		        addMarker({coords:event.latLng});
		      });
		
		
		      // Array of markers
		      var markers = [
		        {
		          coords:{lat:39.35800,lng:16.22714},
		          iconImage:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
		          content:'<h2>UNICAL</h2>'
		        },
		
		      ];
		
		      // Loop through markers
		      for(var i = 0;i < markers.length;i++){
		        // Add marker
		        addMarker(markers[i]);
		      }
		
		      // Add Marker Function
		      function addMarker(props){
		        var marker = new google.maps.Marker({
		          position:props.coords,
		          map:map,
		          //icon:props.iconImage
		        });
		
		        // Check for customicon
		        if(props.iconImage){
		          // Set icon image
		          marker.setIcon(props.iconImage);
		        }
		
		        // Check content
		        if(props.content){
		          var infoWindow = new google.maps.InfoWindow({
		            content:props.content
		          });
		
		          marker.addListener('click', function(){
		            infoWindow.open(map, marker);
		          });
		        }
		      }
		    }
		  </script>
		  
		  
<!-- 		  <div id="wrapper-9cd199b9cc5410cd3b1ad21cab2e54d3"> 
				<div id="map-9cd199b9cc5410cd3b1ad21cab2e54d3"></div><script>(function () {
		        var setting = {"height":180,"width":280,"zoom":15,"queryString":"Unical, Arcavacata, CS, Italia","place_id":"ChIJm6Q5y6KZPxMRJWQOVGCdUho","satellite":false,"centerCoord":[39.35624291302391,16.226949100000017],"cid":"0x1a529d60540e6425","lang":"it","cityUrl":"/italy/cosenza-9762","cityAnchorText":"Mappa di Cosenza, Italy South, Italia","id":"map-9cd199b9cc5410cd3b1ad21cab2e54d3","embed_id":"359339"};
		        var d = document;
		        var s = d.createElement('script');
		        s.src = 'https://1map.com/js/script-for-user.js?embed_id=359339';
		        s.async = true;
		        s.onload = function (e) {
		          window.OneMap.initMap(setting)
		        };
		        var to = d.getElementsByTagName('script')[0];
		        to.parentNode.insertBefore(s, to);
		      })();</script><a href="https://1map.com/it/map-embed">1 Map</a>
		 </div>         
        </div>
      </div>
   </div>
   -->
        
        
    
			<!--  script con key per api google maps -->
	
  <script async defer
   		 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXCycDoQhkrPR2ESJ8NkUcnvekAWR26V8&callback=initMap">
	</script>
  


</footer>      <!-- Footer fine -->



</body>
</html>