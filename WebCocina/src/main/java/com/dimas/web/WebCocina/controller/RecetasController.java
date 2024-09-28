package com.dimas.web.WebCocina.controller;

import com.dimas.web.WebCocina.domain.Receta;
import com.dimas.web.WebCocina.service.RecetaService;
import com.dimas.web.WebCocina.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RecetasController {

    @Autowired
    private RecetaService recetaService;

    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("/")
    public String listadoRecetas(Model model){
        List<Receta> recetas = recetaService.buscarTodasRecetas();
        model.addAttribute("recetas", recetas);
        return "listaRecetas";
    }

    @RequestMapping("/receta")
    public String recetaElegida(int recetaId, Model model){
        Optional<Receta> receta = recetaService.buscarReceta(recetaId);
        model.addAttribute("recetaElegida", receta.orElse(null));
        return "receta";
    }

    @RequestMapping("/buscar")
    public String buscarReceta(@RequestParam("q") String consulta, Model model){
        List<Receta> recetas = recetaService.buscar(consulta);
        model.addAttribute("recetas", recetas);
        return "listaRecetas";
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
