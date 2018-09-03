<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/img/icon/fivicon.png">

<!-- Required meta tags-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Title Page-->
<title>WorkFast - Cliente</title>

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
	href="<%=request.getContextPath()%>/resources/css/theme-cliente.css"
	rel="stylesheet" media="all">



<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

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
</style>
</head>

<body class="animsition">

	<c:import url="../cliente/menu.jsp" />

	<!-- Container de conte�do-->
	<div class="main-content main-content--pb30">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="fontawesome-list-wrap">
					<section>
						<h3 style="text-align: center;">Progresso do pedido</h3>
						<br>
						<ul id="progress">
							<li></span>Endere�o</li>
							<li>Informa��es</li>
							<li class="active">Contrato</li>
							<li>Efetuando</li>
							<li>Finalizado</li>
						</ul>

					</section>

					<section>
						<h2 style="text-align: center;">Contratro</h2>
						<br>

						<p>Este est�gio ser� o contrato que voc� far� com o prestador
							de servi�o, tendo em vista que se voc� concordar(Clicando no
							bot�o avan�ar) em contrat�-lo voc� n�o podera mais cancelar este
							pedido ou tentar excluir sua conta do sistema, pois voc� est� se
							responsabilizando em contrata-lo. Obs.: S� avance para o pr�ximo
							est�gio se voc� realmente tiver certeza que ir� querer contratar
							este colaborador, caso contr�rio cancele este pedido.</p>
						<br>

						<div class="row form-group" style="float: right;">
							<div class="col col-md-3">
								<button type="button" class="btn btn-danger">
									&nbsp;<i class="fa fa-times" aria-hidden="true"></i> Cancelar o
									pedido
								</button>
							</div>
						</div>
						<br>
						<br>
						<br>



						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Foto do prestador de
									servi�o:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>
									<img src="<%=request.getContextPath()%>/resources/img/icon_cliente/icone_mecanico.png" alt="Marc�lio God"
										style="height: 70px; width: 110px;" />
								</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Nome do prestador de
									servi�o:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>Pedro Silva</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Profiss�o do prestador de
									servi�o:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>Eletricista</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Data do Servi�o:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>21/12/2018</p>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Valor do Servi�o:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>R$ 150,00</p>
							</div>
						</div>


						<div class="row form-group">
							<div class="col col-md-5">
								<label for="select" class=" form-control-label"
									style="font-weight: bold;">Forma de pagamento:</label>
							</div>
							<div class="col-12 col-md-5">
								<p>Dinheiro</p>
							</div>
						</div>


						<div class="row form-group" style="float: right;">
							<div class="col col-md-3">
								<a href="QuartoEstagio"><button type="button" class="btn btn-primary">
									&nbsp;<i class="fas fa-forward"></i> Avan�ar
								</button></a>
							</div>
						</div>

					</section>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>


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