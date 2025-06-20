package com.eschool.dao.Game;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.eschool.model.Game;
import com.util.HibernateUtil;

public class GDBHandler {
	
	public List<Game> GamePost() {
        List<Game> marketPosts = new ArrayList<>();
        Transaction transaction = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            
            String hql = "FROM Game";
            marketPosts = session.createQuery(hql, Game.class).getResultList();

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

