<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

                    <!-- Conteiner de informações da conta do usuário -->
                    <div class="container-fluid" >
                        <div class="fontawesome-list-wrap">
                            <h2 style="text-align: center;"><b>Minha conta</b></h2><br>
                            <section>
                                <div class="row form-group">
                                    <img src="<%=request.getContextPath()%>/resources/img/icon_cliente/img_avatar.png" class="img-responsive img-thumbnail" alt="Gabriel" style="width: 150px; height: 144px; margin-left: 20px; ">
                                    <input type="file" class="btn btn-default" name="">
                                </div>

                                 <div class="row form-group" >    
                                 	<div class="col col-md-3">        
                                 	<button type="button" class="btn btn-primary" > &nbsp;
                                 		<i class="fas fa-upload"></i> Enviar foto</button>    
                                 	</div> 
                                 </div>

                                 <h3 style="text-align: center;">Dados Pessoais</h3><br>

                                <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="cpf" class=" form-control-label">CPF:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="cpf" id="cpf" class="form-control">
                                    </div>
                                 </div>
                               

                                <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="email" class=" form-control-label">Email:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="email" name="email" value="${usuarioLogado.email}" id="email" class="form-control">
                                    </div>
                                 </div>

                                 <div class="row form-group" style="margin-top: 20px;">
                                    <div class="col col-md-3">
                                         <label for="nome" class=" form-control-label">Nome:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="nome" value="${usuarioLogado.nome}" id="nome" class="form-control">
                                    </div>
                                 </div>

                                 <div class="row form-group">
                                    <div class="col col-md-3">
                                         <label for="senha"  class=" form-control-label">Senha:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="password" name="senha" value="${usuarioLogado.senha}" id="senha"  class="form-control">
                                    </div>
                                    <div class="col-2 col-md-2">
                                       <span class="input-group-btn">    
                                         <button style="float: right;" id="olho" type="button" class="btn btn-alert" data-toggle="tooltip" data-placement="top" title="Clique aqui para visualizar sua senha"><i class="glyphicon glyphicon-eye-open"></i></button>
                                       </span>
                                    </div>
                                 </div>

                                  <div class="row form-group">
                                    <div class="col col-md-3">
                                       <label for="select"  class=" form-control-label">Sexo:</label>
                                     </div>
                                          <div class="col-12 col-md-5">
                                               <select name="select" id="select" class="form-control">
                                                       <option value="M">Masculino</option>
                                                       <option value="F">Feminino</option>
                                               </select>
                                           </div>
                                   </div>


                                   <div class="row form-group">
                                    <div class="col col-md-3">
                                         <label for="data"  class=" form-control-label">Data de nascimento:</label>
                                    </div>
                                    <div class="col-12 col-md-5">
                                         <input type="text" name="data" id="data" placeholder="00/00/0000" class="form-control">
                                    </div>
                                 </div>
                               
 
                                
                                <!-- Fim do Filtro de profissão-->
                                <div class="row form-group" style="float: right;">
                                    <div class="col col-md-3">
                                        <button type="button" class="btn btn-primary">
                                        <i class="fas fa-upload"></i>&nbsp; Atualizar dados</button>
                                    </div>
                                 </div>
                            </section><br><br>
                        

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