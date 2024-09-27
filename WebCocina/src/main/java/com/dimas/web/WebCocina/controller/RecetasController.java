package com.dimas.web.WebCocina.controller;

import com.dimas.web.WebCocina.domain.Receta;
import com.dimas.web.WebCocina.service.RecetaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class RecetasController {

    @Autowired
    private RecetaService recetaService;

    @RequestMapping("/")
    public String listadoRecetas(Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Verificar si el usuario está autenticado
        if (authentication != null && authentication.isAuthenticated()) {
            model.addAttribute("usuario", authentication.getName()); // Agregar el nombre del usuario al modelo
        } else {
            model.addAttribute("usuario", "invitado");
        }

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

}
