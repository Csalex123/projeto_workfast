package br.com.ifpe.workfast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.workfast.model.DadosPessoais;
import br.com.ifpe.workfast.model.DadosPessoaisDao;

@Controller
public class DadosPessoaisController {
	@RequestMapping("salvarDadosPessoais")
	public String save(@RequestParam("idTipoAcesso") Integer id, DadosPessoais dados) {

		DadosPessoaisDao dao = new DadosPessoaisDao();
		dao.salvar(dados);
        
		if(id == 1 ) {return "cliente/cadastroDadosSucesso";}
		if(id == 3 ) {return "prestador/cadastroDadosSucesso";}
		
		return null;
		
	}
	
	
	
}
