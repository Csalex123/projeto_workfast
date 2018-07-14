<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WorkFast</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Login google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="1012288331395-k24u9pj63e593k273179pbtrigshvj2p.apps.googleusercontent.com">

<!-- Fonte Google -->
<link href="https://fonts.googleapis.com/css?family=PT+Serif"
	rel="stylesheet">

<!-- Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Jquery validate -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/localization/messages_pt_BR.js"></script>


<!-- Código JavaScript desta Página(Página de login) -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/entrar.js"></script>

<!-- Código css desta Página(Página de cadastro) -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/entrar.css" />


</head>
<body>

	<div class="container">
		<div>
			<img id="img_logo"
				src="<%=request.getContextPath()%>/resources/img/logo_workfast.png"
				class="img-responsive">
		</div>

		<div class="panel panel-default col-sm-4" id="container_login">

			<h2 id="txt_login">Efetuar login</h2>

			<!-- Formulário de cadastro-->
			<div class="panel-body">
			
			
				<form action="efetuarLogin" method="post" id="form_login">

					<div class="form-group">
						<label for="email">E-mail:</label> <input type="text"
							class="form-control" id="inputLogin"
							placeholder="Digite  seu e-mail" name="login"
							value="${usuario.login}" maxlength="20" required="required"
							tabindex="1">
					</div>

					<div class="form-group">
						<label>Senha:</label> <input type="password" class="form-control"
							id="inputSenha" placeholder="Digite sua senha" name="senha"
							value="${usuario.senha}" maxlength="20" required="required"
							tabindex="2">
					</div>
			</div>

			<div>
				<a href="" style="color: red; font-weight: bold;"
					data-toggle="modal" data-target="#modal_recuperar_senha">Esqueceu
					sua senha?</a>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="button_login" class="btn btn-primary">
						Entrar</button>
				</div>
			</div>

			<div>
				<p id="p_mensagem">
					Ainda não tem uma conta? <a href="cadastro" style="color: green;"
						data-toggle="tooltip" data-placement="top"
						title="Se clicar você será redirecionado para a página de cadastro">Cadastrar-se</a>
				</p>
			</div>

			</form>

			<hr>

			<div class="row" id="div_button">
				<center>
					<button class="btn btn-default" id="facebook"
						style="float: left; margin-left: 9%">Facebook</button>

					<!--	Login Google	-->
					<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>

					<img id="myImg"> <br>
					<p id="name"></p>

					<div id="status"></div>

					<script type="text/javascript">
						function onSignIn(googleUser) {
							// window.location.href='success.jsp';

							var profile = googleUser.getBasicProfile();
							var imagurl = profile.getImageUrl();
							var name = profile.getName();
							var email = profile.getEmail();
							document.getElementById("myImg").src = imagurl;
							document.getElementById("name").innerHTML = name;

							document.getElementById("myP").style.visibility = "hidden";

							document.getElementById("status").innerHTML = 'Bem vindo '
									+ name
									+ '! <a href="googleSuccess"?email='
									+ email
									+ '&name='
									+ name
									+ '/>Continue com o login do Google</a></p>'

						}
					</script>

					<button onclick="myFunction()">Sair</button>

					<script>
						function myFunction() {
							gapi.auth2.getAuthInstance().disconnect();
							location.reload();
						}
					</script>
					<!--	Fim Login Google	-->

					<!-- <button class="btn btn-default" id="google">Google</button> -->
				</center>
			</div>
		</div>

	</div>
	</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="modal_recuperar_senha" role="dialog"
		media="all" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<!-- Conteúdo da modal-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Recuperar senha</h4>
				</div>

				<div class="modal-body">
					<form id="form_recuperar_senha">
						<div class="form-group">

							<!-- Formulário para recuperar senha -->
							<label for="email">Informe seu e-mail:</label> <input
								type="email" name="email2" class="form-control"
								placeholder="Digite seu e-mail">
						</div>
						<button class="btn btn-primary form-control">Enviar</button>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>
			</div>

		</div>
	</div>


</body>
</html>