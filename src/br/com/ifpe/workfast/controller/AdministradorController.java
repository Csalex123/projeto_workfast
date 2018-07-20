package br.com.ifpe.workfast.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;

@Controller
public class AdministradorController {

	@RequestMapping("paginaInicial")
	public String paginaInical() {
		return "administrador/index";
	}
	
	@RequestMapping("telaProfissao")
	public String profissao() {
		return "administrador/profissao";
	}
	
	@RequestMapping("gerenciarCliente")
	public String gerenciarCliente(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listaUsuarioCliente = dao.listarUsuarioCliente();
		model.addAttribute("listaUsuarioCliente", listaUsuarioCliente);
		return "administrador/cliente";
	}
	
	@RequestMapping("gerenciarAdm")
	public String gerenciarAdm(Model model) {
		
		return "administrador/adm";
	}
	
	@RequestMapping("gerenciarPrestador")
	public String gerenciarPrestador(Model model) {
		
		return "administrador/prestador";
	}
	
	
	
	
}
