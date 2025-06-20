package com.eschool.dao.User;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.util.HibernateUtil;
import com.eschool.model.User;

public class DBHandler {

    public void save(User user) {
        Transaction transaction = null;
        Session session = null; 
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(user); 
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

    public User checkUser(String email) {
        User user = null;
        Session session = null; 
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            user = session.get(User.class, email);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close(); 
            }
        }
        return user;
    }
}
