<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Device Is It</title>	
  	<link rel="stylesheet" href="css/commento.css" type="text/css"/>
	<link rel="stylesheet" href="css/blog.css" type="text/css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
	
	<jsp:include page="./navbar.jsp" />
  	<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
    
	
</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v9.0" nonce="snul0jmt"></script>

      <div class="container">
       <div class="row" style="padding-top: 50px">
        <div class="col-9 " style="background-color: white; border-radius:30px;">

          <div class="blog-post">
          <p id="titolo" style="text-align: left; margin-bottom: 0px; padding-top: 10px "> ${contenuto.titolo}</p> 
          	<div class="row">
          		<div class="col">
            		<p class="blog-post-meta"> ${contenuto.data} </p>          
          		</div>
          		
          		<div class="col">
          		
					<div style="float:right; padding-left:5px">
						<a class="twitter-share-button"  href="https://twitter.com/intent/tweet?text=${contenuto.titolo}" data-size="large">	Tweet</a>
					</div>
	          		
	          		<div class="fb-share-button" style="float:right" data-href="https://deviceisit.it/" data-layout="button" data-size="large">
						<a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Flocalhost%3A8080%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Condividi</a>
					</div> 
					
					
          		</div>
          	</div>          
            <p> ${contenuto.testo} </p>
            </div><!-- /.blog-post -->
        </div><!-- /.blog-main -->
       	

        <div class="col-3" style="padding-left: 50px">
			
          <div class="sidebar-module sidebar-module-inset">        
            <h4>Video Correlati       <i class="fab fa-youtube"></i>     </h4>
	            <section id="video">
<!-- 					<iframe width="350" height="200" src="https://www.youtube.com/embed/6n1If16xzXo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
				
						<form class="input-group mb-3" id="form">
				          <div class="input-group mb-3" >
						   <input type="text" class="form-control" id="search" value="${contenuto.titolo}">
						    <div class="input-group-append">
						      <button class="btn btn-success" type="submit">cerca</button>  
						     </div>
						  </div>
				        </form>
				                 
				        <div class="row">
				          <div class="col-12">
				             <div id="videos">				              
				             </div>  
				          </div>
				        </div>			
				</section>
          </div>
          <div class="sidebar-module">
			<c:if test="${contenuto.device != 0}">	
				<form id="formSchedaTecnica" method="post" action="/schedaTecnica">
					<input type="hidden" id="idDevice" name="idDevice" value="${contenuto.device}">			          	
					<button type="submit" style="border-radius:15px; margin-top:15px; height:45px;" class="btn btn-primary">Vai alla scheda tecnica</button>
	            </form>		            
			</c:if>
          </div>
        </div>
      </div>
	</div>

   	

<!-- Main Body -->
<section>
    <div class="container" id="commenti">
        <div class="row">
        	<div class="col-sm-5 col-md-6 col-12 pb-4">
		    	<h3>Commenti</h3>
					<c:forEach var="commento" items="${listaCommenti}">
			                <div class="comment col-12 mt-4 text-justify float-left"> 
			                	 	                 
			                    <input type="hidden" name="idCommento" id="idCommento" value="${commento.idcommento}" disabled>
			                    <div class="row">
				                    <div class="col"> 
				                    	<h4 style="padding-left: 10px; padding-right: 20px">${commento.utente} </h4> <span>${commento.data}</span> 
				                    </div>			                  			                     
				                 	<div class="row" style="padding-right: 10px"> 
					                 	<c:if test="${usernameLogged == 'admin@admin.it' || username == commento.utente}">   <!--  se è loggato l'admin -->
											    <div class="col" style="margin: 0px; padding: 0px"> 
												    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></a>					                       					  
								                    <div class="dropdown-menu">	                        
								                    	<form id="formDeleteCommento" action="#">
										                     <input type="hidden" id="idComm" name="idComm" value="${commento.idcommento}"/>			                       
										                     <button type="submit" class=" btn btn-block btn-outline-danger" style="float:right"> Elimina commento</button> 
										                 </form>
								                    </div>
							                    </div>
						                    </c:if>	
						                    <div>
						                    <div class="col" > 
							                    <button onclick="addLike(${commento.idcommento})" class="btn btn-outline-danger btn-sm" style="float:right; width:50px; padding:0px">			                    			                   					                     				                   
							                    <div class="row">
								                    <i class="far fa-heart" style="padding:6px 8px 6px 20px ; "></i> 
								                    <p style="margin:0px; padding-top:2px; padding-bottom: 0px; " id="${commento.idcommento}"> ${commento.mipiace} </p>	
							                    </div>		                   
						                    </button>
						                    </div>
					                    	</div> 	
					                    </div>
				                    </div>			                 			                   
				                 <br>			                    
			                     <p>${commento.testo}</p>
			                     
			                </div>
			  		</c:forEach>
			  		<div id="nuoviCommenti"></div>			     
	         </div>
            
            
            <div class="col-lg-4 col-md-5 col-sm-4 offset-md-1 offset-sm-1 col-12 mt-4">
            	<c:if test="${usernameLogged == null}">  <!--  se non c'è un username loggato mostrami il login -->
	                    <div>
	                        <h4>Effettua il login per lasciare un commento!</h4>
<!-- 		                         <label for="message">Messaggio</label> -->
<!-- 		                         <textarea name="msg" id="testCommento" msg cols="30" rows="5" class="form-control"></textarea> -->
	                    </div>                                                         
<!-- 	                    <div class="form-group"> <button type="button" id="submitCommento" href="AggiungiCommento" class="btn">Posta il Commento</button> </div> -->
	             </c:if>
	             
	             <c:if test="${usernameLogged != null}">
	             	<form id="formCommento">
						<div class="form-group">
							<input type="hidden" name="user" id="user" value="${username}" disabled>
						</div>
						<input type="hidden" id="idContenuto" value="${contenuto.id}">	
						<input type="hidden" id="emailUtente" value="${usernameLogged}">	
						
						<div class="form-group" id="formAggiungiCommento">
							<textarea id="testoCommento" name="testoCommento" rows="5" cols="60" placeholder="Scrivi qui il tuo commento..."></textarea>										
							<button type="button" id="submitCommento" class="btn btn btn-success">Invia commento</button>
						</div>	
	             	</form>
	             </c:if>
	             
            </div>
        </div>
    </div>
</section>

		



</body>
<jsp:include page="./footer.jsp" />
<script src="/js/commento.js"></script>  
<!-- <script src="/js/api.js"></script>   -->
</html>