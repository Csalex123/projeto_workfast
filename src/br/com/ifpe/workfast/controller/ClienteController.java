package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClienteController {
	// metodo para redirecionar para pagina inicial 
		@RequestMapping("paginaInicialCliente")
		public String paginaInical() {
			return "cliente/index";
		}
		
		// metodo para redirecionar para o perfil do cliente 
		@RequestMapping("minhaContaCliente")
		public String perfil() {
			return "cliente/minhaConta";
		}
}
