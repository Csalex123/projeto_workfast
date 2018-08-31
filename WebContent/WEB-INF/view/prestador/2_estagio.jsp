<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Required meta tags-->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<style type="text/css">

* {
    box-sizing: border-box;
}

#progress {
    padding: 0;
    list-style-type: none;
    font-family: arial;
    font-size: 12px;
    clear: both;
    line-height: 1em;
    margin: 0 -1px;
    text-align: center;
}

#progress li {
    font-size: 1.4em;
    float: left;
    padding: 10px 30px 10px 40px;
    background: #333;
    color: #fff;
    position: relative;
    border-top: 1px solid #666;
    border-bottom: 1px solid #666;
    width: 19%;
    margin: 0 1px;
    margin-bottom: 50px;
}

#progress li:before {
    content: '';
    border-left: 16px solid #fff;
    border-top: 16px solid transparent;
    border-bottom: 16px solid transparent;
    position: absolute;
    top: 0;
    left: 0;
    
}
#progress li:after {
    content: '';
    border-left: 16px solid #333;
    border-top: 16px solid transparent;
    border-bottom: 16px solid transparent;
    position: absolute;
    top: 0;
    left: 100%;
    z-index: 20;
}

#progress li.active {

    font-weight: bold;
    background: #23468c;
}

#progress li.active:after {
    border-left-color: #23468c;
}

/*Mapa*/

#mapa { width: 100%; height: 400px; float: left }
#trajeto-texto { width: 100%; height: 400px; overflow: scroll }
</style>


<!-- Title Page-->
<title>WorkFast - Area do Prestador</title>

<!-- Fontfaces CSS-->
<link href="<%=request.getContextPath()%>/resources/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">


<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap.min.css"
	rel="stylesheet" media="all">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body class="animsition">

	<div class="page-wrapper">
		<!-- menu adm -->
		<c:import url="../prestador/menu.jsp" />
<!-- Container de conteúdo-->
            <div class="main-content main-content--pb30">
                <div class="section__content section__content--p30">


                    <!-- Conteiner de Filtro -->
                    <div class="container-fluid">
                        
                        <!-- Conteiner de listagem de candidatos -->         
                                
                        <div class="fontawesome-list-wrap">
                               <section>
                                    <h3 style="text-align: center;">Progresso do pedido</h3><br>    
                                    <ul id="progress">
                                            <li ></span>Inf. Cliente</li>
                                            <li class="active">Inf. Serviço</li>
                                            <li >Contrato</li>
                                            <li>Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>

                            <section >
                            <sectio>
                               <h2 style="text-align: center;">Informações do Serviço</h2><br>
                                <center><p> Aqui você terá um fórum para se comunicar com o cliente para tirar a suas dúvidas sobre o serviço que ele vai querer.</p></center><br>

                                <h4 style="text-align: center;"> chat</h4><br>
                            </sectio>
                                
                                
                                
                                
                                <div id="chat" class="container mt-3" style="left:10px; top:20px; height: 400px; z-index:1; overflow: auto; padding-bottom: 300px;">
								  
								  
								  
								  
								 
								  
								</div>
								
                                <div class="row ">
                                    <div class="col col-md-10">
                                       <div class="form-group">
										  <label for="mensagem">Mensagem:</label>
										  <textarea class="form-control" rows="3" id="mensagem"></textarea>
										</div>
                                    </div>
                                    <div class="col col-md-2">
                                       <div class="form-group">
										  <label for="mensagem"> &nbsp;</label>
										   <button type="button" id="enviarMensagem" class="btn btn-primary" style="width:100%; height: 100%;">
                                               &nbsp;<i class="fas fa-forward"></i> Enviar</button>
								       </div>
                                      
                                    </div>
                                 </div>
                                  <div class="row ">
                                    
                                    <div class="col col-md-12">
                                       <div class="form-group">
										  <label for="mensagem"> &nbsp;</label>
										   <a href="TerceiraEtapa?cas=${proposta.idSolicitacaoContrato}"></a><button type="button" class="btn btn-primary" style="width:100%; height: 100%;">
                                               &nbsp;<i class="fas fa-forward"></i> Ir ao contrato</button></a>
								       </div>
                                      
                                    </div>
                                 </div>

                            </section><br><br>
                        </div>
                    </div>
                </div>
            </div>
		</section>

		<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="copyright">
						<p>
							Copyright © 2018 WorkFast. Todos os direitos reservados.
						</p>
					</div>
				</div>
			</div>
		</div>
		</section>

	</div>

	</div>
	
	<script type="text/javascript">
	var idProposta = "${proposta.idSolicitacaoContrato}";
    var idCliente = "${proposta.usuario.idUsuario}";
    var idPrestador = "${usuarioLogado.idUsuario}";
     
	function popularChat(idProposta,idCliente,idPrestador){
		 
		   $('#chat').html(' ').fadeOut(100);
		  
		   $.post('popularChat', {
	           idProposta:idProposta,
	           idCliente:idCliente,
	           idPrestador:idPrestador,
	           
	        	   
	       }, function(dadosJSON){
	     	  var linhas = " ";
	     	  
					if(dadosJSON.length > 0){
						
						$(dadosJSON).each(function (i) {
							
							if(dadosJSON[i].enviadoPor == "${usuarioLogado.idUsuario}"){
								
								linhas += ' <div class="media border p-3">';
									linhas += ' <div class="media-body">';
									 if(dadosJSON[i].tipoUsuarioPrestador == '1'){
										 linhas += '  <h4>'+dadosJSON[i].nomePrestador+' <small><i>Agosto 30, 2018</i></small></h4>';
									 }else if(dadosJSON[i].tipoUsuarioPrestador == '2'){
										 linhas += '  <h4>'+dadosJSON[i].nomeFantasiaPrestador+' <small><i>Agosto 30, 2018</i></small></h4>';
									 }
									
									linhas += '  <p>'+dadosJSON[i].mensagem+'</p>';
									linhas += ' </div>';
									linhas += '<img src="/workfast/resources/img/icon/avatar-01.jpg"  class="ml-3 mt-3 rounded-circle" style="width:60px;">';
								
								linhas += ' </div>';
								linhas += ' <br>';
							}else{
								

								linhas += ' <div class="media border p-3">';
								linhas += '<img src="/workfast/resources/img/icon/avatar-03.jpg"  class="ml-3 mt-3 rounded-circle" style="width:60px;">';
									linhas += ' <div class="media-body">';
									 if(dadosJSON[i].tipoUsuarioCliente == '1'){
										
										 linhas += '  <h4>'+dadosJSON[i].nomeCLiente+' <small><i>Agosto 30, 2018</i></small></h4>';
									 }else if(dadosJSON[i].tipoUsuarioCliente == '2'){
										
										 linhas += '  <h4>'+dadosJSON[i].nomeFantasiaCliente+' <small><i>Agosto 30, 2018</i></small></h4>';
									 }
									
									linhas += '  <p>'+dadosJSON[i].mensagem+'</p>';
									linhas += ' </div>';
									
								
								linhas += ' </div>';
								linhas += ' <br>';
							}
								
							
						});
						$('#chat').html(linhas).fadeIn(1200);
						
					}else{
						$('#chat').html('<br><br><center><span>Escreva uma mensagem!</span></center>').fadeIn(1200);
					}

					
	             
	       });

	   }
	
	  $(document).ready(function(){
		   popularChat(idProposta,idCliente,idPrestador);
		   
	   });
	  
	  $("#enviarMensagem").on('click',function(){
		  if($('#mensagem').val() == null || $('#mensagem').val() == ""){
			  swal("Digite uma mensagem.","","warning");
			  
		  }else{
			  var msg = $('#mensagem').val();
			  $.post('enviarMensagemChatPrestador', {
		           msg:msg,
		           idPrestador:idPrestador,
		           idCliente:idCliente,
		           idProposta:idProposta,
		           
		        	   
		       }, function(dadosJSON){
		    	   
		    	   if(dadosJSON == "send"){
		    		   popularChat(idProposta,idCliente,idPrestador);
		    		   $('#mensagem').val('');
		    	   }
		       });
		  }
		  
	  });

	</script>


	<!-- Jquery JS-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/slick/slick.min.js">
    </script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
    </script>

	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

</body>

</html>
<!-- end document-->