package com.eschool.dao.Wallpost;

import com.eschool.dao.Friends.FDBHandler;
import com.eschool.model.Wallpost;
import com.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class WDBHandler {

    public void save(Wallpost wpost) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.save(wpost);
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

    
    public List<Wallpost> getWallpost(String email) {
        List<Wallpost> wallposts = new ArrayList<>();
        ArrayList<String> friends = new  ArrayList<String>();
        FDBHandler fdb = new FDBHandler();
        friends = (ArrayList<String>) fdb.getFriend(email);
        friends.add(email);
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            String hql = "FROM Wallpost WHERE sender IN :friendsList ORDER BY wid DESC";
            wallposts = session.createQuery(hql, Wallpost.class)
                               .setParameter("friendsList", friends)
                               .list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return wallposts;
    }
}
