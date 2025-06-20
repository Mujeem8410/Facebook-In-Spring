package com.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.eschool.model.CreateGrp;
import com.eschool.model.Friends;
import com.eschool.model.Game;
import com.eschool.model.Gpost;
import com.eschool.model.Image;
import com.eschool.model.Mkt;
import com.eschool.model.User;
import com.eschool.model.Wallpost;
import com.eschool.model.video;
 

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    static {
        try {
            
            sessionFactory = new Configuration()
                    .configure("Hibernate.cfg.xml") 
                    .addAnnotatedClass(User.class)
                    .addAnnotatedClass(Image.class)
                    .addAnnotatedClass(Friends.class) 
                    .addAnnotatedClass(Wallpost.class) 
                    .addAnnotatedClass(video.class) 
                    .addAnnotatedClass(Mkt.class) 
                    .addAnnotatedClass(CreateGrp.class) 
                    .addAnnotatedClass(Gpost.class) 
                    .addAnnotatedClass(Game.class) 
                    .buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
