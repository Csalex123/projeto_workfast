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

			<h2 id="txt_login">Login do google com sucesso!</h2>

			<div class="row" id="div_button">
				<center>
					<button onclick="myFunction()">
						<a style="text-decoration: none;" href="entrar">
							Voltar
						</a>
					</button>
				</center>
			</div>

			<script>
				function myFunction() {
					gapi.auth2.getAuthInstance().disconnect();
					location.reload();
				}
			</script>
		</div>

	</div>



</body>
</html>