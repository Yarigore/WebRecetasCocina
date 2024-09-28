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

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("/logIn")
    public String logIn(){

        return "logIn";
    }

    @RequestMapping("/signUp")
    public String crearCuenta(Model model){
        model.addAttribute("newusuario", new Usuario());
        return "signUp";
    }

    @PostMapping("/guardarUsuario")
    public String guardarUsuario(Usuario usuario){
        usuarioService.crearUsuario(usuario);
        return "redirect:/";
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
            model.addAttribute("usuario", authentication.getName());
        } else {
            model.addAttribute("usuario", "invitado");
        }
    }
}
