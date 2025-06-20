package com.eschool.dao.vedio;

import com.eschool.model.video;

import com.eschool.dao.Friends.FDBHandler;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.util.HibernateUtil; 
import java.util.ArrayList;
import java.util.List;

public class VDBHandler {

    
    public void save(video vpost) {
        Transaction tx = null;
        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(vpost);

            tx.commit();
        } catch (Exception ex) {
            if (tx != null) tx.rollback();
            System.out.println("Error: " + ex.getMessage());
        } finally {
            if (session != null) session.close();
        }
    }

    public List<video> getVideoPosts(String email) {
        List<video> videoPosts = new ArrayList<>();
        FDBHandler fdb = new FDBHandler();
        List<String> friends = fdb.getFriend(email);
        friends.add(email); 

        Session session = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            
            Query<video> query = session.createQuery("from video", video.class);
            List<video> allVideos = query.list();

            for (video video : allVideos) {
                if (friends.contains(video.getSender())) {
                    videoPosts.add(video);
                }
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            if (session != null) session.close();
        }

        return videoPosts;
    }
}
