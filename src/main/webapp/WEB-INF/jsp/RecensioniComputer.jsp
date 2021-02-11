<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   
    <link rel="stylesheet" href="css/recensioni.css" type="text/css"/>
    
    <title>Device Is It</title> 
	<jsp:include page="./navbar.jsp" />
	<script src="/js/eliminaContenuto.js"></script>  
	 	
	
</head>
<body>
  
  <div class="row"  style="margin-top: 20px"> 
  	 <div class="col"> 
  		<p id="titolo" style="text-align:center"> Recensioni Computer  <i class="fas fa-laptop"></i>  </p>
	 </div>
	<c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->
	   <div class="col text-center">		  
		    <a class="btn" href="newRecensione"> <button style="margin-top:20%" type="button" class="btn btn-primary btn-block">Aggiungi nuova Recensione</button> </a>                      									   					  							 
		</div> 	
	</c:if> 
 </div>
	
	

	<c:forEach var="contenuto" items="${listaComputer}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->
 			
		<c:if test="${usernameLogged == 'admin@admin.it'}" >  <!--  se è loggato l'admin -->	    			  
    			  <div class="row" style="margin-bottom: -20px; margin-top: 20px;">
	                  <div class="col" >
		                 <button style="float:right" type="button" class="btn btn-sm btn-outline-danger" data-id-contenuto="${contenuto.id}" data-toggle="modal" data-target="#confermaEliminazione" ><i class="icon-trash"></i> Cancella</button>							 							     
					   </div>
					   <div class="col">
					     <form id="formSetContenuto" method="post" action="setContenuto">
		                     <input type="hidden" id="idContenuto" name="idContenuto" value="${contenuto.id}">                 
		                     <button type="submit" class="btn btn-sm btn-outline-info" style="float:left"><i class="icon-cog"></i> Modifica</button> 
		                 </form>
		               </div>	
				   </div>  			        
    		</c:if>	
			<div class="row justify-content-center">
			  <div class="card">

			    <div class="additional">
			      
			      <div class="user-card">
			       
			        <div class="level center">
			          <c:if test="${contenuto.numCommenti==1}">
					    <p class="card-text"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commento</p>
					   </c:if>
					   <c:if test="${contenuto.numCommenti!=1}"> 
					    	<p class="card-text"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commenti</p>
					   </c:if>
			        </div>
			        
			        <img width="150" height="80" src="${contenuto.img}" class="center">
			        
			        <div class="points center">
			          <p class="card-text"><i class="fas fa-calendar-alt"></i>  ${contenuto.data}
			        </div>
			      </div>
			
			      <div class="more-info">
					
			      <h1>${contenuto.titolo}</h1> <br>
			        <form id="formArticolo" method="post" action="Contenuto" align="center">
		                    <input type="hidden" id="id" name="id" value="${contenuto.id}">               
		                    <button type="submit" style="border-radius:15px; margin-left:35%; margin-right:35%;  margin-top:15px; height:45px;" class="btn btn-primary">Continua a leggere</button>
				    </form>
			      </div>
			    </div>
    			
    			<div class="general">		    		   
			      <h1>${contenuto.titolo}</h1>
			      <p> ${contenuto.anteprima} </p>
			      <span class="more">Scorri per leggere la recensione</span>
			    </div>
			  </div>
			</div>
  		 </c:forEach>
  		 
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
							<h3 class="titolo-loginForm">vuoi davvero eliminare il contenuto?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" data-target="#confermaEliminazione" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formDeleteContenuto" method="post" action="deleteContenuto">
			                     <input type="hidden" name="idContenuto" value=""/>			                       
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