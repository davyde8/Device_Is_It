<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Device Is It</title>
  	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
  	<link rel="stylesheet" href="css/Contenuto&Device.css" type="text/css"/>  <!-- verificare se va bene -->
	<jsp:include page="./navbar.jsp" />
  		
</head>
<body>
  

  	  <p id="titolo" style="align:center"> Modifica dati utente </p>
  	  <input type="hidden" id="idUtente" name="idUtente" value="${utente.email}">	

	 
	 <div class="container">
	  <form action="/action_page.php" id="formSetProfilo">
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Email</label>
	      </div>
	      <div class="col-80">	   
			  <input type="text" id="emailUtente" name="email " value="${utente.email}" disabled>			 
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Nome</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="nomeUtente" name="nome" value="${utente.nome}" required>	       
	      </div>
	    </div>

	   	<div class="row">
	      <div class="col-20">
	        <label for="fname">Cognome</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="cognomeUtente" name="cognome" value="${utente.cognome}" required>	       
	      </div>
	    </div>				    
	    	    		    	      	           	 
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Username</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="user" name="user" value="${utente.username}" required>	       
	      </div>
	    </div>

	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Password</label>
	      </div>
	      <div class="col-80">
	      	 <input type="text" name="passw" id="passw"  class="form-control" aria-describedby="emailHelp" placeholder="modifica password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" >
             <p id="parametriPSW">Minimo otto caratteri, almeno una lettera maiuscola e un numero</p> 	        	            
	      </div>
	    </div>
	    
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Newsletter</label>
	      </div>
	      <div class="col-80">
	        <c:if test="${utente.newsletter == true}">
			     <select id="newsletterUtente" name="newsletterUtente">
		          	<option value="true">attivata</option>
		          	<option value="false">disattivata</option>		          
		        </select>			     			   
			</c:if>
	        <c:if test="${utente.newsletter != true}">
			    <select id="newsletterUtente" name="newsletterUtente">
		          	<option value="false">disattivata</option>	
		          	<option value="true">attivata</option>		          	         
		        </select>
			</c:if>	       
	      </div>
	    </div>	       
	    <div class="row" >
	      <br>
		   <div class="col-12 text-center" >			   		  			  
	    		<button type="submit" id="btnModificaProfilo" class="btn btn-outline-btn btn btn-success">Conferma Modifica</button>
		  </div>
	   </div>
       
	 </div>
	 
	 	 <div class="modal fade" id="showError">
	    <div class="modal-dialog">
	      <div class="modal-content">	            
	        <!-- Modal body -->
	        <div class="modal-body">	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3>Oh no! C'è stato un imprevisto :(</h3><br>				
							 <h6>riprova più tardi</h6>			
							 <br>
						 </div>
					</div>	                   	               
				</div>
			  </div>
			</div>
	     </div>
	 </div> 


</body>
	 <jsp:include page="./footer.jsp" />
	 <script src="./js/modificaProfilo.js"></script>	 
</html>