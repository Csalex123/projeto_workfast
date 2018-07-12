package br.com.ifpe.workfast.model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
	
public class UsuarioDao {

	private static final String PERSISTENCE_UNIT = "workfast";

	public Usuario buscarUsuario(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM Usuario WHERE login LIKE :paramLogin AND senha LIKE :paramSenha");
		query.setParameter("paramLogin", usuario.getLogin());
		query.setParameter("paramSenha", usuario.getSenha());
		List<Usuario> registros = query.getResultList();
		Usuario obj = null;
		if (!registros.isEmpty()) {
			obj = (Usuario) registros.get(0);
		}
		manager.close();
		factory.close();
		return obj;
	}

	public void salvar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

}
