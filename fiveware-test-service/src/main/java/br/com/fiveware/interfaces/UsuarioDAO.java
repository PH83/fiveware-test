package br.com.fiveware.interfaces;

import java.util.Collection;

import org.springframework.stereotype.Service;

import br.com.fiveware.entity.Usuario;

@Service
public interface UsuarioDAO {

	void salvarUsuario(final Usuario usuario) throws Exception;
	
	Collection<Usuario> listarUsuarios();
}
