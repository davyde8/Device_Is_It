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
  
  	 <div class="container">
	  <form action="/action_page.php" id="formDevice">
	    <div class="row">
	      <div class="col-20">
	        <label for="fname">Modello</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="modello" name="modello" placeholder="inserici modello" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Marca</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="marca" name="marca" placeholder="inserici marca" required>
	      </div>
	    </div>
	    
	    <div class="row">
	      <div class="col-20">
	        <label for="country">Tipo Device</label>
	      </div>	    
	      <div class="col-80">	      	    
	  	   		<select id="tipoDevice" name="device">
		          <option value="1">Smartphone</option>
		          <option value="2">Computer</option>		          
		        </select>
	   	  </div>
	    </div>
	    
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Memoria</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="memoria" name="memoria" placeholder="inserici memoria" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Ram</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="ram" name="ram" placeholder="inserici ram" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Display</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="display" name="display" placeholder="inserici display" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Batteria</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="batteria" name="batteria" placeholder="inserici batteria" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="subject">Fotocamera</label>
	      </div>
	      <div class="col-80">
	        <textarea id="fotocamera" name="fotocamera" placeholder="inserisci fotocamera" style="height:50px" required></textarea>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="subject">CPU</label>
	      </div>
	      <div class="col-80">
	        <textarea id="cpu" name="cpu" placeholder="inserisci cpu" style="height:50px" required></textarea>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Peso</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="peso" name="peso" placeholder="inserisci peso" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">OS</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="os" name="os" placeholder="inserisci os" required>
	      </div>
	    </div>
        <div class="row">
	      <div class="col-20">
	        <label for="fname">Immagine</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="img" name="img" placeholder="inserisci url immagine" required>
	      </div>
	    </div>
	    <div class="row" >
	       <br>
		   <div class="col-12">
		   	  <button  type="submit" id="btnPubblicaDevice" class="btn btn btn-success">Pubblica</button>		   	  
		   </div>
	    </div>
	  </form>
	 </div>


</body>
	 <jsp:include page="./footer.jsp" />
	 <script src="./js/creaDevice.js"></script> 
</html>