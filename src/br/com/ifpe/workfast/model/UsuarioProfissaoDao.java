package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UsuarioProfissaoDao {

	private static final String PERSISTENCE_UNIT = "workfast";
	
	//Método para cadastra a vinculação entre usuário e profissao
		public void salvar(UsuarioProfissao usuarioProfissao) {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
			EntityManager manager = factory.createEntityManager();
			manager.getTransaction().begin();
			manager.persist(usuarioProfissao);
			manager.getTransaction().commit();
			manager.close();
			factory.close();
		}
}
