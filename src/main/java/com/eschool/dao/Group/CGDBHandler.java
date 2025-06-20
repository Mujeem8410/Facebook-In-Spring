package com.eschool.dao.Group;

import com.eschool.model.CreateGrp;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class CGDBHandler {

    public void save(CreateGrp gpost) {
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

   
    public List<CreateGrp> getGroups(String email) {
        List<CreateGrp> groupPosts = new ArrayList<>();
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            
            String hql = "FROM CreateGrp";
            groupPosts = session.createQuery(hql, CreateGrp.class).getResultList();

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

        return groupPosts;
    }
}


