
		$(document).ready(function(){
	
			//Validações do formulário 

			$("#form_cadastroPrestador").validate({
					//Regras de validação
					rules:{
						
						nomeFantasia:{
							required: true,
							maxlength: 100,
							minlength: 2
						},
						
						cpfCnpj:{
							required: true,
							maxlength: 18,
							minlength: 18,
							remote:{
								url:"procurar_cpf",
								type:"get",
								data:{
									cpfCnpj: function(){
										return $("#cnpj").val();
									}
								}
							}
						},

					
						razaoSocial:{	
							maxlength: 100,
							minlength: 10
						},
						
						rgIe:{
							maxlength: 15,
							minlength: 2
						},
						
						telefone:{
							minlength: 14
						}
										

					},

					messages:{
						
						nomeFantasia:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O nome da empresa deve ter no mínimo 2 caracteres.",
							maxlength: "O nome da empresa deve ter no máximo 100 caracteres."
							
						},
						
						cpfCnpj:{
							required: "<span class='glyphicon glyphicon-asterisk'></span> Este campo é obrigatório.",
							minlength: "O CPNJ deve ter  14 digitos.",
							maxlength: "O CPNJ deve ter  14 digitos.",
							remote: "<span class='glyphicon glyphicon-remove'></span> Este CNPJ já está cadastrado no sistema."
							
						},
						
						rgIe:{
							minlength: "O Inscrição estadual deve ter no mínimo 2 caracteres.",
							maxlength: "O Inscrição estadual deve ter no máximo 15 caracteres.",
							
						},
						
						
						telefone:{
							minlength: "O telefone deve ter no mínimo 8 caracteres.",
							maxlength: "O telefone deve ter no máximo 8 caracteres.",
							
						},
						
						razaoSocial:{
							minlength: "A razão social deve ter no mínimo 8 caracteres.",
							maxlength: "A razão social deve ter no máximo 8 caracteres.",
							
						}
															
						
					}


				});
			
			 $("#cnpj").mask("99.999.999/9999-99");			
			 
			 $("#telefone").mask("(99) 9999-9999"); 
			 
			 $("#celular").mask("(99) 9 9999-9999"); 
			 
		

		});

		
