<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<jsp:include page="./navbar.jsp" />
		
		<title>Device Is It</title>
		
	  	<link rel="stylesheet" href="css/listaUtenti.css" type="text/css"/>
	  	
	  	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/js/gestisciUtenti.js"></script>
		
	</head>
	
	<body>
	
		<p id="titolo" style="text-align:center"> Lista Utenti </p>
	
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                    	<div class="col-sm-8"><h2 id="titolo">        </h2></div>
                        <div class="col-sm-4">
                            <div class="search-box">
                                <input type="text" id="toFind" class="form-control" placeholder="Cerca" aria-label="Cerca" required>
                                <button style="box-shadow: none;" type="button" id="btnCercaUtente" class="btn btn-link"><i class="material-icons">&#xE8B6;</i></button>                                
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered" id="tabellaUtenti">
                    <thead>
                        <tr >                            
                            <th>Email</th>
                            <th>Nome</th>
                            <th>Cognome </th>
			    			<th>Username</th>
                            <th>Password</th>
                            <th>Newsletter</th>
                            <th>Bloccato</th>
			    			<th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:forEach var="utente" items="${utentiTrovati}"> 
					                    
						<tr style="padding: 0px">	
		                            <td>${utente.email}</td>
		                            <td>${utente.nome}</td>
		                            <td>${utente.cognome}</td>
		                            <td>${utente.username}</td>
		                            <td>-----------------------</td>
					    			<td>${utente.newsletter}</td>
					    			<td>${utente.bloccato}</td>
		                            <td>
			                            <div class="row" style="margin: 0px;">
			                            	<form id="formSetProfilo" method="post" action="setProfilo">
								           		<input type="hidden" id="email" name="email" value="${utente.email}">
								           		<button style="padding: 6px" type="submit" id="btnModificaProfilo" title="Modifica" class="btn btn-link"><i class="material-icons" style="color:blue">&#xE254;</i></button>
								       		</form>								       		
								       			<c:if test="${utente.bloccato == 'false'}">  <!--  se non è bloccato l'utente -->
								       				<button style="padding: 6px" type="submit" id="btnBloccaProfilo" title="Blocca" class="btn btn-link" data-email-blocca="${utente.email}" data-toggle="modal" data-target="#confermaBloccoProfilo"><i class="material-icons" style="color:orange">block</i></button>								       				
		    									</c:if>
		    									<c:if test="${utente.bloccato == 'true'}">  <!--  se è bloccato l'utente -->
								       				<input type="hidden" id="email" name="email" value="${utente.email}">
								       				<button style="padding: 6px" type="submit" id="btnSbloccaProfilo" title="Sblocca" class="btn btn-link" data-email-sblocca="${utente.email}" data-toggle="modal" data-target="#confermaSbloccoProfilo"><i class="material-icons" style="color:green">block</i></button>
		    									</c:if>									       	
								       		<button style="padding: 6px" type="submit" id="btnEliminaProfilo" title="Elimina" class="btn btn-link" data-email-elimina="${utente.email}" data-toggle="modal" data-target="#confermaEliminazioneProfilo"><i class="material-icons" style="color:red">&#xE872;</i></button>
			                            </div>
		                          </td>
		                        </tr>
							   	
					  </c:forEach>
        
                    </tbody>
                </table>
                
            </div>
        </div> 
        
<!--    ----------------- ELIMINAZIONE UTENTE ---------------------->
        
        <div class="modal fade" id="confermaEliminazioneProfilo">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
			<!--  Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">Desideri eliminare l'utente selezionato?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formDeleteUser" method="post" action="deleteUserByAdmin">
			                     <input type="hidden" name="email" value=""/>		                       
			                     <button type="submit" class=" btn btn-block btn-outline-danger" style="float:right"> Si</button> 
			                 </form>
			               </div>	
					   </div>   	               
				   </div>
			   </div>
		   </div>
	     </div>
	 </div>
	 
<!---------------------------- BLOCCO UTENTE ----------------------------------->
	 <div class="modal fade" id="confermaBloccoProfilo">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
	        <!-- Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">Desideri bloccare l'utente selezionato?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formBlockUser" method="post" action="blockUser">
			                     <input type="hidden" name="email" value=""/>		                       
			                     <button type="submit" class=" btn btn-block btn-outline-danger" style="float:right"> Si</button> 
			                 </form>
			               </div>	
					   </div>   	               
				   </div>
			   </div>
		   </div>
	     </div>
	 </div>
	 
	 <!---------------------------- SBLOCCO UTENTE ----------------------------------->
	 <div class="modal fade" id="confermaSbloccoProfilo">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
	        <!-- Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">Desideri sbloccare l'utente selezionato?</h3>
							 <br>
						 </div>
					</div>
	                  <div class="row" style="padding: 10px 10px 10px">
		                  <div class="col" >
			                 <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal" > No</button>							 							     
						   </div>
						   <div class="col">
						     <form id="formUnblockUser" method="post" action="unblockUser">
			                     <input type="hidden" id="email" name="email" value=""/>		                       
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