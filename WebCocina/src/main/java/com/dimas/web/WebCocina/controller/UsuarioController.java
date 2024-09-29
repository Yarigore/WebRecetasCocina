package com.dimas.web.WebCocina.controller;

import com.dimas.web.WebCocina.domain.Usuario;
import com.dimas.web.WebCocina.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("/logIn")
    public String logIn(){

        return "logIn";
    }

    @RequestMapping("/signUp")
    public String crearCuenta(Model model) {
        model.addAttribute("usuario", new Usuario()); // Este "usuario" es siempre un objeto Usuario
        return "signUp";
    }


    @PostMapping("/guardarUsuario")
    public String guardarUsuario(Usuario usuario, Model model){
        try {
            usuarioService.crearUsuario(usuario);
            return "redirect:/";
        } catch (Exception e) {
            model.addAttribute("error", "El usuario ya está registrado o hubo un problema");
            return "signUp";
        }
    }

    @RequestMapping("/logout")
    public String logout(){
        return "redirect:/";
    }

    @ModelAttribute
    public void addAttributes(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication != null && authentication.isAuthenticated()
                && !(authentication instanceof AnonymousAuthenticationToken)) {
            Optional<Usuario> usuario = usuarioService.getUserByEmail(authentication.getName());
            usuario.ifPresent(value -> model.addAttribute("nombreUsuario", value.getNombre())); // Cambiar "usuario" por "nombreUsuario"
        } else {
            model.addAttribute("nombreUsuario", "invitado"); // Cambiar "usuario" por "nombreUsuario"
        }
    }

}
