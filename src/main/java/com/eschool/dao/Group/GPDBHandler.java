package com.eschool.dao.Group;

import com.eschool.model.Gpost;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class GPDBHandler {

    
    public void save(Gpost gpost) {
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(gpost); 
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

   
    public List<Gpost> getGpost(String email) {
        List<Gpost> gllpost = new ArrayList<>();
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            
            String hql = "FROM Gpost";
            gllpost = session.createQuery(hql, Gpost.class).getResultList();

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

        return gllpost;
    }
}
