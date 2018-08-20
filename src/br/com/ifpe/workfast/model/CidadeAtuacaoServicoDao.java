package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class CidadeAtuacaoServicoDao {

protected static final String PERSISTENCE_UNIT = "workfast";
	
	public void salvar(CidadeAtuacaoServico obj, List<Cidade> cidades) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = null;
		
		CidadeAtuacaoServico novo;
		for(int i= 0; i < cidades.size();i++) {
			manager = factory.createEntityManager();

			manager.getTransaction().begin();
			novo = new CidadeAtuacaoServico();
			novo.setUsuarioServico(obj.getUsuarioServico());
			novo.setCidade(cidades.get(i));
			
			manager.persist(novo);
			manager.getTransaction().commit();
			
		}
		
		

		manager.close();
		factory.close();
	}

	
	public CidadeAtuacaoServico buscarPorId(int id) {

		CidadeAtuacaoServico obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(CidadeAtuacaoServico.class, id);
		manager.close();
		factory.close();

		return obj;
	}
	
	public List<CidadeAtuacaoServico>  buscarPorIdServico(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM CidadeAtuacaoServico cas WHERE cas.usuarioServico.servico.idServico = :paramId");
		query.setParameter("paramId", id);
		List<CidadeAtuacaoServico> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	public List<CidadeAtuacaoServico> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<CidadeAtuacaoServico> lista = manager.createQuery("FROM UsuarioServico ORDER BY nome").getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	
	
	
	public void alterar(CidadeAtuacaoServico cidadeAtuacaoServico) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(cidadeAtuacaoServico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		CidadeAtuacaoServico cidadeAtuacaoServico = manager.find(CidadeAtuacaoServico.class, id);

		manager.getTransaction().begin();
		manager.remove(cidadeAtuacaoServico);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}


}
