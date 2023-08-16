package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.exame.Exame;
import util.HibernateUtil;

public class ExameDAO {

	public static boolean salvar(Exame exame) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.persist(exame);
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
	}

	public static boolean atualizar(Exame exame) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(exame);
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
	}

	public static boolean excluir(Exame exame) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.delete(exame);
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
	}

	public static Exame buscarPorId(Long id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(Exame.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Exame> listarTodos() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Exame> query = session.createQuery("FROM Exame", Exame.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Exame> buscarExamesPorEspecialidade(Long especialidadeId) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Exame> query = session.createQuery("FROM Exame e WHERE e.especialidade.id = :especialidadeId", Exame.class);
			query.setParameter("especialidadeId", especialidadeId);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
