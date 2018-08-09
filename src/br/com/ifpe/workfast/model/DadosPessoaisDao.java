package br.com.ifpe.workfast.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class DadosPessoaisDao {

	private static final String PERSISTENCE_UNIT = "workfast";
	

	//Método para buscar verificar se o usuario já tem os dados pessoais cadastrados
	public DadosPessoais buscarDadosPessoaisUsuario(int idUsuario){

		DadosPessoais obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		query = manager.createQuery("FROM DadosPessoais WHERE usuario.id = :paramId");
		query.setParameter("paramId", idUsuario);

		try{
			obj = (DadosPessoais) query.getSingleResult();
		}catch(NoResultException nre){
			return null;
		}
		
		manager.close();
		factory.close();
		return obj;
		
	}
	
	// Método para incluir os dadosPessoais do usuario
	public void salvar(DadosPessoais dadosPessoais) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(dadosPessoais);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}
	
	public void alterar(DadosPessoais dados) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(dados);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}
	
	//Método para buscar verificar se o cpf já existe no banco de dados
			public DadosPessoais buscarPorCpf(String cpf){

				DadosPessoais obj = null;

				EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
				EntityManager manager = factory.createEntityManager();
				Query query = null;
				
				query = manager.createQuery("FROM DadosPessoais WHERE cpfCnpj = :paramCpf");
				query.setParameter("paramCpf", cpf);

				try{
					obj = (DadosPessoais) query.getSingleResult();
				}catch(NoResultException nre){
					return null;
				}
				
				manager.close();
				factory.close();
				return obj;
				
			}
			
			//Método para buscar verificar se o RG já existe no banco de dados
			public DadosPessoais buscarPorRG(String rg){

				DadosPessoais obj = null;

				EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
				EntityManager manager = factory.createEntityManager();
				Query query = null;
				
				query = manager.createQuery("FROM DadosPessoais WHERE rgIe = :paramRg");
				query.setParameter("paramRg", rg);

				try{
					obj = (DadosPessoais) query.getSingleResult();
				}catch(NoResultException nre){
					return null;
				}
				
				manager.close();
				factory.close();
				return obj;
				
			}
	
	
}
