<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Device is it</title>

	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
  	<link rel="stylesheet" href="css/specs.css" type="text/css"/>
  	<jsp:include page="./navbar.jsp" /> 
  	<script src="./js/specs.js"></script>
  	
</head>
<body>
  

   	 <div class="row"  style="margin-top:1%; margin-bottom:1%"> 
  	 	<div class="col"> 
   			<p id="titolo" style="text-align:center"> Schede Tecniche  </p>
   		</div>
   		<c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->
		   	<div class="col"> 			   
			   	<a class="btn" href="newDevice"> <button style="float:left; margin-top:20%;" type="button" class="btn btn-success btn-block">Aggiungi nuovo Device</button> </a>                      									   					  									   	
			</div>
		</c:if>    		
   	</div>
   		
   		
   		
	<section id="schede"> 	
	 <div class="container">
	 	<div class="row justify-content-center">   
			 	
		   <c:forEach var="device" items="${listaDevice}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->
			   <div class="col-md-4 col-lg-3">
				    
				    <c:if test="${usernameLogged == 'admin@admin.it'}">   <!--  se è loggato l'admin -->
					    <a href="#" class="nav-link dropdown-toggle" style="padding: 0px" data-toggle="dropdown"><i class="icon-cog"></i></a>					                       					  
	                    <div class="dropdown-menu">	                        
	                        <a class="dropdown-item" data-id-device="${device.idDevice}" data-toggle="modal" data-target="#confermaEliminazione" ><i class="icon-fixed-width icon-trash"></i> Cancella</a>							 							     						    						    	                    	
	                       <form id="formSchedaTecnica" method="post" action="setDevice">
				          		<input type="hidden" id="idDevice" name="idDevice" value="${device.idDevice}">			          	
								<button class="dropdown-item" type="submit" class="btn"> <i class="icon-fixed-width icon-pencil"></i> modifica</button>
	                       </form>
	                    
	                    </div>
                    </c:if>
	                    
	                    <div class="card" style="border-radius:30px">    
				       <div class="img-hover-zoom img-hover-zoom--basic">
				          <img src="${device.img}"> 
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
    
   	    <div class="modal fade" id="confermaEliminazione">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
	        <!-- Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">Vuoi davvero eliminare il device?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" data-target="#confermaEliminazione" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formDeleteDevice" method="post" action="deleteDevice">
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