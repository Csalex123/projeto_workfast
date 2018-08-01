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
    
      
    
     <!-- Adicionando JQuery -->
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>
 
    
    <!-- Main CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/theme-cliente.css" rel="stylesheet" media="all">
    
 


</head>


<body class="animsition">

	<c:import url="../cliente/menu.jsp"/>
	
	
	 <!-- Container de conteúdo-->
            <div class="main-content main-content--pb30">
                <div class="section__content section__content--p30">

                     <h2 style="text-align: center; "><b>Meus Endereços</b></h2>


                      <div class="row form-group"  style="float: right;">
                                    <div class="col col-md-3">
                                    <a href="adicionarEndereco">
                                        <button  type="button" class="btn btn-primary" >Adicionar novo endereço</button></a>
                                    </div>
                                 </div><br>

                    <!-- Conteiner de listagem de endereços -->
                    <div class="container-fluid" style="margin-top: 30px;">
                        <div class="fontawesome-list-wrap">
                            <section >
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                                <th>CPE</th>
                                                <th>Rua</th>
                                                <th>Cidade</th>
                                                <th>Nº Casa</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr >
                                                <td><a href="#">54530-40</a></td>
                                                <td >Rua de Jaboatão</td>
                                                <td>Jaboatão</td>
                                                <td>125-A</td>

                                                <td>
                                                    <button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Editar Endereço">Editar <i class="fas fa-edit"></i></button>

                                                    <button class="btn btn-danger" class="item" data-toggle="tooltip" data-placement="top" title="Apagar Endereço">Apagar <i class="fas fa-trash-alt"></i></button>
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
                                                <th>CPE</th>
                                                <th>Rua</th>
                                                <th>Cidade</th>
                                                <th>Nº Casa</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr >
                                                <td><a href="#">24530-40</a></td>
                                                <td >Rua de Recife</td>
                                                <td>Recife</td>
                                                <td>235-A</td>
                                                <td>        </td>
                                                <td>
                                                    <button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Editar Endereço">Editar <i class="fas fa-edit"></i></button>

                                                    <button class="btn btn-danger" class="item" data-toggle="tooltip" data-placement="top" title="Apagar Endereço">Apagar <i class="fas fa-trash-alt"></i></button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                             </section>    
                        </div>
                    </div>
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