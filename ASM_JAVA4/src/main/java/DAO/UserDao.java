package DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Entity.User;
import Utils.JpaUtils;

public class UserDao {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	public User create(User u) {
		try {
			em.getTransaction().begin();
			em.persist(u);
			em.getTransaction().commit();
			return u;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
	}

	public User update(User u) {
		try {
			em.getTransaction().begin();
			em.merge(u);
			em.getTransaction().commit();
			return u;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
	}

	public User remove(String id) {
		try {
			em.getTransaction().begin();
			User u = em.find(User.class, id);
			em.remove(u);
			em.getTransaction().commit();
			return u;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
	}

	public User findbyId(String id) {
		try {
			Query query = em.createQuery("select u from User u where u.id = :id");
			query.setParameter("id", id);
			User u = (User) query.getSingleResult();
			return u;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public ArrayList<User> findAll() {
		try {
			String jpql = "SELECT o FROM User o";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			ArrayList<User> list = (ArrayList<User>) query.getResultList();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
}
