package dao;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.pessoa.Paciente;
import util.HibernateUtil;

public class PacienteDAO {

	public static boolean salvar(Paciente paciente) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.persist(paciente);
			transaction.commit();
			return true;
		} catch (Exception e) {
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}
	}

	public static boolean atualizar(Paciente paciente) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(paciente);
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

	public static boolean excluir(Paciente paciente) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.delete(paciente);
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

	public static Paciente buscarPorId(Long id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(Paciente.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Paciente> listarTodos() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Paciente> query = session.createQuery("FROM Paciente", Paciente.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Paciente> buscarPacientesPorIdUsuario(Long usuarioId) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Paciente> query = session.createQuery("FROM Paciente p WHERE p.usuario.id = :usuarioId",
					Paciente.class);
			query.setParameter("usuarioId", usuarioId);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Paciente> buscarPacientesPorGenero(String genero) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Paciente> query = session.createQuery("FROM Paciente p WHERE p.genero = :genero", Paciente.class);
			query.setParameter("genero", genero);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Paciente> buscarAniversariantesDoDia() {
	    LocalDate hoje = LocalDate.now();
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        Query<Paciente> query = session.createQuery(
	                "FROM Paciente p WHERE DAY(p.nascimento) = :dia AND MONTH(p.nascimento) = :mes",
	                Paciente.class);
	        query.setParameter("dia", hoje.getDayOfMonth());
	        query.setParameter("mes", hoje.getMonthValue());
	        return query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	public static List<Paciente> buscarAniversariantesDaSemana() {
		LocalDate hoje = LocalDate.now();
		LocalDate umaSemanaDepois = hoje.plus(1, ChronoUnit.WEEKS);
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Paciente> query = session.createQuery(
					"FROM Paciente p WHERE DAY(p.nascimento) BETWEEN :diaInicio AND :diaFim AND MONTH(p.nascimento) = :mes",
					Paciente.class);
			query.setParameter("diaInicio", hoje.getDayOfMonth());
			query.setParameter("diaFim", umaSemanaDepois.getDayOfMonth());
			query.setParameter("mes", hoje.getMonthValue());
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Paciente> buscarAniversariantesDoMes() {
		LocalDate hoje = LocalDate.now();
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Paciente> query = session.createQuery("FROM Paciente p WHERE MONTH(p.nascimento) = :mes",
					Paciente.class);
			query.setParameter("mes", hoje.getMonthValue());
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
