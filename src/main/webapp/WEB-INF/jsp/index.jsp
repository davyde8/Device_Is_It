<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>Device Is It</title>
  	
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
  	<link rel="stylesheet" href="css/home.css" type="text/css"/>
	<jsp:include page="./navbar.jsp" />
	<script src="./js/home.js"></script>
  	
  		
</head>

<body>
    
   <div class="body_header col-lg-12 col-md-12" >
	    <div>
	      <h1 class="text_head" align=right  > Cerca i migliori Device </h1>
	    </div>
  </div>
	


<!-- Ultime News -->
   
    <c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->
	   	<div class="container text-center" style="padding-top:50px;">
	   		 <button type="button" class="btn btn-primary " id="addContenuto"  data-toggle="modal" data-target="#scegliContenuto">Aggiungi un nuovo Contenuto</button>		   	
		</div>    	
	</c:if>                 
            
                              
     <section class="latest-blog">           
	     <div class="container">
	         
	         <c:if test="${ultimeTreRecensioni.size() > 0}"> 
	   			<p id="titolo" > Ultime Recensioni </p>
			 </c:if>

	        <div class="card-columns">   
		         <c:forEach var="contenuto" items="${ultimeTreRecensioni}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->			  
					 <div class="card">
			           
			           <c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->	    			 				          		                  
		                  <div class="row" style="padding: 10px 10px 10px">
			                  <div class="col" >
				                 <button type="button" class="btn btn-sm btn-outline-danger" data-id-contenuto="${contenuto.id}" data-toggle="modal" data-target="#confermaEliminazione" ><i class="icon-trash"></i> Cancella</button>							 							     
							   </div>
							   <div class="col">
							     <form id="formSetContenuto" method="post" action="setContenuto">
				                     <input type="hidden" id="idContenuto" name="idContenuto" value="${contenuto.id}">                 
				                     <button type="submit" class="btn btn-sm btn-outline-info" style="float:right"><i class="icon-cog"></i> Modifica</button> 
				                 </form>
				               </div>	
						   </div>   			        
		    		   </c:if>
			           
			           <img class="card-img-top" src="${contenuto.img}" alt="Card image cap">
			              <div class="card-body">
				              <h5 class="card-title">${contenuto.titolo}</h5>
				              <p class="card-text"> ${contenuto.anteprima} </p>
				              <div class="row">
					              <p class="card-text"><i class="fas fa-calendar-alt" style="padding-left:16px"></i>  ${contenuto.data}</p>
					              <c:if test="${contenuto.numCommenti==1}">
					              	<p class="card-text" style="padding-left: 20px;"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commento</p>
					              </c:if>
					              <c:if test="${contenuto.numCommenti!=1}"> 
					              	<p class="card-text" style="padding-left: 20px;"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commenti</p>
					              </c:if>
				              </div>
				              <form id="formArticolo" method="post" action="Contenuto" align="right">
				                 <input type="hidden" id="id" name="id" value="${contenuto.id}">                 
				                 <button  class="btn btn-outline-success btn-sm" type="submit">Continua a leggere</button>
				              </form>			               
			          	  </div>		               
			          </div>                        
				   </c:forEach>
		  	</div>
	     </div>
    </section>
    
    <section class="latest-blog">           
	     <div class="container">
		     
		     <c:if test="${ultimiTreArticoli.size() > 0}"> 
	   			<p id="titolo" > Ultimi Articoli </p>
			 </c:if>
	     	    
	        <div class="card-columns">   
		         <c:forEach var="contenuto" items="${ultimiTreArticoli}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->			  
					 <div class="card">
			           
			           <c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->
		    			  		    			  
		    			  <div class="row" style="padding: 10px 10px 10px">					                 
				                  <div class="col" >
					                 <button type="button" class="btn btn-sm btn-outline-danger" data-id-contenuto="${contenuto.id}" data-toggle="modal" data-target="#confermaEliminazione" ><i class="icon-trash"></i> Cancella</button>							 							     
								   </div>
								   <div class="col">
								     <form id="formSetContenuto" method="post" action="setContenuto">
					                     <input type="hidden" id="idContenuto" name="idContenuto" value="${contenuto.id}">                 
					                     <button type="submit" class="btn btn-sm btn-outline-info" style="float:right"><i class="icon-cog"></i> Modifica</button> 
					                 </form>
					               </div>	
							   </div>  			        
		    		   </c:if>
			           
			           <img class="card-img-top" src="${contenuto.img}" alt="Card image cap">
			              <div class="card-body">
				              <h5 class="card-title">${contenuto.titolo}</h5>
				              <p class="card-text"> ${contenuto.anteprima} </p>
				              <div class="row">
					           	  <p class="card-text"><i class="fas fa-calendar-alt" style="padding-left:16px"></i>  ${contenuto.data}</p>
					           	  <c:if test="${contenuto.numCommenti==1}">
					              	<p class="card-text" style="padding-left: 20px;"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commento</p>
					              </c:if>
					              <c:if test="${contenuto.numCommenti!=1}"> 
					              	<p class="card-text" style="padding-left: 20px;"><i class="fas fa-comment-alt"></i> ${contenuto.numCommenti} commenti</p>
					              </c:if>
				              </div>
				              <form id="formArticolo" method="post" action="Contenuto" align="right">
				                 <input type="hidden" id="id" name="id" value="${contenuto.id}">                 
				                 <button  class="btn btn-outline-success btn-sm" type="submit">Continua a leggere</button>
				              </form>			               
			          	  </div>		               
			          </div>                        
				   </c:forEach>
		  	</div>
	     </div>
    </section>
    
 <!-- fine "Ultime news  --> 



<!-- Team Section Begin -->
    <section class="team spad set-bg" data-setbg="img/team-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title team__title">

                        <h2>Il nostro Team</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item">
                    <img src="images/davide.jpg" alt="team img">
                        <div class="team__item__text">
                            <h4>Davide Ragona</h4>
                            <p></p>
                            <div class="team__item__social" align="center">
                                <a href="https://www.facebook.com/davide.ragona.7/"><i class="fa fa-facebook"></i></a>
<!--                                 <a href="#"><i class="fa fa-twitter"></i></a> -->
                                <a href="https://www.instagram.com/davyde8/"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item team__item--second set-bg">
                    <img src="images/salvatore.jpg" alt="team img">
                        <div class="team__item__text">
                            <h4>Salvatore Gatto</h4>
                            <p></p>
                            <div class="team__item__social" align="center">
                                <a href="https://www.facebook.com/salvatoregatto12"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.instagram.com/salvatoregatto__/"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                   <div class="team__item team__item--third set-bg">
                   <img src="images/debora.jpg" alt="team img">
                        <div class="team__item__text">
                            <h4>Debora Ippolito</h4>
                            <p></p>
                            <div class="team__item__social" align="center">
                                <a href="https://www.facebook.com/debora.ippolito.3"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.instagram.com/debora_ippolito/"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 p-0">
                    <div class="team__item team__item--four set-bg">
                    <img src="images/caterina.jpg" alt="team img">
                        <div class="team__item__text">
                            <h4>Caterina Gerace</h4>
                            <p></p>
                            <div class="team__item__social" align="center">
                                <a href="https://www.facebook.com/caterina.gerace1"><i class="fa fa-facebook"></i></a>
                                <a href="https://www.instagram.com/caterina_gerace/"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Team Section End -->




	 <div class="modal fade" id="scegliContenuto">
	    <div class="modal-dialog">
	      <div class="modal-content">
	             
	        <!-- Modal body -->
	        <div class="modal-body">
	
				<div class="myform form ">
					<div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<button type="button" class="close" data-dismiss="modal">×</button>
							 <br> <br>
							<h3 class="titolo-loginForm">Schegli il contenuto da aggiungere</h3>
							 <br>
						 </div>
					</div>
	                   
	                   <a class="btn" href="newDevice"> <button type="button" class="btn btn-outline-success btn-block">Device</button> </a>
	                      <br>
	                   <a class="btn" href="newRecensione"> <button type="button" class="btn btn-outline-primary btn-block">Recensione</button> </a>                      									   					  					
				      <br>
					<a class="btn" href="newArticolo"> <button type="button" class="btn btn-outline-info btn-block">News</button> </a>  					 
					 <br>
	                                    
				</div>
			</div>
			 </div>
	     </div>
	 </div>
	 
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