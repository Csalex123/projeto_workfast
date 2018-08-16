package br.com.ifpe.workfast.controller;

import java.util.List;

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

@Controller
public class ClienteController {
	// metodo para redirecionar para pagina inicial
	@RequestMapping("paginaInicialCliente")
	public String paginaInical() {
		return "cliente/index";
	}

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("minhaContaCliente")
	public String perfil(Model model, HttpServletRequest request) {
		DadosPessoaisDao dao = new DadosPessoaisDao();
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");

		DadosPessoais dados = dao.buscarDadosPessoaisUsuario(usuario.getIdUsuario());
		model.addAttribute("dadosPessoais", dados);

		return "cliente/minhaConta";

	}

	// metodo para redirecionar para o perfil do cliente
	@RequestMapping("adicionarEndereco")
	public String adicionarEndereco() {
		return "cliente/adicionarEndereco";

	}

	// Método para salvar o endereço do usuário
	@RequestMapping("salvarEndereco")
	public String salvarEndereco(Endereco endereco, Model model) {

		EnderecoDao dao = new EnderecoDao();
		dao.salvarEndereco(endereco);

		model.addAttribute("msg", "Endereço cadastrado com Sucesso!");

		return "cliente/adicionarEndereco";

	}

	// Método para listar todos os endereço do cliente
	@RequestMapping("meuEnderecos")
	public String listarEndereco(Model model, HttpServletRequest request) {

		EnderecoDao dao = new EnderecoDao();
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		List<Endereco> endereco = dao.listarEnderecoCliente(usuario.getIdUsuario());

		model.addAttribute("listaEndereco", endereco);

		return "cliente/meuEnderecos";

	}

	// Método que pegara os dados do endereço para enviar para uma página de
	// edicação
	@RequestMapping("editarEnderecoCliente")
	public String edit(@RequestParam("id") Integer id, Model model) {

		EnderecoDao dao = new EnderecoDao();
		Endereco endereco = dao.buscarPorId(id);

		model.addAttribute("endereco", endereco);

		return "cliente/alterarEndereco";
	}

	// Método que fará a alteração do endereço
	@RequestMapping("atulizarEndereco")
	public String update(Endereco endereco, Model model) {
		EnderecoDao dao = new EnderecoDao();
		dao.alterar(endereco);

		model.addAttribute("mensagem", "Endereco Alterado com Sucesso !");

		return "cliente/alterarEndereco";
	}

	// Método para apagar o endereço
	@RequestMapping("deleteEnderecoCliente")
	public String delete(@RequestParam("id") Integer id, Model model) {

		EnderecoDao dao = new EnderecoDao();
		dao.remover(id);

		model.addAttribute("mensagemRemocao", "Endereco Removido com Sucesso");
		return "forward:meuEnderecos";
	}

	// Método para abrir o primeiro estágio do pedido
	@RequestMapping("PrimeiroEstagio")
	public String PrimeiroEstagioPedido() {

		return "cliente/1_estagio";

	}

	// Método para abrir o segundo estágio do pedido
	@RequestMapping("SegundoEstagio")
	public String SegundoEstagioPedido() {

		return "cliente/2_estagio";

	}

	// Método para abrir o terceiro estágio do pedido
	@RequestMapping("TerceiroEstagio")
	public String TerceiroEstagioPedido() {

		return "cliente/3_estagio";

	}

	// Método para abrir o Quarto estágio do pedido
	@RequestMapping("QuartoEstagio")
	public String QuartoEstagioPedido() {

		return "cliente/4_estagio";

	}

	// Método para abrir o Quinto estágio do pedido
	@RequestMapping("QuintoEstagio")
	public String QuintoEstagioPedido() {

		return "cliente/5_estagio";

	}
}