<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Device Is It</title>	
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
  	<link rel="stylesheet" href="css/ricerca.css" type="text/css"/>
	<jsp:include page="./navbar.jsp" />	
	<script src="./js/preferiti.js"></script> 
  		
</head>
<body>
    
	<c:if test="${preferiti.size()!=0 }"> 
   		<p id="titolo" style="text-align:center"> Preferiti</p>
	</c:if>
	<c:if test="${preferiti.size()==0 }"> 
   		<p id="titolo" style="text-align:center"> Preferiti</p>
   		<p style="margin-bottom: 50%; text-align:center" > lista preferiti vuota </p>
	</c:if>
	
	<section id="schede"> 	
	 <div class="container">
	 	<div class="row justify-content-center">   
			 	
		   <c:forEach var="device" items="${preferiti}">
			   <div class="col-md-4 col-lg-3">
			   			   		
				  <a href="#" class="nav-link dropdown-toggle" style="padding: 0px" data-toggle="dropdown"><i class="icon-cog"></i></a>					                       					  
                     <div class="dropdown-menu">	                        
                       <a class="dropdown-item" data-id-device="${device.idDevice}" data-toggle="modal" data-target="#confermaEliminazionePreferito" ><i class="icon-fixed-width icon-trash"></i> Cancella dai preferiti</a>							 							     						    						    	                    	                       						    						   
                     </div>
                    
                    
				    <div class="cardDevice" style="border-radius:30px">    
				       <div class="img-hover-zoom img-hover-zoom--basic">
				          <img class="imgDevice" src="${device.img}"> 
				       </div>
				       <div class="card-body text-center">
				          <h5 class="card-title">${device.modello}</h5> 
				          <form id="formSchedaTecnica" method="post" action="/schedaTecnica">
				          	<input type="hidden" id="idDevice" name="idDevice" value="${device.idDevice}">			          	
							<button type="submit" style="border-radius:15px; margin-top:15px; height:45px;" class="btn btn-outline-primary">Vai alla scheda tecnica</button>
	                       </form>			      	
				      </div>      
				    </div>
			   </div>	
	      </c:forEach>		
	      
		</div>
	  </div>
    </section>
 
      
 		<div class="modal fade" id="confermaEliminazionePreferito">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
	        <!-- Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">vuoi davvero eliminare il devise dai preferiti?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formDeletePrefrito" method="post" action="deletePreferito">
			                     <input type="hidden" name="idDevice" value=""/>			                       
			                     <button type="submit" class=" btn btn-block btn-outline-danger" style="float:right"> Si</button> 
			                 </form>
			               </div>	
					   </div>   	               
				  </div>
			   </div>
			</div>
	     </div>
	 </div>  	 	
   
</body>
	<jsp:include page="./footer.jsp" />
</html>