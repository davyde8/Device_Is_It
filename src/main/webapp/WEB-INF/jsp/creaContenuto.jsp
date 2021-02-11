<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Device Is It</title>
  	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
  	<link rel="stylesheet" href="css/Contenuto&Device.css" type="text/css"/>
	<jsp:include page="./navbar.jsp" />
  		
</head>
<body>
  

  	  <p id="titolo" style="align:center"> ${titoloContenuto} </p>
  	  <input type="hidden" id="tipoContenuto" name="tipoContenuto" value="${tipoContenuto}">	
  	     	     	
	  <div class="container">
	  <form action="/action_page.php" id="formAddContenuto">
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Titolo</label>
	      </div>
	      <div class="col-80">			    
			  <input type="text" id="titoloRec" name="titoloRec" placeholder="inserisci titolo" required>	  	  		  				  
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="lname">Immagine</label>
	      </div>
	      <div class="col-80">		      
			 <input type="text" id="img" name="img" placeholder="url immagine" required>  	  		  
	      </div>
	    </div>
	         	      
		  <div class="row">
		    <div class="col-20">			      
		      <label for="lname">Device</label>
		    </div>
			 <div class="col-80">
				<div class="row">
			      <div class="col-6 " >		
			        <div class="input-group mb-3" style="padding-top: 4px;">
			          <input   type="text" class="form-control" id="modello" placeholder="cerca Modello">
			          <div class="input-group-append">
			            <button id="btnCercaModello" class="btn btn-success" type="button">cerca</button>  
			          </div>
			        </div> 			    
			      </div>
			      <div class="col-6">
			        <c:if test="${titoloContenuto == 'Nuova Recensione'}">
			      	  <select id="device" name="device" required></select>	
			        </c:if>
			        <c:if test="${titoloContenuto == 'Nuovo Articolo'}">
			      	  <select id="device" name="device"></select>	
			        </c:if>			      			      			     
			      </div>
				</div>
			  </div>
			</div>	
			 				 		   			 	    		    	      	           	
		    <div class="row">
		      <div class="col-20">
		        <label for="subject">Anteprima</label>
		      </div>
		      <div class="col-80">	         			      	 					 
				 <textarea id="anteprima" name="anteprima" placeholder="inserisci anteprima" style="height:100px" required></textarea>	  		  					 
		      </div>
		    </div>

		    <div class="row">
		      <div class="col-20">
		        <label for="subject">Testo</label>
		      </div>
		      <div class="col-80">	         			      	 
				  <textarea id="testo" name="testo" placeholder="inserisci testo" style="height:400px" required></textarea>	  		  					  
		      </div>
		    </div>
	    
		    <div class="row" >
		       <br>
			   <div class="col-12">			   		  
				    <button type="submit" id="btnPubblicaContenuto" class="btn btn-outline-btn btn btn-success">Pubblica</button>	  		  
			   </div>
	       </div>
	       
		  </form>
		 </div>


</body>
	 <jsp:include page="./footer.jsp" />
	 <script src="./js/creaContenuto.js"></script>	 
</html>