package murach.data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import murach.business.User;
import murach.sql.DBUtil;

public class UserDB {

    // --- 1. INSERT ---
    public static void insert(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
        System.out.println(e);
            if (trans.isActive()) {
                trans.rollback();
            }
        }
    }

    public static void update(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public static void delete(User user) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(user));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }
    
    public static User selectUser(String email) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u " +
                         "WHERE u.email = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);
        try {
            User user = q.getSingleResult();
            return user;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    // --- SELECT ALL (Bài 13-2 yêu cầu thêm) ---
    public static List<User> selectUsers() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT u FROM User u";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        List<User> results = null;
        try {
            results = q.getResultList();
        } catch (NoResultException e) {
            return null; // Hoặc trả về list rỗng
        } finally {
            em.close();
        }
        return results;
    }
    
    public static User getUserById(long userId) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            User user = em.find(User.class, userId);
            return user;
        } finally {
            em.close();
        }
    }
    
    public static boolean emailExists(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        ConnectionPool pool = ConnectionPool.getInstance();
        java.sql.Connection connection = pool.getConnection();
        if (connection == null) {
            System.err.println("LỖI CHECK EMAIL: Không có kết nối Database.");
            return false; // hoặc ném exception tuỳ design
        }

        String query = "SELECT 1 FROM users WHERE email = ? LIMIT 1";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            pool.freeConnection(connection);
        }
    }

}