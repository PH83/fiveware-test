package br.com.fiveware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.fiveware.entity.Usuario;
import br.com.fiveware.interfaces.UsuarioDAO;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@RequestMapping(name = "/cadastro", method = RequestMethod.GET)
	public ModelAndView getAcesso() {
		ModelAndView mav = new ModelAndView("usuario");
		mav.addObject("listaUsuarios", usuarioDAO.listarUsuarios());
        return mav;
	}
	
	@RequestMapping(value = "/cadastro/addUsuario", method = RequestMethod.POST)
	@ResponseBody
	public String addUsuario(@ModelAttribute Usuario usuario) {
		String msgRetorno = null;
		try {
			usuarioDAO.salvarUsuario(usuario);
			msgRetorno = "Registro inserido com sucesso!";
		} catch (Exception e) {
			msgRetorno = "Não foi possível inserir o registro. Tente novamente.";
		}
		
		return msgRetorno;
	}
}
