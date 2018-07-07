<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>

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

	<!-- Jquery validate -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>
	
	
	<!-- Código JavaScript desta Página(Página de cadastro) -->	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/cadastro.js"></script>
	
	<!-- Código css desta Página(Página de cadastro) -->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/cadastro.css"/>
	
</head>
<body>

	<div class="container" >

		<div>
			<img id="img_logo" src="<%=request.getContextPath()%>/resources/img/logo_workfast.png" class="img-responsive">
		</div>

		
		<div class="panel panel-default col-sm-5" id="container_cadastro">
			<h2 id="txt_cadastrar">Cadastrar-se</h2>

			<!-- Formulário de cadastro-->
			<div class="panel-body">
				<form action="" id="form_cadastro">
					<div class="form-group">
						<label for="email">E-mail:</label>
						<input type="email"  class="form-control" id="email" placeholder="Digite  seu e-mail" name="email">
					</div>


					<div class="form-group">
						<label>Senha:</label>
						<div class="row">
							<div class="col-sm-10" >
								<input type="password"   class="form-control"  id="senha" placeholder="Digite uma senha" name="senha">
							</div>

							<div class="col-sm-2">
								<span class="input-group-btn">
									<button style="float: right;" id="olho" type="button" class="btn btn-alert" data-toggle="tooltip" data-placement="top" title="Clique aqui para visualizar sua senha"><i class="glyphicon glyphicon-eye-open"></i></button>
								</span>
							</div>
						</div>
					</div>



					<div class="form-group">
						<label for="repetir_senha">Confirmar senha:</label>
						<input type="password" class="form-control" id="repetir_senha"   name="senha2"   placeholder="Confirme sua senha" >
					</div>

					<div class="form-group">
						<label >Tipo de acesso:</label>
						<div> 
							<select class="form-control">
								<option selected="">Cliente</option>
								<option>Prestador de Serviços</option>
							</select>
						</div>
					</div>


					<div class="checkbox">
						Aceite os <a data-toggle="tooltip" data-placement="top" title="Clique aqui para ler os termos">termos de uso</a>

						<label><input name="contrato" type="checkbox" value="">&nbsp &nbsp </label>
					</div>
					<div class="form-group"> 
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" id="button_cadastrar" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Cadastrar-se</button>
						</div>
					</div>

					<p id="p_mensagem">
						Já tem uma conta?
						<a href="entrar" style="color: red;" data-toggle="tooltip" data-placement="top" title="Se clicar você será redirecionado para a página de login">Fazer login</a>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>