<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  
  	<title>Device is it</title>
  	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet"> <!--  icone cancella e modifica contenuto -->
    <link rel="stylesheet" href="css/news.css" type="text/css"/>
    <jsp:include page="./navbar.jsp" />
    <script src="/js/eliminaContenuto.js"></script>  
    

</head>
<body>
  
    <div class="row" style="margin-top:16px;">
	   <div class="col"> 
	      <p id="titolo" style="text-align:center"> News  <i class="fas fa-newspaper"></i>   </p>
	   </div>
  	   <c:if test="${usernameLogged == 'admin@admin.it'}">  <!--  se è loggato l'admin -->
  	      <div class="col"> 		   
		   	  <a class="btn" href="newArticolo"> <button style="float:left; margin-top:30%;" type="button" class="btn btn-info btn-block">Aggiungi News</button> </a>  					 			
		  </div>	
	   </c:if> 
    </div>
	
	

  
  <section id="schede" style="margin-bottom: 50px; margin-top: 40px">   
        
    <div class="container">
        <div class="card-columns">      
          <c:forEach var="contenuto" items="${listaContenuto}"> <!-- stesso nome che abbiamo passato al model nella classe DeviceController rigo  23 -->
            <div class="card">
 			  <c:if test="${usernameLogged == 'admin@admin.it'}" >  <!--  se è loggato l'admin -->	    			  
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
                    <p class="card-text">${contenuto.anteprima}</p>
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
	                    <button class="btn btn-outline-success btn-sm" type="submit">Continua a leggere</button>
			         </form>
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