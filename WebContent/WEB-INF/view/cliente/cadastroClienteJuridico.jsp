<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<!-- Importando a biblioteca Taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WorkFast</title>

	<!-- Boostrap via CDN -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- Fonte Icons -->
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">


	<!-- Fonte Google -->
	<link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">

	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- Jquery Mask -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

	<!-- Jquery validate -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>
	
	
	<!-- Código JavaScript desta Página(Página de cadastro) -->	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/cliente/cadastroClienteJuridico.js"></script>
	
	<!-- Código css desta Página(Página de cadastro) -->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/cadastro.css"/>
	
</head>
<body>

	<div class="container" >

		<div>
			<img id="img_logo" src="<%=request.getContextPath()%>/resources/img/logo_workfast.png" class="img-responsive">
		</div>

		
		<div class="panel panel-default col-sm-5" id="container_cadastro">
			<h2 id="txt_cadastrar">Cadastrar dados de sua empresa</h2>

			<!-- Formulário de cadastro-->
			<div class="panel-body">
			
				<form action="salvarDadosPessoais?idTipoAcesso=${usuarioLogado.tipo_acesso.id}" id="form_cadastroPrestador" method="post">
				  <input type="hidden" value="${usuarioLogado.id}" name="usuario">
				    <input type="hidden" value=" " name="sexo">
				    <input type="hidden" value="01/10/2000" name="dataNascimento">
				    <input type="hidden" value=" " name="celular">
				
					<div class="form-group">
						<label for="empresa">Nome da empresa:</label>
						<input type="text"  class="form-control" id="empresa" placeholder="Digite o nome da empresa" name="nomeFantasia">
					</div>
				
					<div class="form-group">
						<label for="cpnj">CPNJ:</label>
						<input type="text"  class="form-control" id="cnpj" placeholder="Digite seu CPNJ" name="cpfCnpj">
					</div>
					
					<div class="form-group">
						<label for="razao_social">Razão Social:</label>
						<input type="text"  class="form-control" id="razao_social" placeholder="Digite sua Razão Social" name="razaoSocial">
					</div>
					
					<div class="form-group">
						<label for="inscricao">Inscrição estadual:</label>
						<input type="text"  class="form-control" id="inscricao" placeholder="Digite  sua Inscrição estadual" name="rgIe">
					</div>
				
					
					<div class="form-group">
						<label for="telefone">Número Telefone fixo :</label>
						<input type="text"  class="form-control" id="telefone" placeholder="(00) 0000-0000" name="telefone">
					</div>
					
							
					
					
					<div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" id="button_cadastrar" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Enviar</button>
						</div>
					</div>	
					
					
				</form>
			</div>
		</div>
	</div>
</div>





</body>
</html>