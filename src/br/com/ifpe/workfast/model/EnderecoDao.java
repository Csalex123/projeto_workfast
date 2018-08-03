package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class EnderecoDao {

	private static final String PERSISTENCE_UNIT = "workfast";
	
	//Método para buscar endereco do prestador
		public Endereco buscarEnderecoUsuarioPrestador(int idUsuario){

			Endereco obj = null;

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			Query query = null;
			query = manager.createQuery("FROM Endereco WHERE usuario.id = :paramId AND usuario.tipo_acesso.descricao LIKE :paramTipo");
			query.setParameter("paramId", idUsuario);
			query.setParameter("paramTipo", "Prestador de servico");

			try{
				obj = (Endereco) query.getSingleResult();
			}catch(NoResultException nre){
				return null;
			}
			
			manager.close();
			factory.close();
			return obj;
			
		}
		
		// Método para incluir o endereco do usuario
		public void salvar(Endereco endereco) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			manager.getTransaction().begin();
			manager.persist(endereco);
			manager.getTransaction().commit();
			manager.close();
			factory.close();
		}
		
		public void alterar(Endereco endereco) {

			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();

			manager.getTransaction().begin();
			manager.merge(endereco);
			manager.getTransaction().commit();

			manager.close();
			factory.close();
		}

}
