package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    public static SessionFactory factory;

    public static SessionFactory getFactory() {
        return factory != null ? factory : new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
    }
    public static void closeFactory() {
        if(factory.isOpen()) factory.close();
    }

}
