package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;
import br.com.ifpe.workfast.model.Endereco;
import br.com.ifpe.workfast.model.EnderecoDao;
import br.com.ifpe.workfast.model.Profissao;
import br.com.ifpe.workfast.model.ProfissaoDao;
import br.com.ifpe.workfast.model.Usuario;
import br.com.ifpe.workfast.model.UsuarioDao;
import br.com.ifpe.workfast.model.UsuarioProfissao;
import br.com.ifpe.workfast.model.UsuarioProfissaoDao;

@Controller
public class DadosPessoaisController {
	
	@RequestMapping("cadastrarDadosPrimeiroAcesso")
	public String salvarDadosPrimeiroAcesso(@RequestParam("idTipoAcesso") Integer id, @RequestParam("profissao") Integer idProfissao, DadosPessoais dados, Endereco endereco) {
        
		//salvando dados pessoais do usuario
		DadosPessoaisDao daoDadosPessoais = new DadosPessoaisDao();
		daoDadosPessoais.salvar(dados);
		
		ProfissaoDao daoProfissao = new ProfissaoDao();
		
		//pegando o usuario logado
		Usuario usuario = dados.getUsuario();
		
		//consultando a profissao que o usuario selecionou
		Profissao profissao = daoProfissao.buscarPorId(idProfissao);
		
		//criando o objeto e vinculando o usuario e profissao 
		UsuarioProfissao usuarioProfissao = new UsuarioProfissao();
		usuarioProfissao.setProfissao(profissao);
		usuarioProfissao.setUsuario(usuario);
		
		//salvando a vinculacao do usuario e profissao
		UsuarioProfissaoDao daoUsuarioPessoal = new UsuarioProfissaoDao();
		daoUsuarioPessoal.salvar(usuarioProfissao);
		
		
        EnderecoDao daoEndereco = new EnderecoDao();
        daoEndereco.salvar(endereco);
        
        
		if(id == 1 ) {return "cliente/cadastroDadosSucesso";}
		if(id == 3 ) {return "prestador/cadastroDadosSucesso";}
		
		return null;
		
	}
	
	
	
}
