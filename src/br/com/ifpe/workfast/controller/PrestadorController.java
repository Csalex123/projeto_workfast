package br.com.ifpe.workfast.controller;

import java.util.ArrayList;
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
import br.com.ifpe.workfast.model.CidadeAtuacaoServico;
import br.com.ifpe.workfast.model.CidadeAtuacaoServicoDao;
import br.com.ifpe.workfast.model.CidadeDao;
import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Estado;
import br.com.ifpe.workfast.model.EstadoDao;
import br.com.ifpe.workfast.model.ListaPedidosPendentesVO;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
import br.com.ifpe.workfast.model.Servico;
import br.com.ifpe.workfast.model.ServicoDao;
import br.com.ifpe.workfast.model.SolicitacaoContratoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;
import br.com.ifpe.workfast.model.UsuarioProfissao;
import br.com.ifpe.workfast.model.UsuarioProfissaoDao;
import br.com.ifpe.workfast.model.UsuarioServico;
import br.com.ifpe.workfast.model.UsuarioServicoDao;

@Controller
public class PrestadorController {

	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicialPrestador")
	public String paginaInical() {

		return "prestador/index";
	}

	// metodo para mostrar solicitacões
	@RequestMapping(value = "buscarSolicitacoes", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String buscarSolicitacoesIndex(@RequestParam("cas") Integer idUsuario, Model model) {
        
		SolicitacaoContratoDao dao = new SolicitacaoContratoDao();
		List<ListaPedidosPendentesVO> lista = dao.listarPedidosPrestador(idUsuario);
		
		return new Gson().toJson(lista);
	}

	// metodo para redirecionar para pagina especializacao
	@RequestMapping("paginaEspecializacao")
	public String paginaEspecializacao(Model model, HttpServletRequest request) {
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();
		List<UsuarioProfissao> lista = dao.listarProfissaoUsuario(usuario.getIdUsuario());
		model.addAttribute("listaProfissaoUsuario", lista);

		return "prestador/especializacao";
	}

	// metodo para redirecionar para pagina especializacao
	@RequestMapping("adicionarProfissao")
	public String adicionarProfissao(Model model) {

		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		model.addAttribute("listaProfissao", lista);

		return "prestador/addProfissao";
	}

	@RequestMapping(value = "saveProfissaoUsuario", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String saveProfissaoUsuario(@RequestParam("idProfissao") Integer idProfissao,
			@RequestParam("idUsuario") Integer idUsuario) {

		Usuario usuario = new Usuario();
		Profissao profissao = new Profissao();
		usuario.setIdUsuario(idUsuario);
		profissao.setIdProfissao(idProfissao);

		UsuarioProfissao usuarioProfissao = new UsuarioProfissao();
		usuarioProfissao.setProfissao(profissao);
		usuarioProfissao.setUsuario(usuario);

		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();

		boolean existe = dao.existeVinculacao(idUsuario, idProfissao);
		if (!existe) {
			dao.salvar(usuarioProfissao);
		}

		return new Gson().toJson(existe);

	}

	@RequestMapping("deleteUsuarioProfissao")
	public String delete(@RequestParam("id") Integer id, Model model) {

		UsuarioProfissaoDao dao = new UsuarioProfissaoDao();
		dao.remover(id);
		model.addAttribute("msg", "Profissão removido com Sucesso");

		return "forward:paginaEspecializacao";
	}

	/* ------------------------------- Serviço ----------------------------- */

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
	public String ExibirServico(Model modelServico, Model modelCidades, HttpServletRequest request) {
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		UsuarioServicoDao dao = new UsuarioServicoDao();

		List<UsuarioServico> listaUsuarioServico = dao.listarServicosUsuario(usuario.getIdUsuario());

		modelServico.addAttribute("listaUsuarioServico", listaUsuarioServico);

		return "prestador/servicos";
	}

	// metodo para adicionar servicos
	@RequestMapping("servicosAdd")
	public String servicosAdd(Model modelCategoria, Model modelCidades, Model modelEstado, HttpServletRequest request) {

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
		return "prestador/addServico";
	}

	// metodo para editar servicos
	@RequestMapping("servicosEdit")
	public String servicosEdit(@RequestParam("id") Integer idUsuarioServico, Model modelServico, Model modelCategoria,
			Model modelCidadesServicos, Model modelCidades, Model modelEstado, Model lista,
			HttpServletRequest request) {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		UsuarioServicoDao daoServicoUsuario = new UsuarioServicoDao();
		UsuarioServico usuarioServico = daoServicoUsuario.buscarPorId(idUsuarioServico);

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(2);

		CidadeDao daoCidade = new CidadeDao();
		List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());

		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();

		CidadeAtuacaoServicoDao daoCidadesServico = new CidadeAtuacaoServicoDao();
		List<CidadeAtuacaoServico> listaCidadesServico = daoCidadesServico.buscarPorIdUsuarioServico(idUsuarioServico);
		ArrayList<String> listaIdCidades = new ArrayList<String>();
		for (int i = 0; i < listaCidadesServico.size(); i++) {
			listaIdCidades.add(listaCidadesServico.get(i).getCidade().getIdCidade() + "");

		}

		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);
		modelServico.addAttribute("usuarioServico", usuarioServico);
		modelCidadesServicos.addAttribute("listaCidadesServico", listaIdCidades);

		return "prestador/editServico";
	}

	@RequestMapping(value = "updateUsuarioServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String updateServico(@RequestParam("idUsuarioServico") Integer idUsuarioServico,
			@RequestParam("idCategoria") Integer idCategoria, @RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") List<String> cidades, @RequestParam("temp") String[] temp) {

		CategoriaServico categoria = new CategoriaServico();
		categoria.setIdCategoriaServico(idCategoria);
		Servico servico = new Servico();
		servico.setIdServico(idServico);
		servico.setCategoriaServico(categoria);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setIdUsuarioServico(idUsuarioServico);
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();
		controller.update(usuarioServico);
		CidadeAtuacaoServicoDao dao2 = new CidadeAtuacaoServicoDao();
		CidadeAtuacaoServico atuacao;
		List<Cidade> listaCidades = new ArrayList<Cidade>();

		for (int i = 0; i < temp.length; i++) {
			int x = 0;
			String idTemp = temp[i].replaceAll("[^0-9]", "");

			for (int j = 0; j < cidades.size(); j++) {

				String id = cidades.get(j).replaceAll("[^0-9]", "");
				if (idTemp.equals(id)) {
					cidades.remove(j);
					x++;
				}

			}
			if (x == 0) {
				atuacao = dao2.buscarCidade(idUsuarioServico, Integer.parseInt(idTemp));
				if (atuacao != null) {
					dao2.remover(atuacao.getIdAtuacaoServico());
				}
			}

		}

		if (cidades.size() > 0) {
			Cidade cidade;
			for (int i = 0; i < cidades.size(); i++) {
				cidade = new Cidade();
				cidade.setIdCidade(Integer.parseInt(cidades.get(i).replaceAll("[^0-9]", "")));
				listaCidades.add(cidade);
			}
			atuacao = new CidadeAtuacaoServico();
			atuacao.setUsuarioServico(usuarioServico);
			dao2.salvar(atuacao, listaCidades);
		}

		return new Gson().toJson("ExibirServicos");

	}

	@RequestMapping(value = "listarCidades", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String listarCidades(@RequestParam("idUsuarioServico") Integer idUsuarioServico) {

		CidadeAtuacaoServicoDao dao2 = new CidadeAtuacaoServicoDao();

		List<CidadeAtuacaoServico> listaCidades = dao2.buscarPorIdUsuarioServico(idUsuarioServico);

		return new Gson().toJson(listaCidades);

	}

	/* ----------------- Fim Serviço --------------------------------------- */

	// metodo para redirecionar para pagina servicos
	@RequestMapping("paginaServicos")
	public String paginaServicos() {

		return "prestador/servicos";
	}

	// metodo para redirecionar para pagina de cadastro primerio acesso: tipo fisico
	@RequestMapping("cadastroPrestadorFisico")
	public String primeiroAcessoFisico(Model model, Model model2) {
		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model2.addAttribute("listaEstado", listaEstado);
		model.addAttribute("listaAtaucao", lista);

		return "prestador/cadastroPrestadorFisico";
	}

	@RequestMapping("cadastroPrestadorJuridico")
	public String primeiroAcessoJuridico(Model model, Model model2) {
		ProfissaoDao dao = new ProfissaoDao();
		List<Profissao> lista = dao.listar();
		EstadoDao daoEstado = new EstadoDao();
		List<Estado> listaEstado = daoEstado.listar();
		model2.addAttribute("listaEstado", listaEstado);
		model.addAttribute("listaAtaucao", lista);

		return "prestador/cadastroPrestadorJuridico";
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
	public String primeiroAcessoCadastrarServico(Model modelCategoria, Model modelCidades, Model modelEstado,
			HttpServletRequest request) {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		EnderecoDao daoEndereco = new EnderecoDao();
		Endereco enderecoPrestador = daoEndereco.buscarEnderecoUsuarioPrestador(usuario.getIdUsuario());

		CidadeDao daoCidade = new CidadeDao();
		List<Cidade> listaCidades = daoCidade.filtrarPorEstado(enderecoPrestador.getEstado().getIdEstado());

		CategoriaServicoDao dao = new CategoriaServicoDao();
		List<CategoriaServico> listaCategoria = dao.listar();

		modelCategoria.addAttribute("listaCategoria", listaCategoria);
		modelCidades.addAttribute("listaCidades", listaCidades);
		modelEstado.addAttribute("endereco", enderecoPrestador);

		return "prestador/cadastroServicoPrimeiroAcesso";
	}

	@RequestMapping(value = "cadastrarUsuarioServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String cadastrarUsuarioServico(@RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") String[] cidades) {

		Servico servico = new Servico();
		servico.setIdServico(idServico);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();

		UsuarioServico retornoIdUsuarioServico = controller.save(usuarioServico);

		CidadeAtuacaoServico atuacao = new CidadeAtuacaoServico();
		atuacao.setUsuarioServico(retornoIdUsuarioServico);
		List<Cidade> cidadesSelecionadas = new ArrayList<Cidade>();
		Cidade cidade;

		for (int i = 0; i < cidades.length; i++) {
			String id = cidades[i].replaceAll("[^0-9]", "");
			cidade = new Cidade();
			cidade.setIdCidade(Integer.parseInt(id));
			cidadesSelecionadas.add(cidade);
		}

		CidadeAtuacaoServicoController controllerAtuacao = new CidadeAtuacaoServicoController();
		controllerAtuacao.save(atuacao, cidadesSelecionadas);

		return new Gson().toJson("paginaInicialPrestador");

	}

	@RequestMapping(value = "saveServico", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String saveServico(@RequestParam("idServico") Integer idServico,
			@RequestParam("descricao") String descricao, @RequestParam("idUsuario") Integer idUsuario,
			@RequestParam("idsCidades") String[] cidades) {

		Servico servico = new Servico();
		servico.setIdServico(idServico);
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(idUsuario);

		UsuarioServico usuarioServico = new UsuarioServico();
		usuarioServico.setServico(servico);
		usuarioServico.setUsuario(usuario);
		usuarioServico.setDescricao(descricao);

		UsuarioServicoController controller = new UsuarioServicoController();

		boolean existe = controller.existeVinculacao(idUsuario, idServico);
		if (!existe) {
			UsuarioServico retornoIdUsuarioServico = controller.save(usuarioServico);

			CidadeAtuacaoServico atuacao = new CidadeAtuacaoServico();
			atuacao.setUsuarioServico(retornoIdUsuarioServico);
			List<Cidade> cidadesSelecionadas = new ArrayList<Cidade>();
			Cidade cidade;

			for (int i = 0; i < cidades.length; i++) {
				String id = cidades[i].replaceAll("[^0-9]", "");
				cidade = new Cidade();
				cidade.setIdCidade(Integer.parseInt(id));
				cidadesSelecionadas.add(cidade);
			}

			CidadeAtuacaoServicoController controllerAtuacao = new CidadeAtuacaoServicoController();
			controllerAtuacao.save(atuacao, cidadesSelecionadas);

		}

		return new Gson().toJson(existe);

	}

}
