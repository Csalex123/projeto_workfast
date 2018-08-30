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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/css/theme-prestador.css"
	rel="stylesheet" media="all">
	
<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
 

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
                                            <li class="active"></span>Inf. Cliente</li>
                                            <li >Inf. Serviço</li>
                                            <li>Contrato</li>
                                            <li>Efetuando</li>
                                            <li>Finalizado</li>
                                    </ul>
                                    
                                </section>
                                
                                

                            <section >
                             <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                       <button type="button" id="btnAceitar" class="btn btn-primary">
                                        &nbsp; Aceitar Pedido <i class="fas fa-forward"></i></button>
                                    </div>
                                 </div>
                                 
                                 <div class="row form-group"  style="float: left;">
                                    <div class="col col-md-3">
                                       <button type="button" id="btnRecusar" class="btn btn-danger">
                                        &nbsp;<i class="fas fa-backward"></i> Recusar Pedido</button>
                                    </div>
                                 </div>
                                <h2 style="text-align: center;">Informações do Cliente</h2><br>
                                <p> Neste estágio você terá acesso ao endereço do cliente. Será disponível também para você um mapa, e este mapa traçará uma rota: do seu endereço até a residência do cliente
                                
                                  <c:if test="${proposta.tipoUsuario == '1'}">
									 <b>${proposta.nome}</b>  
							      </c:if>
							      <c:if test="${proposta.tipoUsuario == '2'}">
									 <b>${proposta.nomeFantsia}</b>  
							      </c:if>
							      
							     . Haverá uma botão para aceitar o pedido("Aceitar Pedido") que lhe foi ofertado, caso 
							     você aceite, você será redirecionado para a segunda etapa do pedido. Lá haverá mais informações</p>
                                 <br>

                                <h4 style="text-align: center;"> Endereço do cliente</h4><br>


                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>CEP:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                    ${proposta.cep}
                                        </div>       
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Estado:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                   ${proposta.estado}
                                        </div>       
                                </div>


                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Cidade:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                    ${proposta.cidade}
                                        </div>       
                                </div>


                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Bairro:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                   ${proposta.bairro} 
                                        </div>       
                                </div>


                                 <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Rua:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                   ${proposta.rua} 
                                        </div>       
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Número da casa:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                   ${proposta.numeroCasa}
                                        </div>       
                                </div>


                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label  class=" form-control-label"><b>Complemento:</b></label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                            
                                            <c:if test="${proposta.complemento != null || proposta.complemento != '' }">
												 ${proposta.complemento}   
										     </c:if>
										     <c:if test="${proposta.complemento == null || proposta.complemento == '' }">
												 Complemento não informado!
									         </c:if>
                                                   
                                        </div>       
                                </div>

                                <br><br>
                              
                                <h4 style="text-align: center;"> Traçe uma rota até o cliente</h4><br>

                                 <form method="post" action="index.html">
                                    <fieldset>
                                        
                                        <div>
                                            <label for="txtEnderecoPartida">Endereço de partida(Você):</label>
                                            <input type="text" id="txtEnderecoPartida" class="form-control" name="txtEnderecoPartida" />
                                        </div>
                                        
                                        <div>
                                            <label for="txtEnderecoChegada">Endereço de chegada(Cliente):</label>
                                            <input type="text" id="txtEnderecoChegada" class="form-control" name="txtEnderecoChegada" />
                                        </div><br>

                                         <div class="row form-group"  style="float: right;">
                                            <div class="col col-md-3">
                                                    <div>
                                                        <input type="submit" id="btnEnviar" name="btnEnviar" class="btn btn-primary" value="Traçar rota" />
                                                    </div><br><br>
                                            </div>
                                        </div>

                        
                                    </fieldset>

                                </form>

                                 <div class="row form-group">
                                    <div class="col col-md-3">
                                        </div>
                                            <div class="col-12 col-md-12">
                                        <center>
                                             <label  class=" form-control-label" ><h4>Mapa:</h4></label><br><br>
                                        </center>
                                                <div id="mapa"> </div>
                                         </div>
                                    </div><br><br>


                                      <div class="row form-group">
                                         <div class="col col-md-3">
                                        </div>
                                            <div class="col-12 col-md-12">
                                            <center>
                                                 <label for="select" class=" form-control-label" ><h4>Trajeto:</h4></label><br><br>
                                             </center>
                                                <div id="trajeto-texto"></div> 
                                            </div>
                                    </div><br>
        
                            

                 
                                
                                <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                       <button type="button" id="btnAceitar" class="btn btn-primary">
                                        &nbsp; Aceitar Pedido <i class="fas fa-forward"></i></button>
                                    </div>
                                 </div>
                                 
                                 <div class="row form-group"  style="float: left;">
                                    <div class="col col-md-3">
                                       <button type="button" id="btnRecusar" class="btn btn-danger">
                                        &nbsp;<i class="fas fa-backward"></i> Recusar Pedido</button>
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
	var cas = "${proposta.idProposta}";
	 
	 $("#btnAceitar").click(function() {
		 
		 
		 swal({
			  title: "Você tem certeza que quer aceitar esse pedido?",
			  text: "",
			  icon: "warning",
			  buttons:true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			 
			  if (willDelete) {
				  
				  $.post('aceitarPedido', {
					  cas : cas,
										

					}, function(dadosJSON) {

						swal("Pedido Aceito!", {
						      icon: "success",
						    }).then((value) => {
						    	 swal("Para ver o progresso do pedido aceito, vá no menu [ Solicitações ] na opção [ [ Em aberto ] ] ").then((value) => {
						    		   $.post('verificarEstagios', {
										  cas : cas,
									   },function(dadosJSON) {
											window.location = dadosJSON+"?cas="+cas;
									   });
						    	 });
						 });
						
					});
				  
				  
				  
				  
				
				
			    
			   
			    
			  } 
			  
			});
		 
		 
	 
	 
	 
	 });
   
 $("#btnRecusar").click(function() {
		 
		 
		 swal({
			  title: "Você tem certeza que quer recusar esse pedido?",
			  text: "",
			  icon: "warning",
			  buttons:true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			 
			  if (willDelete) {
				  
				  $.post('recusarPedido', {
					  cas : cas,
										

					}, function(dadosJSON) {

						swal("Pedido recusado!", {
						      icon: "success",
						    }).then((value) => {
						    	
						    	$.post('verificarEstagios', {
									 cas : cas,
							    },function(dadosJSON) {
									window.location = dadosJSON;
								});
						    	
						 });
						
					});
				  
				  
				  
				  
				
				
			    
			   
			    
			  } 
			  
			});
		 
		 
	 
	 
	 
	 });
   
   	 
   	 
   	
		
		
	 
	</script>
	



 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
 	<script
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAU4tZgF7qKxiAMdKz8j0Pa3_TVyNdZgjM&callback=initialize"></script>

    
	<!-- Mapa JS-->
	<script src="<%=request.getContextPath()%>/resources/js/prestador/mapa.js"></script>
	

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