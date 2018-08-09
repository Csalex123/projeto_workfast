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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>

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
						<center>Olá, ${usuarioLogado.nome}! Antes de ter acesso ao
							sistema informe algumas informações no formulario abaixo.</center>
					</div>
					<div class="login-form">
						<form
							action="cadastrarDadosPrimeiroAcesso?idTipoAcesso=${usuarioLogado.tipo_acesso.id}"
							method="post">
							<input type="hidden" value="${usuarioLogado.id}" name="usuario">
							<input type="hidden" value="" name="nomeFantasia"> <input
								type="hidden" value="" name="razaoSocial">

							<div class="form-group">
								<label>Especialização</label> <select required="required"
									id="profissao" name="profissao" class="form-control">
									<option value="">Selecione</option>
									<c:forEach items="${listaProfissao}" var="obj">

										<option value="${obj.id}">${obj.nome}</option>


									</c:forEach>

								</select>
							</div>
							<div class="row">
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>CPF</label> <input required="" id="cpf"
											class="au-input au-input--full" type="text" name="cpfCnpj"
											placeholder="Digite seu cpf">
									</div>

								</div>
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>RG</label> <input required="" id="rg"
											class="au-input au-input--full" type="text" name="rgIe"
											placeholder="Digite seu rg">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Sexo</label> <select id="sexo" name="sexo"
											class="form-control">
											<option value="">Selecione o seu sexo</option>
											<option value="1">Masculino</option>
											<option value="2">Feminino</option>
										</select>
									</div>

								</div>
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Data de Nascimento</label> <input id="dtNascimento"
											class="au-input au-input--full" type="text"
											name="dataNascimento" placeholder="00/00/0000">
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Telefone</label> <input id="telefone"
											class="au-input au-input--full" type="text" name="telefone"
											placeholder="(00) 0000-0000">
									</div>

								</div>
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Celular</label> <input id="celular"
											class="au-input au-input--full" type="text" name="celular"
											placeholder="(00) 90000-0000">
									</div>
								</div>
							</div>


							<hr>
							<div class="form-group">
								<label>Cep</label> <input id="cep"
									class="au-input au-input--full" type="text" name="cep"
									placeholder="Digite seu CEP">
							</div>
							<div class="row">
								<div class="col-md-6 col-lg-6">

									<div class="form-group">
										<label>Endereço</label> <input id="endereco"
											class="au-input au-input--full" type="text" name="logradouro"
											placeholder="Digite seu endereco">
									</div>

								</div>
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Bairro</label> <input id="bairro"
											class="au-input au-input--full" type="text" name="bairro"
											placeholder="Digite seu bairro">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 col-lg-6">

									<div class="form-group">
										<label>Cidade</label> <input id="cidade"
											class="au-input au-input--full" type="text" name="cidade"
											placeholder="Digite seu cidade">
									</div>
								</div>
								<div class="col-md-6 col-lg-6">
									<div class="form-group">
										<label>Estado</label>
										<select class="form-control" id="estado" name="estado">
											<option value="">Selecione</option>
											<option value="AC">Acre</option>
											<option value="AL">Alagoas</option>
											<option value="AP">Amapá</option>
											<option value="AM">Amazonas</option>
											<option value="BA">Bahia</option>
											<option value="CE">Ceará</option>
											<option value="DF">Distrito Federal</option>
											<option value="ES">Espirito Santo</option>
											<option value="GO">Goiás</option>
											<option value="MA">Maranhão</option>
											<option value="MS">Mato Grosso do Sul</option>
											<option value="MT">Mato Grosso</option>
											<option value="MG">Minas Gerais</option>
											<option value="PA">Pará</option>
											<option value="PB">Paraíba</option>
											<option value="PR">Paraná</option>
											<option value="PE">Pernambuco</option>
											<option value="PI">Piauí</option>
											<option value="RJ">Rio de Janeiro</option>
											<option value="RN">Rio Grande do Norte</option>
											<option value="RS">Rio Grande do Sul</option>
											<option value="RO">Rondônia</option>
											<option value="RR">Roraima</option>
											<option value="SC">Santa Catarina</option>
											<option value="SP">São Paulo</option>
											<option value="SE">Sergipe</option>
											<option value="TO">Tocantins</option>
										</select>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label>Numero</label> <input id="cep"
									class="au-input au-input--full" type="text" name="numero"
									placeholder="Digite o numero">
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

	<script type="text/javascript">
		$(document).ready(function() {
			var $campoCpf = $("#cpf");
			$campoCpf.mask('000.000.000-00', {
				reverse : true
			});

			var $campoRg = $("#rg");
			$campoRg.mask('0.000.000', {
				reverse : true
			});

			var $campoData = $("#dtNascimento");
			$campoData.mask('00/00/0000', {
				reverse : true
			});

			var $campoDataM = $("#celular");
			$campoDataM.mask('(00) 00000-0000', {
				reverse : true
			});

			var $campoTelefone = $("#telefone");
			$campoTelefone.mask('(00) 0000-0000', {
				reverse : true
			});
			
			var $campoCep = $("#cep");
			$campoCep.mask('00.000-000', {
				reverse : true
			});

		});
	</script>
	<script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formulário_cep() {
                // Limpa valores do formulário de cep.
                $("#endereco").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
                
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dígitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#endereco").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#estado").val("...");
                        

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#endereco").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#estado").val(dados.uf);
                                
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulário_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            });
        });

    </script>


</body>
</html>