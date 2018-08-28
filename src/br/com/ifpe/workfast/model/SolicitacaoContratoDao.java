package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
	
public boolean existeVinculacao(int idUsuario, int idUsuarioServico, int idEndereco){

		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM SolicitacaoContrato sc WHERE sc.usuario.idUsuario =:paramUsuario AND sc.usuarioServico.idUsuarioServico =:paramUsuarioServico AND sc.endereco.id =:paramEndereco AND sc.status = '1' OR sc.status = '3' ");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramUsuarioServico", idUsuarioServico);
		query.setParameter("paramEndereco", idEndereco);

		try{
			query.getSingleResult();
		}catch(NoResultException nre){
			return false;
		}
		
		manager.close();
		factory.close();
		return true ;
		
	}
	
}
