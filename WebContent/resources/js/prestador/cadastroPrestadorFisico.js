
		$(document).ready(function(){
	
			//Validações do formulário 

			$("#form_cadastroCliente").validate({
					//Regras de validação
					rules:{
						
						cpfCnpj:{
							required: true,
							maxlength: 14,
							minlength: 14,
							remote:{
								url:"procurar_cpf",
								type:"get",
								data:{
									cpfCnpj: function(){
										return $("#cpf").val();
									}
								}
							}
						},

						

						rgIe:{
							required: true,
							maxlength: 13,
							minlength: 13,
							remote:{
								url:"procurar_rg",
								type:"get",
								data:{
									rgIe: function(){
										return $("#rg").val();
									}
								}
							}
						}	

					},

					messages:{
						
						cpfCnpj:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O CPF deve ter  11 digitos.",
							maxlength: "O CPF deve ter  11 digitos.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este CPF já está cadastrado no sistema."
							
						},
						
						rgIe:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O RG deve ter  9 digitos.",
							maxlength: "O RG deve ter  9 digitos.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este RG já está cadastrado no sistema."
							
						}		
					}


				});	
		});

		
