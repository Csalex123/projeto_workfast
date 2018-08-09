<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <!-- Required meta tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <!-- Title Page-->
    <title>WorkFast - Cliente</title>

  <!-- Fontfaces CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

     
    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap.min.css" rel="stylesheet" media="all">

    
    <!-- Main CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/theme-cliente.css" rel="stylesheet" media="all">

</head>
<body class="animsition">

	<c:import url="../cliente/menu.jsp"/>
	
	 <!-- Container de conteúdo-->
            <div class="main-content main-content--pb30">
                <div class="section__content section__content--p30">

                	<!-- Conteiner de Filtro -->
                    <div class="container-fluid">
                        <div class="fontawesome-list-wrap">
                            <section >
                                <h2 style="text-align: center;">Filtro</h2><br>
                                
                                <!-- Filtro de estado -->
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select" class=" form-control-label">Estado:</label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                <select name="select" id="select" class="form-control">
                                                        <option value="1">Pernambuco</option>
                                                </select>
                                            </div>
                                     </div>
                                <!-- Fim do Filtro de estado -->


                                <!-- Filtro de Cidade -->
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select" class=" form-control-label">Cidade:</label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                <select name="select" id="select" class="form-control">
                                                        <option value="0">Recife</option>
                                                        <option value="1">Jaboatão dos Guararapes</option>
                                                        <option value="2">Cabo de santo agostinho</option>
                                                </select>
                                            </div>
                                     </div>
                                <!-- Fim do Filtro de cidade -->

                                <!-- Filtro de Faixa de preço -->
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select" class=" form-control-label">Faixa de preço:</label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                <select name="select" id="select" class="form-control">
                                                        <option value="0">Entre R$30 e R$80</option>
                                                        <option value="1">Entre R$80 e R$130</option>
                                                        <option value="2">Entre R$130 e R$200</option>
                                                </select>
                                            </div>
                                     </div>
                                <!-- Fim do Filtro de preço-->

                                <!-- Filtro de Profissão -->
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select" class=" form-control-label">Profissão:</label>
                                        </div>
                                            <div class="col-12 col-md-5">
                                                <select name="select" id="select" class="form-control">
                                                        <option value="0">Eletricista</option>
                                                        <option value="1">Mecânico</option>
                                                        <option value="2">Advogado</option>
                                                        <option value="2">Motorista</option>
                                                </select>
                                            </div>
                                     </div>
                                <!-- Fim do Filtro de profissão-->
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <button type="button" class="btn btn-primary">
                                        <i class="zmdi zmdi-search"></i>&nbsp; Filtrar</button>
                                    </div>
                                 </div>

                            </section> 
                        </div>
                    </div>

                    <!-- Conteiner de listagem de candidatos -->
                    <div class="container-fluid" style="margin-top: 30px;">
                        <div class="fontawesome-list-wrap">
                            <section >
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Foto</th>
                                                <th>Nome</th>
                                                <th>Profissão</th>
                                                <th>Valor</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr >
                                            <td>
                                                <img style="width: 80px; height: 60px;" src="<%=request.getContextPath()%>/resources/img/icon_cliente/icone_mecanico.png" class="img-responsive" />
                                            </td>
                                                <td><a href="#">Diego Passos</a></td>
                                                <td >Mecânico</td>
                                                <td>R$ 100.00</td>
                                                <td>
                                                    <a href="PrimeiroEstagio"><button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Contratar">Contratar <i class="fa fa-handshake-o "></i></button></a>
                                                    <button class="btn btn-danger" class="item" data-toggle="tooltip" data-placement="top" title="Chat">Chat <i class="zmdi zmdi-comment-more"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             </section>    
                        </div>
                    </div>



                   <!-- Conteiner de listagem de candidatos -->
                    <div class="container-fluid" style="margin-top: 30px; margin-bottom: 80px;">
                        <div class="fontawesome-list-wrap">
                            <section >
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>Foto</th>
                                                <th>name</th>
                                                <th>Profissão</th>
                                                <th>Valor</th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr >
                                                <td>
                                                    <img style="width: 80px; height: 60px;" src="images/icon/icone_pedreiro.png" alt="Marcílio God" />
                                                </td>
                                                <td><a href="#">João Silva</a></td>
                                                <td class="desc">Pedreiro</td>
                                                <td>R$ 90.00</td>
                                                <td>
                                                    <button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Contratar">Contratar <i class="fa fa-handshake-o "></i></button>
                                                    <button class="btn btn-danger" class="item" data-toggle="tooltip" data-placement="top" title="Chat">Chat <i class="zmdi zmdi-comment-more"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             </section>  
                             
                             
                                
                        </div>
                    </div>
					
							<section >
				                <div class="container-fluid">
				                    <div class="row">
				                        <div class="col-md-12">
				                            <div class="copyright">
				                                <p>Copyright © 2018 Workfast. Todos direitos reservados.</p>
				                            </div>
				                        </div>
				                    </div>
				                </div>
           					 </section> 

                </div>
            </div>
	



    <!-- Jquery JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%=request.getContextPath()%>/resources/vendor/slick/slick.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/wow/wow.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/animsition/animsition.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<%=request.getContextPath()%>/resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

</body>
</html>