package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class FiltroDao {
	
	private static final String PERSISTENCE_UNIT = "workfast";
	
	public List<FiltroPrestadorVO> listarPrestadores() {

		StringBuilder consulta = new StringBuilder();
		consulta.append(" select new br.com.ifpe.workfast.model.FiltroPrestadorVO(");
		
		consulta.append(" su.servico.nome as nomeServico, ");
		consulta.append(" su.servico.categoriaServico.nome as nomeCategoria, ");
		consulta.append(" su.usuario.nome as nomeUsuario, ");
		consulta.append(" su.usuario.foto as fotoUsuario, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" cid.nome as nomeCidade )");
		

		consulta.append(" from CidadeAtuacaoServico cas join cas.usuarioServico su join cas.cidade cid, DadosPessoais dp ");

		consulta.append(" where dp.usuario = su.usuario ");
			
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<FiltroPrestadorVO> query = null;
		query = manager.createQuery(consulta.toString(),FiltroPrestadorVO.class);
		query.setParameter("paramId", "");
		List<FiltroPrestadorVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

}
