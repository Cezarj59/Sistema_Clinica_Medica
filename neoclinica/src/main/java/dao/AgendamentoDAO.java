package dao;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.agendamento.Agendamento;
import model.pessoa.Paciente;
import util.HibernateUtil;

public class AgendamentoDAO {

	public static boolean salvar(Agendamento agendamento) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.persist(agendamento);
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

	public static boolean atualizar(Agendamento agendamento) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.update(agendamento);
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

	public static boolean excluir(Agendamento agendamento) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.delete(agendamento);
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

	public static Agendamento buscarPorId(Long id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.get(Agendamento.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarTodos() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery("FROM Agendamento", Agendamento.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosEmAberto() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery("FROM Agendamento WHERE status = true", Agendamento.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosRealizados() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery("FROM Agendamento WHERE status = false", Agendamento.class);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosPorDia(LocalDate dia) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery("FROM Agendamento WHERE data = :dia", Agendamento.class);
			query.setParameter("dia", dia);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosDaSemanaAtual() {
		LocalDate hoje = LocalDate.now();
		LocalDate inicioSemana = hoje.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
		LocalDate fimSemana = inicioSemana.plusDays(4); // Sexta-feira

		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session
					.createQuery("FROM Agendamento WHERE data BETWEEN :inicioSemana AND :fimSemana", Agendamento.class);
			query.setParameter("inicioSemana", inicioSemana);
			query.setParameter("fimSemana", fimSemana);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosPorPaciente(Paciente paciente) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery("FROM Agendamento WHERE paciente = :paciente",
					Agendamento.class);
			query.setParameter("paciente", paciente);
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public static List<Agendamento> listarAgendamentosPorDiaExame(int diaSemana) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// Criação da consulta HQL para buscar os agendamentos
			Query<Agendamento> query = session.createQuery(
					// Seleciona os Agendamentos que estão associados a MédicosExames que por sua
					// vez estão associados a Exames com o dia da semana correspondente
					"SELECT a FROM Agendamento a JOIN a.medicosExames me JOIN me.exame e WHERE e.diaSemana = :diaSemanaExame",
					Agendamento.class);
			// Define o valor do parâmetro diaSemanaExame na consulta
			query.setParameter("diaSemanaExame", diaSemana);
			// Executa a consulta e retorna a lista de Agendamentos correspondentes
			return query.list();
		} catch (Exception e) {
			// Em caso de exceção, imprime o rastreamento da pilha (stack trace)
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosPorPaciente(String nomeCpf) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Agendamento> query = session.createQuery(
					"SELECT a FROM Agendamento a JOIN a.paciente p WHERE p.nome LIKE :nome OR p.cpf = :cpf",
					Agendamento.class);
			query.setParameter("nome", "%" + nomeCpf + "%"); // Correspondência parcial para o nome
			query.setParameter("cpf", nomeCpf); // CPF precisa ser exato
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Agendamento> listarAgendamentosPorPacienteEmAberto(String nomeCpf) {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        Query<Agendamento> query = session.createQuery(
	            "SELECT a FROM Agendamento a JOIN a.paciente p WHERE (p.nome LIKE :nome OR p.cpf = :cpf) AND a.status = true",
	            Agendamento.class
	        );
	        query.setParameter("nome", "%" + nomeCpf + "%");
	        query.setParameter("cpf", nomeCpf);
	        return query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	public static List<Agendamento> listarAgendamentosPorPacienteRealizados(String nomeCpf) {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        Query<Agendamento> query = session.createQuery(
	            "SELECT a FROM Agendamento a JOIN a.paciente p WHERE (p.nome LIKE :nome OR p.cpf = :cpf) AND a.status = false",
	            Agendamento.class
	        );
	        query.setParameter("nome", "%" + nomeCpf + "%");
	        query.setParameter("cpf", nomeCpf);
	        return query.list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}


}
