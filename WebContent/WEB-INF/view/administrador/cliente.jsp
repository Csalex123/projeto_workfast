<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">

<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Required meta tags-->
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <!-- Title Page-->
    <title>WorkFast - Area do Administrador</title>

 
    <!-- Bootstrap CSS-->
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap.min.css" rel="stylesheet" media="all">

    
    <!-- Main CSS-->
    <link href="<%=request.getContextPath()%>/resources/css/theme-adm.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
 
    <div class="page-wrapper">
      <!-- menu adm -->
      <c:import url="../administrador/menu.jsp"/>
        
        <!-- Conteudo-->
        <div class="page-content--bgf7">
            
             <!-- DATA TABLE-->
            <section class="p-t-20">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <h3 class="title-5 m-b-35">Clientes</h3>
                              <hr class="line-seprate">
                              <br>
                            <div class="table-data__tool">
                                <div class="table-responsive table-responsive-data2">
                                     <form>
                                         <div class="form-group">
                                               
                                                <input type="text" id="txtPesquisa" name="txtPesquisa" placeholder="Pesquise aqui.." class="form-control">
                                                
                                            </div>
                                    </form>
                                </div>
                               
                            </div>
                            <div class="table-responsive table-responsive-data2"  style="padding-bottom: 20%">
                                <table class="table table-data2">
                                    <thead>
                                        <tr>
                                            
                                            <th>Nome</th>
                                            <th>Email</th>
                                            
                                            <th>Ativo</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbCliente">
                                      <c:forEach var="usuarioCliente" items="${listaUsuarioCliente}">
                                        <tr class="tr-shadow">
                                           
                                            <td width="180">${usuarioCliente.nome}</td>

                                            <td>
                                                <span>${usuarioCliente.email}</span>
                                            </td>
                                            
                                            <td>
                                              <label class="au-checkbox">
                                                   <c:choose>
														<c:when test="${usuarioCliente.ativo == '1'}">
														  <input type="checkbox" CHECKED> 
														</c:when>
														<c:otherwise>
														  <input type="checkbox"> 
														</c:otherwise>
												   </c:choose>
                                                    
                                                    <span class="au-checkmark"></span>
                                              </label>
                                            </td>
                                           
                                            <td>
                                                <div class="table-data-feature">
                                                   
                                                    <button class="item" data-toggle="tooltip" data-placement="top" title="Excluir">
                                                        <i class="zmdi zmdi-delete"></i>
                                                    </button>
                                                   
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="spacer"></tr>
                                      
                                      </c:forEach>
                                      
                                        
                                         
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END DATA TABLE-->


            <!-- COPYRIGHT-->

            <section class="p-t-60 p-b-20" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="copyright">
                                <p>Copyright © 2018 WorkFast. Todos os direitos reservados..</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END COPYRIGHT-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    
    

    <!-- Main JS-->
    <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
     
     <script>
		$(document).ready(function(){
		  $("#txtPesquisa").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#tbCliente tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		</script> 

</body>

</html>
<!-- end document-->