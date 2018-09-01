<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

<script type="text/javascript">

$(document).ready(function(){
	carregarPendencias();
});


$(document).ready(function(){
	$("#form_cadastroPendencias").submit(function() {
	    		  
			   var mensagem = $("#mensagem").val();  
			   var idContrato = $("#id_contrato").val();
  
			 $.post('adicionarPendencias',{
		           
				 mensagem:mensagem,
				 idContrato:idContrato,
		          
		          }, function(data){    
		        	  swal("Pendência cadastrada com sucesso.","","success"); 
		        	  carregarPendencias();
		        	  $("#mensagem").val("");  
		          });

		return false;
	  });
});

function carregarPendencias(){
	
	//encaminhando os valores do formulario para ser processadas 
	$.post('ListarPendencias',{
	   
	 }, function(dadosJSON){
		  var linhas = '';
		  
		  linhas += '<div class="table-responsive table-responsive-data2">';
		  linhas += '<table class="table table-data2">';
		  linhas += '<thead>';
			  linhas += '<tr>';
				  linhas += '<th><h4>Pedência(s) já enviada(s) por você</h4></th>';
				  linhas += '<th></th>';
			  linhas += '</tr>';
		  linhas += ' </thead>';
		  
			$(dadosJSON).each(function (i) {
	
			    linhas += '<tr>';
				    linhas += '<td>'+dadosJSON[i].mensagem+' <br><br> <b style="color:blue"> Data Postado: '+dadosJSON[i].dataPostagem+ ' </b></td>';
				    linhas += '<td><div class="table-data-feature">';
				    linhas += '<button onclick="deletar('+ dadosJSON[i].idPendencias +')" class="item" data-toggle="tooltip" data-placement="top" title="Apagar Pedência" >';
				    linhas += '<i class="zmdi zmdi-delete"></i></button></div></td>';
			    linhas += '</tr>';
			    
			  
			    
		    linhas += '</tbody>';
		    	
			});
			
		  
			linhas += ' </table>';
			linhas += ' </div>';
            
                     
			$('#dadosPendencias').html(linhas);
			   
	 });
	
}


</script>
	


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
                                            <li >Inf. Serviço</li>
                                            <li >Contrato</li>
                                            <li class="active">Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>

                            <section >
                               <h2 style="text-align: center;">Efetuando o serviço</h2><br>
                                <p>Nesta etapa você poderá enviar pedências ao cliente, como faltas de matérias etc. Esta estapa poderá ser vista pelo usuário como serviço em andamento.</p><br>

                                <h4 style="text-align: center;"> Envie pendências ao Cliente</h4><br>

								<form id="form_cadastroPendencias" action="adicionarPendencias" method="post" >													
	                                <textarea requiered="" name="mensagem" id="mensagem" class="form-control" placeholder="Ex.: Olá, cliente!  Você precisa comprar esses materiais para continuar o serviço (...)"></textarea><br>
									<input type="hidden" id="id_contrato" name="solicitacaoContrato" value="11">
									
	                                <div class="row form-group"  style="float: right;">
	                                    <div class="col col-md-3">
	                                        <button type="submit" class="btn btn-primary">Enviar</button>
	                                    </div>
	                                 </div><br><br><br><br>    
                                </form>

							<div id="dadosPendencias"></div>
                             <br><br><br>

                 
                                <!-- Fim do Filtro de profissão-->
                                <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                       <a href="QuintaEtapa"> <button type="button" class="btn btn-primary">
                                        &nbsp;<i class="fas fa-forward"></i> Avançar</button></a>
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
	
	<script>
	function deletar(id) {
		swal({
		  title: "Você tem certeza?",
		  text: "Uma vez deletado, você não poderá recuperar esta pendência",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {  
			  $.post('apagarPendencia',{
					 idPendencia:id,
			          
			          }, function(data){    
			        	  swal("Pendência apagada com sucesso.","","success"); 
			        	  carregarPendencias();
			          });
		  }
		});  
}
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