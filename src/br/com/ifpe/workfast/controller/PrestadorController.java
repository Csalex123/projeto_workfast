package br.com.ifpe.workfast.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.ifpe.workfast.model.CategoriaServico;
import br.com.ifpe.workfast.model.CategoriaServicoDao;
import br.com.ifpe.workfast.model.Cidade;
import br.com.ifpe.workfast.model.CidadeDao;
import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;
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
	
/* ------------------------------- Serviço  -----------------------------*/
	
	// metodo para redirecionar para pagina de Serviço pendentes
	@RequestMapping("ServicosPendentes")
	public String servicosPendente() {
		return "prestador/servico_aberto";
	}
	
	
	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("ServicosFinalizados")
	public String servicosFinalizado() {
		return "prestador/servico_finalizado";
	}
	
	
	// metodo para redirecionar para pagina de Serviço finalizados
	@RequestMapping("Propostas")
	public String propostas() {
		return "prestador/proposta";
    }
	
	
	@RequestMapping("PrimeiraEtapa")
	public String primeiroEtapa() {
		return "prestador/1_estagio";
	}
	

	@RequestMapping("SegundaEtapa")
	public String segundaEtapa() {
		return "prestador/2_estagio";
	}
	

	@RequestMapping("TerceiraEtapa")
	public String terceiraEtapa() {
		return "prestador/3_estagio";
	}
	

	@RequestMapping("QuartaEtapa")
	public String quartaEtapa() {
		return "prestador/4_estagio";
	}
	
	@RequestMapping("QuintaEtapa")
	public String quintaEtapa() {
		return "prestador/5_estagio";
	}
	
	// metodo para redirecionar para pagina servicos
		@RequestMapping("ExibirServicos")
		public String ExibirServico() {
			return "prestador/servicos";
		}

		// metodo para adicionar servicos
		@RequestMapping("servicosAdd")
		public String servicosAdd() {
			return "prestador/addServico";
		}

		// metodo para editar servicos
		@RequestMapping("servicosEdit")
		public String servicosEdit() {
			return "prestador/editServico";
		}
		
	
	
/* -----------------  Fim Serviço ---------------------------------------*/
	
	

	// metodo para redirecionar para pagina servicos
	@RequestMapping("paginaServicos")
	public String paginaServicos() {
		return "prestador/servicos";
	}

	// metodo para redirecionar para pagina de cadastro primerio acesso: tipo fisico
	@RequestMapping("primeiroAcessoFisico")
	public String primeiroAcessoFisico() {
		return "prestador/cadastroPrestadorFisico";
	}

	@RequestMapping("editarDadosPrestadorFisico")
	public String paginaAlterarPrestadorFisico(@RequestParam("IdUsuario") Integer idUsuario, Model model,
			Model model2) {

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
	public String minhaConta(Model model, Model model2, HttpServletRequest request) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(usuario.getIdUsuario());
		Endereco endereco = dao2.buscarEnderecoUsuarioPrestador(usuario.getIdUsuario());

		model.addAttribute("dadosPessoais", dados);
		model2.addAttribute("endereco", endereco);
		return "prestador/minhaConta";
	}

	// metodo para redirecionar para pagina servicos
	@RequestMapping("alterarDadosPessoais")
	public String alterarDadosPessoaisMinhaConta(@RequestParam("nome") String nome, @RequestParam("email") String email,
			DadosPessoais dados, Model model) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		EnderecoDao dao2 = new EnderecoDao();
		UsuarioDao dao3 = new UsuarioDao();

		Usuario usuario = dao3.buscarPorId(dados.getUsuario().getIdUsuario());
		usuario.setNome(nome);
		usuario.setEmail(email);

		dao.alterar(dados);
		// dao2.alterar(endereco);
		// dao3.alterar(usuario);

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

	// metodo para filtrar cidade por estado
	@RequestMapping(value = "filtrarCidade", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filtraCidade(@RequestParam Integer idEstado) {

		CidadeDao dao = new CidadeDao();
		List<Cidade> listaCidade = dao.filtrarPorEstado(idEstado);
		return new Gson().toJson(listaCidade);
	}

	// metodo para filtrar servico por categoria
	@RequestMapping(value = "filtrarServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String filtraServico(@RequestParam Integer idCategoria) {

		ServicoDao dao = new ServicoDao();
		List<Servico> listaServico = dao.filtrarPorCategoria(idCategoria);
		return new Gson().toJson(listaServico);
	}

	// metodo para vincular o servico primeiro acesso no sistema
	@RequestMapping("vincularServico")
	public String primeiroAcessoCadastrarServico(Model modelCategoria,Model modelCidades,Model modelEstado,HttpServletRequest request) {
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
        
		EnderecoDao daoEndereco = new EnderecoDao();
        Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(2);
        
        CidadeDao daoCidade = new CidadeDao();
        List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());
        
        CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();
		
		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);
		

		return "prestador/cadastroServicoPrimeiroAcesso";
	}

}
