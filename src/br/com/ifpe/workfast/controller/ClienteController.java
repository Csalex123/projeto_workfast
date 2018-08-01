package br.com.ifpe.workfast.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;

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

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("meuEnderecos")
	public String meusEndereco() {
		return "cliente/meuEnderecos";

	}

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("adicionarEndereco")
	public String adicionarEndereco() {
		return "cliente/adicionarEndereco";

	}
}
