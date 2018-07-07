
		$(document).ready(function(){

			//Função que muda o input do tipo passwd para text
			$("#olho").click(function(){
				var senha = $("#senha");
				var olho = $("#olho");

				olho.mousedown(function() {
					senha.attr("type", "text");
				});

				olho.mouseup(function() {
					senha.attr("type", "password");
				});


				$("#olho").mouseout(function() { 
					$("#senha").attr("type", "password");
				});

			});

			//Validações do formulário 

			$("#form_cadastro").validate({
					//Regras de validação
					rules:{

						email:{
							required: true,
							maxlength: 100,
							minlength: 8,
							email: true
						},

						senha:{
							required: true,
							rangelength: [6,18]
						},

						senha2:{
							required: true,
							equalTo: "#senha"
						},

						contrato:{
							required: true,

						}

					},

					messages:{
						email:{
							required: "Este campo é obrigatório.",
							minlength: "O e-mail deve ter no mínimo 8 caracteres.",
							maxlength: "O e-mail deve ter no máximo 100 caracteres."
							
						},

						senha:{
							required: "Este campo é obrigatório",
							rangelength: "Por favor, forneça uma senha entre 6 e 18 caracteres de comprimento.",
							
						},

						senha2:{
							required: "Este campo é obrigatório",
							equalTo: "As senhas são diferentes, verifique."

						},

						contrato:{
							required: "Você deve aceitar os termos."

						}
					}


				});

		});

		
