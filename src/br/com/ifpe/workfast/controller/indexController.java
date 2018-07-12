package br.com.ifpe.workfast.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;

@Controller
public class indexController {

	// Método para chamar a página de cadastro
	@RequestMapping("cadastro")
	public String cadastro() {
		return "cadastrar";
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

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		if (usuarioLogado != null) {
			session.setAttribute("usuarioLogado", usuarioLogado);
			return "home";
		}
		model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
		return "login";
	}
}
