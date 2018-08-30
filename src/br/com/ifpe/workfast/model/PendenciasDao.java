package br.com.ifpe.workfast.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PendenciasDao {

	protected static final String PERSISTENCE_UNIT = "workfast";

	public void salvar(Pendencias obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public List<Pendencias> listar() {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		List<Pendencias> lista = manager.createQuery("FROM Pendencias ORDER BY dataPostagem").getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public void remover(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Pendencias pendencia = manager.find(Pendencias.class, id);
		manager.getTransaction().begin();
		manager.remove(pendencia);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

}
