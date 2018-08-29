<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Required meta tags-->

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


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


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	

</head>

<body class="animsition">

	<div class="page-wrapper">
		<!-- menu adm -->
		<c:import url="../prestador/menu.jsp" />

		<section class="au-breadcrumb m-t-75" style="margin-bottom:60px;">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="au-breadcrumb-content">
							<div class="au-breadcrumb-left" style="margin-top: 5px;">
								<h1 class="title-4">
									Bem vindo <span>${usuarioLogado.nome}</span>
								</h1>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		
		<section>
		<div class="section__content section__content--p30">
			
				
				<div class="container" style="padding-bottom: 50%;" style="background-color:white;" >
				   <p><h3>Proposta de Serviços</h3></p>
				   <br>
				   <div id="propostas" >
				   
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
	
	var cas = "${usuarioLogado.idUsuario}";
	function listarSolicitacoes(){
		
		$('#propostas').html(' ').fadeOut(200);
		
		 $.post('buscarSolicitacoes', {
	          
			 cas:cas,
	          
	        	   
	       }, function(dadosJSON){
	    	   
	     	  var linhas = " ";
	     	  
					if(dadosJSON.length > 0){$(dadosJSON).each(function (i) {
						
							linhas += '<div class="media shadow-sm p-3 mb-5 bg-white rounded" style="background-color:white; padding-top:1px; padding-left:1px; padding-right:1px;" >';
							  linhas += '<div class="media-left" >';
							    linhas += '<img src="/workfast/resources/img/icon/avatar-05.jpg" class="media-object" style="width:90px">';
							  linhas += '</div>';
							  linhas += '<div class="media-body" style="margin-left:15px;">';
							    if(dadosJSON[i].tipoUsuario == '1'){
							    	linhas += '<h4 style="margin-top: -5px;" class="media-heading">'+dadosJSON[i].nome+'</h4>';
							    }
							    if(dadosJSON[i].tipoUsuario == '2'){
							    	linhas += '<h4 style="margin-bottom: 5px;" class="media-heading">'+dadosJSON[i].nomeFantasia+'</h4>';
							    }
							    linhas += '<div class="table-responsive" style="margin-top:10px;">';
							    linhas += '<table class="table table-condensed >';
							    
							    linhas += '<tbody>';
								    linhas += '<tr>';
									    linhas += '<td colspan ="4"><label style="font-size:12px;"><b>Serviço</b></label><br>'+dadosJSON[i].servico+'</td>';
									linhas += '</tr>';
									linhas += '<tr>';
									    linhas += '<td><label style="font-size:12px;"><b>Cidade</b></label><br>'+dadosJSON[i].cidade+'</td>';
									    linhas += '<td><label style="font-size:12px;"><b>Endereço</b></label><br>'+dadosJSON[i].rua+'</td>';
									    linhas += '<td><label style="font-size:12px;"><b>Numero Casa</b></label><br>'+dadosJSON[i].numeroCasa+'</td>';
								    linhas += '</tr>';
								    linhas += '<tr>';
								    linhas += '<td colspan ="4"><label style="font-size:12px;"><b>Mensagem</b></label><br>'+dadosJSON[i].mensagem+'</td>';
								    linhas += '</tr>';
								    linhas += '<tr>';
								      linhas += '<td colspan ="4" ><div style="float:right;"><a href="PrimeiraEtapa?cas='+dadosJSON[i].idProposta+'"><button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Contratar">Veja mais <i class="fa fa-handshake-o "></i></button></a></div></td>';
								    linhas += '</tr>';
								    
							    linhas += '</tbody>';
							    
							    
							    linhas += '</table>';
							    
							    linhas += '</div>';
							    
							    
							linhas += '</div>';
						linhas += '</div>';
							
						linhas += '<hr>';
							
							
							
						       	
						       	  
							
						});
						$('#propostas').html(linhas).fadeIn(1200);
						
					}else{
						$('#propostas').html('<br><br><center><span>Não tem solicitação</span></center>').fadeIn(1200);
					}

					
	             
	       });

	} 
	
	$(document).ready(function(){
		listarSolicitacoes(); 
		 
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