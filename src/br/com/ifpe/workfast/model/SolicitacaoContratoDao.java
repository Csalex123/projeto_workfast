package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class SolicitacaoContratoDao {

	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(SolicitacaoContrato obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	

	public SolicitacaoContrato buscarPorId(int idSolicitacao) {

		SolicitacaoContrato obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(SolicitacaoContrato.class, idSolicitacao);
		manager.close();
		factory.close();

		return obj;
	}

	public boolean existeVinculacao(int idUsuario, int idUsuarioServico, int idEndereco) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery(
				"FROM SolicitacaoContrato sc WHERE sc.usuario.idUsuario =:paramUsuario AND sc.usuarioServico.idUsuarioServico =:paramUsuarioServico AND sc.endereco.id =:paramEndereco AND sc.status = '1' OR sc.status = '3' ");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramUsuarioServico", idUsuarioServico);
		query.setParameter("paramEndereco", idEndereco);

		try {
			query.getSingleResult();
		} catch (NoResultException nre) {
			return false;
		}

		manager.close();
		factory.close();
		return true;

	}
	
	public List<ListaPedidosPendentesVO> listarPedidosPendentesCliente(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;
		
		StringBuilder consulta = new StringBuilder();
		
		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");
		
		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.idUsuarioServico as idPrestadorServico, ");
		consulta.append(" us.usuario.nome as nomePrestador, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" us.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta) ");
		
	    
		consulta.append(" from SolicitacaoContrato sc join sc.usuarioServico us, DadosPessoais dp, Endereco ed ");
		consulta.append(" where dp.usuario = us.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio AND sc.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(),ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio", "1");
		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}
	
	public List<ListaPedidosPendentesVO> listarPedidosPrestador(Integer id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		TypedQuery<ListaPedidosPendentesVO> query = null;
		
		StringBuilder consulta = new StringBuilder();
		
		consulta.append(" select new br.com.ifpe.workfast.model.ListaPedidosPendentesVO(");
		
		consulta.append(" sc.idSolicitacaoContrato as idProposta,");
		consulta.append(" us.idUsuarioServico as idPrestadorServico, ");
		consulta.append(" sc.usuario.nome as nomeCliente, ");
		consulta.append(" dp.nomeFantasia as nomeFantasia, ");
		consulta.append(" us.usuario.tipo_usuario as tipoUsuario,");
		consulta.append(" us.servico.nome as nomeServico, ");
		consulta.append(" ed.rua as endereco, ");
		consulta.append(" ed.numeroCasa as numeroCasa, ");
		consulta.append(" ed.cep as cep, ");
		consulta.append(" ed.cidade.nome as cidade, ");
		consulta.append(" ed.estado.nome as estado, ");
		consulta.append(" sc.convite as proposta) ");
		
	    
		consulta.append(" from SolicitacaoContrato sc join sc.usuarioServico us, DadosPessoais dp, Endereco ed ");
		consulta.append(" where dp.usuario = sc.usuario AND ed.usuario = sc.usuario AND sc.status = :paramStatus AND sc.estagio = :paramEstagio AND sc.usuarioServico.usuario.idUsuario = :paramId");
		query = manager.createQuery(consulta.toString(),ListaPedidosPendentesVO.class);
		query.setParameter("paramId", id);
		query.setParameter("paramStatus", "1");
		query.setParameter("paramEstagio", "1");
		List<ListaPedidosPendentesVO> lista = query.getResultList();
		manager.close();
		factory.close();

		return lista;
	}

}
