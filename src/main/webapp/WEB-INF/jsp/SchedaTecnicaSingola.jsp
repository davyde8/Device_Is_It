<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  	<link rel="stylesheet" href="css/schedaTecnicaSingola.css" type="text/css"/>
	<title>Device is it</title>
	<jsp:include page="./navbar.jsp" /> 
</head>
<body>

  
   <p id="titolo" style="text-align:center"> ${device.marca}  ${device.modello} </i> </p>
 	 
 	 <div class="container" style="margin-top: 50px;">  
	  <div class="row">	  
		  	
		  	<div class="col mx-auto text-center" style="margin-top: 20px; ">
		  		
		  		<div class="card" style="border-radius:30px">    			       
			       <c:if test="${usernameLogged != null}"> 
		       		  <div class="img-hover-zoom img-hover-zoom--basic">
			               <img style="margin-left:0px; max-height: 300px; margin-top: 16%" src="${device.img}"> 
			       	  </div>
		       		  <div class="card-body text-centert">
		          	    <h5 class="card-title">${device.modello}</h5> 			           
			            <form action="#">			             
			              <input type="hidden" id="idDevice" name="idDevice" value="${device.idDevice}">			          	
						  <button id="btnPreferiti" type="button" style="border-radius:15px; margin-top:15px;" class="btn btn-outline-warning"> <i class="far fa-star"> </i> aggiungi ai preferiti</button>
	           		   </form>
	           		  </div> 
	           	  </c:if>	           	 
	           	  <c:if test="${usernameLogged == null}"> 
	           	  	<div class="img-hover-zoom img-hover-zoom--basic">
			            <img style="margin-left:0px; max-height: 300px; margin-top: 26%" src="${device.img}"> 
			       	</div>
			    	<h5 style="margin-top: 15%"  class="card-title">${device.modello}</h5>
			      </c:if> 		           		       			         
			    </div>
			    	
			    <c:if test="${recensione != null }">		    
				    <form id="formSchedaTecnica" method="post" action="/Contenuto">
			          	<input type="hidden" id="id" name="id" value="${recensione.id}">			          	
						<button type="submit" style="border-radius:15px; margin-top:15px; height:45px;" class="btn btn-primary">Vai alla recensione</button>
	               </form>	
               </c:if>	
			    	    		  			  
		  	</div>
		  	
	  	<div class="col" style="max-width: 740px;">
	  	
		  	<div class="table-users">
			  <div class="header">
			    	Scheda Tecnica   
			  </div>
			  <table>
		  
			      <tr>
			      	<th style="width: 35%" >Modello</th>
			      	<th>${device.modello}</th>
			      </tr>
			      
			      <tr>
			      	<th>Marca</th>
			      	<th>${device.marca}</th>
			      </tr>
			      
			      <tr>	
			      	<th >
			      		<div class="row">
				      		<div class="col">
				      			Memoria
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/sd.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>			      			      	
			      	<th>${device.memoria}</th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row">
				      		<div class="col">
				      			Ram
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/smartphone-ram.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>				      	
			      	<th> ${device.ram} </th>
			      </tr>	
			      		      
				  <tr>
				     <th>
			      		<div class="row">
				      		<div class="col">
				      			Display 
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/screen-resolution.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>				      	
			      	<th>${device.display} </th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row">
				      		<div class="col">
				      			Batteria 
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/full-battery.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>				      	
			      	<th>${device.batteria}</th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row" >
				      		<div class="col">
				      			Fotocamera
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/camera.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>			      	
			      	<th>${device.fotocamera}</th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row">
				      		<div class="col">
				      			CPU
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/electronics.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>			      	
			      	<th>${device.CPU}</th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row">
				      		<div class="col">
				      			Peso
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/weight.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>
			      	<th>${device.peso} </th>
			      </tr>
			      
			      <tr>
			      	<th>
			      		<div class="row">
				      		<div class="col">
				      			OS
				      		</div>
				      		<div class="col" style="padding: 0px">
				      			<img src="https://img.icons8.com/plumpy/24/000000/operating-system.png"/>
				      		</div>			      		
			      		</div> 
			      	</th>				      
			      	<th>${device.os}</th>
			      </tr>
			      
			    </tbody>
			  </table>
			</div>
	  	
	  	</div>
	  </div>
	</div>  

 
 	 <div class="modal fade" id="conferma">
	    <div class="modal-dialog">
	      <div class="modal-content">	            
	        <!-- Modal body -->
	        <div class="modal-body">	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button id="chiudi" type="button" class="close" data-dismiss="modal">×</button>
							 <br><br><p>Device aggiunto correttamente alla lista dei preferiti<p> 					              		                 					
						 </div>
					</div>	                   	               
				</div>
			  </div>
			</div>
	     </div>
	 </div>  
	 
	  <div class="modal fade" id="esiste">
	    <div class="modal-dialog">
	      <div class="modal-content">	            
	        <!-- Modal body -->
	        <div class="modal-body">	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button id="chiudi" type="button" class="close" data-dismiss="modal">×</button>
							 <br><br><p>Devise già presente nella lista dei preferiti<p> 					              		                 					
						 </div>
					</div>	                   	               
				</div>
			  </div>
			</div>
	     </div>
	 </div>

	<div class="container">
		<br> <br>
		<h1 style="text-align: center;">Galleria dispositivo</h1>
			<form id="myForm" autocomplete="off">
				<div class="form-group">
					<input type="text" class="form-control" id="search" value="${device.modello}" required>	 
				</div>
				<div class="form-group">
					<button class="btn btn-info btn-block">
						Ricerca foto correlate al disposivo
					</button>
				</div>
			</form>
			
			<div class="row" align="center">
				   <div id="result"></div>	
			</div>	
				        
			
	</div>
	
	
		
</body>
	<jsp:include page="./footer.jsp" />
	 <script src="./js/schedaTecnicaSingola.js"></script>
	 <script src="./js/photos.js"></script> 
</html>