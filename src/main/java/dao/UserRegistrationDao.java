package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import dto.UserRegistrationDto;

public class UserRegistrationDao {


	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("reg");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();
	
	public String insert(UserRegistrationDto dto) {
		entityTransaction.begin();
		entityManager.persist(dto);
		entityTransaction.commit();
	
		return "Registration is Successful";
	}


}
