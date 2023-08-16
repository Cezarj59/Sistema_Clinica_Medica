package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.medicosExames.MedicosExames;
import util.HibernateUtil;

public class MedicosExamesDAO {

	public static boolean salvar(MedicosExames medicoExame) {
		Transaction transaction = null;

		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(medicoExame); // Salva o objeto
			transaction.commit();
			return true; // Retorna true em caso de sucesso
		} catch (Exception ex) {
			if (transaction != null) {
				transaction.rollback();
			}
			ex.printStackTrace();
			return false; // Retorna false em caso de falha
		}
	}

	public static boolean atualizar(MedicosExames medicosExames) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(medicosExames);
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

	public static boolean excluir(MedicosExames medicosExames) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.delete(medicosExames);
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

	public static MedicosExames buscarPorId(Long id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(MedicosExames.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<MedicosExames> listarTodos() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<MedicosExames> query = session.createQuery("FROM MedicosExames", MedicosExames.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
