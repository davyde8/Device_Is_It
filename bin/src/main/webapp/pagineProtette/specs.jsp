<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Device is it</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
  	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">  <!-- font-family: 'Kaushan Script', cursive; -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- icone bootstrap -->
  	<link rel="stylesheet" href="css/specs.css" type="text/css"/>
  	<link rel="stylesheet" href="css/home.css" type="text/css"/>
  	
  	  <script src="https://code.jquery.com/jquery-3.5.0.js"></script> 	<!-- Codice per includere la navbar -->
    <script> 
    $(function(){
        $("#Navbar").load("pagineProtette/navbar.jsp #daCaricare");
        $.getScript("/js/login.js");
      });
    </script> 
  	
</head>
<body>
	
	<div id="Navbar"></div>
    
   
   <p id="titolo" style="text-align:center"> Schede Tecniche</p>
	
	<section id="schede"> 	
	 	<div class="container">
	 	<div class="row justify-content-center">   
		  
<!-- 		     <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/s10.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			         <h5 class="card-title">Samsung S10</h5> -->
<!-- 			         <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 		     <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/s20.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Samsung S20</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div>		 -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/s21.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Samsung S21</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div>	   -->
			  
<!-- 			   <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/iphone12.jpg" >			    					     -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Apple Iphone 12</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			   <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			       	  <img src="images/iphone12proMax.jpg" >	 -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Apple Iphone 12 Pro Max</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			   <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/iphone11.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Apple Iphone 11</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/macbookPro13.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Apple Macbook Pro 13</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/macbookPro16.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Apple Macbook Pro 16</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/xps13.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Dell XPS 13</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/xps15.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Dell XPS 15</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div> -->
			  
<!-- 			  <div class="col-md-4 col-lg-3"> -->
<!-- 			    <div class="card">     -->
<!-- 			       <div class="img-hover-zoom img-hover-zoom--basic"> -->
<!-- 			          <img src="images/zenbook14.jpg" > -->
<!-- 			       </div> -->
<!-- 			       <div class="card-body text-center"> -->
<!-- 			          <h5 class="card-title">Asus Zenbook 14</h5> -->
<!-- 			          <a href="#" class="btn btn-info">Vai alla scheda tecnica</a> -->
<!-- 			      </div>       -->
<!-- 			    </div> -->
<!-- 			  </div>	 -->
			
		
	   <c:forEach var="device" items="${listaDevice}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->

		   <div class="col-md-4 col-lg-3">
				    <div class="card">    
				       <div class="img-hover-zoom img-hover-zoom--basic">
				          <img src="${device.img}"> 
				       </div>
				       <div class="card-body text-center">
				          <h5 class="card-title">${device.modello}</h5> 
				          <form id="formSchedaTecnica" method="post" action="/schedaTecnica">
				          	<input type="hidden" id="idDevice" name="idDevice" value=${device.idDevice}>			          	
	                        <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Vai alla scheda tecnica</button>
	                       </form>			      	
				      </div>      
				    </div>
				  </div>	
		   
		   </c:forEach>
		
		</div>
	  </div>
    </section>
    
</body>
</html>