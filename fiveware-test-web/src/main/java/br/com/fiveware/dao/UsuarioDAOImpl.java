package br.com.fiveware.dao;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.fiveware.entity.Usuario;
import br.com.fiveware.interfaces.UsuarioDAO;

@Repository
@Transactional
public class UsuarioDAOImpl implements UsuarioDAO{
	
	@PersistenceContext
	private EntityManager manager;

	@Override
	public void salvarUsuario(Usuario usuario) throws Exception {
		manager.persist(usuario);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Usuario> listarUsuarios() {
		Query query = manager.createQuery("SELECT e FROM Usuario e");
	    return (Collection<Usuario>) query.getResultList();
	}

}
