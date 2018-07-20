package br.com.ifpe.workfast.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.workfast.model.TipoAcesso;
import br.com.ifpe.workfast.model.TipoAcessoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;

@Controller
public class indexController {

	// Método para chamar a página de cadastro
	@RequestMapping("cadastro")
	public String cadastro(Model model) {
		
		TipoAcessoDao dao = new TipoAcessoDao();
		List<TipoAcesso> listaTipoAcesso = dao.listar();
		model.addAttribute("listaTipoAcesso", listaTipoAcesso);
		
		return "cadastrar";
	}
	
	//Método para validar e-mail do banco de dados
	@RequestMapping("disponivel")
	@ResponseBody
	public String emailDisponivel(@RequestParam("email") String email, UsuarioDao usuario){
		Boolean disponivel = usuario.buscarPorEmail(email) == null;
		return disponivel.toString();
}

	// Método para chamar a página de login
	@RequestMapping("entrar")
	public String login() {
		return "login";
	}
	
		

	// Método para chamar a página de login google success
	@RequestMapping("googleSuccess")
	public String loginGoogleSuccess() {
		return "success";
	}
	
	// Método para fazer a inclusão do usuário
		@RequestMapping("incluirUsuario")
		public String save(Usuario usuario) {
			
			UsuarioDao dao = new UsuarioDao();
			dao.salvar(usuario);
			
			return "UsuarioSucesso";
		}

	// Método para efetuar o login
	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		 
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		
		
		if (usuarioLogado != null) {
			
			if(usuarioLogado.getAtivo().equals("1")) {
				
				if(usuarioLogado.getTipo_acesso().getDescricao().equals("Cliente")) {
					session.setAttribute("usuarioLogado", usuarioLogado);
					return "cliente/index";	
				}else if(usuarioLogado.getTipo_acesso().getDescricao().equals("Prestador de Serviços")) {
					session.setAttribute("usuarioLogado", usuarioLogado);
					return "prestador/index";
				}else if(usuarioLogado.getTipo_acesso().getDescricao().equals("Administrador")) {
					session.setAttribute("usuarioLogado", usuarioLogado);
					return "administrador/index";
				}
				
			}else {
			  
				model.addAttribute("msg", "Seu acesso ao sistema esta bloqueado temporariamente!");
				
				return "login";
				
			}
			
			
		}
		model.addAttribute("msg", "Não foi encontrado o usuário com o login e senha informados.");
		
		return "login";
	}
}
