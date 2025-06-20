package com.eschool.dao.market;

import com.eschool.model.Mkt;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class MDBHandler {


    public void save(Mkt mpost) {
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(mpost); 
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close(); 
            }
        }
    }

    
    public List<Mkt> getMarketPosts() {
        List<Mkt> marketPosts = new ArrayList<>();
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            
            String hql = "FROM Mkt";
            marketPosts = session.createQuery(hql, Mkt.class).getResultList();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); 
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return marketPosts;
    }
}
