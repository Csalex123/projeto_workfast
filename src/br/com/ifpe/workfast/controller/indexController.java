package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {
	
	//Método para chamar a página de cadastro
		@RequestMapping("cadastro")
			public String cadastro() {
				return "cadastrar";
		}
		
		
		//Método para chamar a página de login
		@RequestMapping("entrar")
			public String login() {
			 	return "login";
		}
}	
