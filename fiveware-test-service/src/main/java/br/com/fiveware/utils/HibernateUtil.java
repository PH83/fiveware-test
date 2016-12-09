package br.com.fiveware.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import br.com.fiveware.entity.Usuario;


public class HibernateUtil {
	private static final SessionFactory factory ;
	
	static {
		Configuration cfg = new Configuration().configure();
		cfg.addAnnotatedClass(Usuario.class);
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(cfg.getProperties()).getBootstrapServiceRegistry();
		factory = cfg.buildSessionFactory(serviceRegistry);
	}
	public static Session getSession() {
		return factory.openSession();
	}
}
