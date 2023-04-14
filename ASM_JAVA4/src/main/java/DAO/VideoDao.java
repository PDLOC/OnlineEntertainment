package DAO;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Entity.Video;
import Utils.JpaUtils;

public class VideoDao {
private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable{
		em.close();
		super.finalize();
	}
	
	public Video create(Video u) {
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
	
	public Video update(Video u) {
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
	
	public Video remove(String id) {
		try {
			em.getTransaction().begin();
			Video u = em.find(Video.class, id);
			em.remove(u);
			em.getTransaction().commit();
			return u;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
	}
	
	public Video findbyId(String id) {
		try {
			Query query = em.createQuery("select u from Video u where u.id = :id");
			query.setParameter("id", id);
			Video u = (Video)query.getSingleResult();
			return u;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public ArrayList<Video> findAll() {
		try {
			String jpql = "SELECT o FROM Video o";
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			ArrayList<Video> list = (ArrayList<Video>) query.getResultList();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
}
