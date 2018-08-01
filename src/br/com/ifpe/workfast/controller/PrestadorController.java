package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PrestadorController {

	// metodo para redirecionar para pagina inicial 
		@RequestMapping("paginaInicialPrestador")
		public String paginaInical() {
			return "prestador/index";
		}
}
