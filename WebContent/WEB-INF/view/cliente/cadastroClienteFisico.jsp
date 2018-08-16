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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<!-- Fonte Google -->
<link href="https://fonts.googleapis.com/css?family=PT+Serif"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Jquery Mask -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>

<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>


<!-- Código JavaScript desta Página(Página de cadastro) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/cliente/cadastroClienteFisico.js"></script>

<!-- Código css desta Página(Página de cadastro) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/cadastro.css" />

</head>
<div class="page-wrapper">

	<div class="container">
		<div class="login-wrap">
			<div class="login-content" style="width: 600px; margin:0 auto; float: none;">

				<div class="login-logo">
					<a href="#"> <img
						src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
						class="img-responsive">

					</a>
				</div><br>
				
				<div style="margin-bottom: 20px;">
						<center>Olá ${usuarioLogado.nome}! Antes de ter acesso ao
							sistema informe algumas informações no formulario abaixo.</center>
				</div>

				<!-- Formulário de cadastro-->

				<div class="login-form">
					<form id="form_cadastroCliente"
						action="salvarDadosPessoais?idTipoAcesso=${usuarioLogado.tipo_acesso.idTipoAcesso}"
						method="post">
						<input type="hidden" value="${usuarioLogado.idUsuario}" name="usuario">
						<input type="hidden" value="" name="nomeFantasia"> <input
							type="hidden" value="" name="razaoSocial">

						<div class="form-group">
							<div class="col-md-6 col-lg-6">
								<label for="cpf">CPF:</label> <input type="text"
									class="form-control" id="cpfCnpj" placeholder="Digite seu cpf"
									name="cpfCnpj">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-6 col-lg-6">
								<label for="rg">RG:</label> <input type="text"
									class="form-control" id="rgIe" placeholder="Digite  seu RG"
									name="rgIe">
							</div>

							<div class="form-group">
								<div class="col-md-6 col-lg-6">
									<label for="data_nascimento">Data de Nascimento:</label> <input
										type="text" class="form-control" id="dataNascimento"
										placeholder="00/00/0000" name="dataNascimento">
								</div>
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-6 col-lg-6">
								<label for="data_nascimento">Sexo:</label> <select
									id="tipo_usuario" name="sexo" class="form-control">
									<option value="1">Masculino</option>
									<option value="2">Feminino</option>
								</select>
							</div>
						</div>



						<div class="form-group">
							<div class="col-md-6 col-lg-6">
								<label for="telefone">Número Telefone fixo :</label> <input
									type="text" class="form-control" id="telefone"
									placeholder="(00) 0000-0000" name="telefone">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-6 col-lg-6">
								<label for="celular">Número Celular :</label> <input type="text"
									class="form-control" id="celular"
									placeholder="(00) 9 0000-0000" name="celular">
							</div>
						</div>





						<div class="col-md-6 col-lg-12"><br>
							<button style="width: 100%" type="submit" id="button_cadastrar"
								class="btn btn-primary">
								<span class="glyphicon glyphicon-ok"></span> Cadastrar
							</button>
						</div>



					</form>

				</div>
			</div>
		</div>
	</div>
</div>






</body>
</html>