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

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

<!-- Código JavaScript desta Página(Página de cadastro) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/prestador/cadastroPrestadorFisico.js"></script>

</head>
<body class="animsition">
	<div class="page-wrapper">

		<div class="container">
			<div class="login-wrap">
				<div class="login-content" style="width: 600px;">

					<div class="login-logo">
						<a href="#"> <img
							src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
							class="img-responsive">

						</a>
					</div>
					<div style="margin-bottom: 20px;">
						<center>Olá, ${usuarioLogado.nome}! Escolha o servico que deseja realizar.</center>
					</div>
					<div class="login-form">
						<form action="#" method="post">
							
							<div class="form-group">
								<label>Categoria</label> <select required="required"
									id="categoria" name="categoriaServico" class="form-control">
									<option value="">Selecione</option>
									<c:forEach items="${listaCategoria}" var="obj">

										<option value="${obj.idCategoriaServico}">${obj.nome}</option>


									</c:forEach>

								</select>
							</div>
							
							<div class="form-group">
								<label>Serviços</label> <select required="required"
									id="servicos" name="servicos" class="form-control">
									

								</select>
							</div>
							
							<div class="form-group ">
							<label for="descricao" class=" form-control-label">Digite um breve descrição sobre o serviço escolhido! (255 caracteres)</label> 
										
                               <textarea  required="required" name="descricao" id="descricao"  placeholder="Digite aqui..." class="form-control"></textarea>
                            
							</div>
							
							 <div class="col-lg-12">
                                <div class="au-card au-card--bg-blue au-card-top-countries m-b-30">
                                    <div class="au-card-inner">
                                        <div class="table-responsive">
                                         
                                         <center>Area de atuação do Serviço</center>
                                            <table class="table table-top-countries">
                                               <thead>
													<tr>
				
														<th>${endereco.estado.nome} </th>
														
													</tr>
												</thead>
                                                <tbody>
                                                	<c:forEach items="${listaCidades}" var="obj">
                                                	
                                                	<tr>
                                                        <td>${obj.nome} </td>
                                                        <td class="text-right"><label class="au-checkbox">
                                                            <input type="checkbox">
                                                            <span class="au-checkmark"></span>
                                                        </label></td>
                                                    </tr>

														
					
													</c:forEach>
                                                
                                                    
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                  </div>
                               </div>
							
							
							

							<button class="au-btn au-btn--block au-btn--green m-b-20"
								type="submit">Cadastrar</button>

						</form>

					</div>
				</div>

			</div>
		</div>


	</div>

	<!-- Jquery JS-->
	<script type="text/javascript">
	
	var selectOption = document.getElementById("categoria");
    selectOption.addEventListener('change', function(){
    	$('#servicos').html("");
       var id = $(this).val();
      
       //encaminhando os valores do formulario para ser processadas 
         $.post('filtrarServico', {
            idCategoria:id
            
          }, function(dadosJSON){
        	  var linhas = '';
        	  linhas += "<option value='' >Selecione </option>";
				

				$(dadosJSON).each(function (i) {
				
					linhas += "<option value='"+dadosJSON[i].idServico+"'>"+dadosJSON[i].nome+"</option>";
				
				});
				$('#servicos').html(linhas);
                
          });

       
        
      return false;// impedindo o encaminhamento
      


       
    });


	
	</script>
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


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.0/jquery.mask.js"></script>

	

</body>
</html>