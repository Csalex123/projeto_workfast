package br.com.ifpe.workfast.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;

@Controller
public class PrestadorController {

	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicialPrestador")
	public String paginaInical() {
		return "prestador/index";
	}

	// metodo para redirecionar para pagina especializacao
	@RequestMapping("paginaEspecializacao")
	public String paginaEspecializacao() {
		return "prestador/especializacao";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("paginaServicos")
	public String paginaServicos() {
		return "prestador/servicos";
	}
	
	@RequestMapping("editarDadosPrestadorFisico")
	public String paginaAlterarPrestadorFisico( @RequestParam("IdUsuario") Integer idUsuario, Model model, Model model2) {
		
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();
		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(idUsuario);
		Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(idUsuario);
		    
		model.addAttribute("dadosPessoais", dados);
		model2.addAttribute("endereco", endereco);
		return "prestador/alterarDadosPrestadorFisico";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("minhaConta")
	public String minhaConta(Model model,Model model2, HttpServletRequest request) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		
	    DadosPessoais dados = dao.buscarDadosPessoaisUsuario(usuario.getId());
	    Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(usuario.getId());
	    
	    model.addAttribute("dadosPessoais", dados);
	    model2.addAttribute("endereco", endereco);
		return "prestador/minhaConta";
	}
	
	// metodo para redirecionar para pagina servicos
		@RequestMapping("alterarDadosPessoais")
		public String alterarDadosPessoaisMinhaConta(@RequestParam("nome") String nome, @RequestParam("email") String email, DadosPessoais dados, Model model) {
			DadosPessoaisDao dao = new DadosPessoaisDao();
			EnderecoDao dao2 = new EnderecoDao();
			UsuarioDao dao3 = new UsuarioDao();
			
   		    Usuario usuario = dao3.buscarPorId(dados.getUsuario().getId());
   		    usuario.setNome(nome);
   		    usuario.setEmail(email);
	
			
		    dao.alterar(dados);
		    //dao2.alterar(endereco);
//		    dao3.alterar(usuario);
		    
		    model.addAttribute("msg", "Dados Alterados com sucesso!");
		   
			return "prestador/minhaConta";
		}

		// metodo para redirecionar para pagina servicos
				@RequestMapping("alterarDadosEndereco")
				public String alterarMinhaContaEndereco(Endereco endereco, Model model) {
					
					EnderecoDao dao2 = new EnderecoDao();

				    dao2.alterar(endereco);

				    
				    model.addAttribute("msg", "Dados Alterados com sucesso!");
				   
					return "prestador/minhaConta";
				}

}
