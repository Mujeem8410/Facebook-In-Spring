package com.eschool.dao.Pro;

import com.eschool.dao.User.DBHandler;
import com.eschool.model.Image;
import com.eschool.model.User;
import com.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class Proimage {

    
    public void Check(Image Uimg) {
        Transaction transaction = null;
        Session session = null;

        try {
            // Open a Hibernate session
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();

            // Check if a record exists with the provided email
            Query<Image> query = session.createQuery("FROM Image WHERE email = :email", Image.class);
            query.setParameter("email", Uimg.getEmail());
            Image existingImage = query.uniqueResult();

            if (existingImage != null) {
                // Update the existing record
                existingImage.setImage(Uimg.getImage());
                session.update(existingImage);
            } else {
               
                session.save(Uimg);
            }

            
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

 
    public String getProImage(String email) {
        String img;
        DBHandler Udb = new DBHandler();
         User user= Udb.checkUser(email);
         
        if(user.getGender().equals("m")) {
        	img = "dummyboy.png"; 
        	
        }
        else {
        	img = "dummygirl.png"; 
        }
        Session session = null;

        try {
            
            session = HibernateUtil.getSessionFactory().openSession();

            Query<Image> query = session.createQuery("FROM Image WHERE email = :email", Image.class);
            query.setParameter("email", email);
            Image result = query.uniqueResult();

            if (result != null) {
                img = result.getImage();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }

        return img;
    }
}
