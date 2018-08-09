package br.com.ifpe.workfast.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
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

	// Método para validar e-mail do banco de dados
	@RequestMapping("disponivel")
	@ResponseBody
	public String emailDisponivel(@RequestParam("email") String email, UsuarioDao usuario) {
		Boolean disponivel = usuario.buscarPorEmail(email) == null;
		return disponivel.toString();
	}

	// Método para validar cpf do banco de dados
	@RequestMapping("procurar_cpf")
	@ResponseBody
	public String cpfDisponivel(@RequestParam("cpfCnpj") String cpf, DadosPessoaisDao usuario) {
		Boolean disponivel = usuario.buscarPorCpf(cpf) == null;
		return disponivel.toString();
	}

	// Método para validar cpf do banco de dados
	@RequestMapping("procurar_rg")
	@ResponseBody
	public String procurar_rg(@RequestParam("rgIe") String rg, DadosPessoaisDao usuario) {
		Boolean disponivel = usuario.buscarPorRG(rg) == null;
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
		DadosPessoaisDao dao2 = new DadosPessoaisDao();

		Usuario usuarioLogado = dao.buscarUsuario(usuario);

		if (usuarioLogado != null) {

			if (usuarioLogado.getAtivo().equals("1")) {

				DadosPessoais dados = dao2.buscarDadosPessoaisUsuario(usuarioLogado.getId());

				if (usuarioLogado.getTipo_acesso().getDescricao().equals(TipoAcesso.getTipoCliente())) {

					session.setAttribute("usuarioLogado", usuarioLogado);

					if (dados == null) {
						if (usuarioLogado.getTipo_usuario().equals("1")) {
							return "cliente/cadastroClienteFisico";
						} else {
							return "cliente/cadastroClienteJuridico";
						}
					}

					return "cliente/index";

				} else if (usuarioLogado.getTipo_acesso().getDescricao().equals(TipoAcesso.getTipoPrestador())) {
					session.setAttribute("usuarioLogado", usuarioLogado);

					if (dados == null) {

						if (usuarioLogado.getTipo_usuario().equals("1")) {
							ProfissaoDao daoProfissao = new ProfissaoDao();
							List<Profissao> listaProfissao = daoProfissao.listar();
							model.addAttribute("listaProfissao", listaProfissao);
							return "prestador/cadastroPrestadorFisico";
						} else {
							return "prestador/cadastroPrestadorJuridico";
						}
					}
					return "prestador/index";
				} else if (usuarioLogado.getTipo_acesso().getDescricao().equals(TipoAcesso.getTipoAdministrador())) {
					session.setAttribute("usuarioLogado", usuarioLogado);
					return "administrador/index";
				}

			} else {

				model.addAttribute("msg", "Seu acesso ao sistema esta bloqueado temporariamente!");

				return "login";

			}

		}
		model.addAttribute("msg", "Não foi encontrado o usuário com o login e senha informados.");

		return "login";
	}

	// metodo para encerra a sessao do usuario no sistema
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}
}
