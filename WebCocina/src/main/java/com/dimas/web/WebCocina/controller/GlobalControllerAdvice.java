package com.dimas.web.WebCocina.controller;

import com.dimas.web.WebCocina.domain.Usuario;
import com.dimas.web.WebCocina.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Optional;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private UsuarioService usuarioService;

    @ModelAttribute
    public void addAttributes(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            Optional<Usuario> usuario = usuarioService.getUserByEmail(authentication.getName());
            usuario.ifPresent(value -> model.addAttribute("nombreUsuario", value.getNombre()));
        } else {
            model.addAttribute("nombreUsuario", "invitado");
        }
    }
}
