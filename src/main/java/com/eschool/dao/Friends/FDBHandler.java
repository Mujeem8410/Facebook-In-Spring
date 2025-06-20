package com.eschool.dao.Friends;

import com.eschool.model.Friends;
import com.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class FDBHandler {

    public void save(Friends f) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(f);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); 
            }
        }
    }

  
    public void changeStatus(int fid, int status) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query<?> query = session.createQuery("UPDATE Friends SET status = :status WHERE fid = :fid");
            query.setParameter("status", status);
            query.setParameter("fid", fid);
            query.executeUpdate();
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); 
            }
        }
    }

    public List<Friends> getPendingReq(String email) {
        List<Friends> pendingFriends = new ArrayList<>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query<Friends> query = session.createQuery(
                "FROM Friends WHERE status = 0 AND rec = :email ORDER BY fid DESC",
                Friends.class
            );
            query.setParameter("email", email);
            pendingFriends = query.getResultList();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); 
            }
        }
        return pendingFriends;
    }

    public List<String> getFriend(String email) {
        List<String> friendsList = new ArrayList<>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query<Friends> query = session.createQuery(
                "FROM Friends WHERE status = 1 AND (rec = :email OR sender = :email) ORDER BY fid DESC",
                Friends.class
            );
            query.setParameter("email", email);
            List<Friends> friends = query.getResultList();

            for (Friends f : friends) {
                if (email.equals(f.getSender())) {
                    friendsList.add(f.getRec());
                } else {
                    friendsList.add(f.getSender());
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); 
            }
        }
        return friendsList;
    }

    public Friends checkFriendRequest(String sender, String recipient) {
        Session session = null;
        Friends existingFriendship = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query<Friends> query = session.createQuery(
                "FROM Friends WHERE (sender = :sender AND rec = :recipient) " +
                "OR (sender = :recipient AND rec = :sender)",
                Friends.class
            );
            query.setParameter("sender", sender);
            query.setParameter("recipient", recipient);
            existingFriendship = query.uniqueResult();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
        return existingFriendship;
    }
}
