package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.pessoa.Administrador;
import util.HibernateUtil;

public class AdministradorDAO {

    public static boolean salvar(Administrador administrador) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(administrador);
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

    public static boolean atualizar(Administrador administrador) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(administrador);
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

    public static boolean excluir(Administrador administrador) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.delete(administrador);
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

    public static Administrador buscarPorId(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Administrador.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static List<Administrador> listarTodos() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Administrador> query = session.createQuery("FROM Administrador", Administrador.class);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Administrador buscarAdministradorPorEmailOuUsername(String emailOuUsername) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Administrador> query = session.createQuery(
                    "FROM Administrador a WHERE a.email = :emailOrUsername OR a.username = :emailOrUsername",
                    Administrador.class);
            query.setParameter("emailOrUsername", emailOuUsername);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
