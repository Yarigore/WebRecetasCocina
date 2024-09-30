package com.dimas.web.WebCocina.controller;

import com.dimas.web.WebCocina.domain.Ingrediente;
import com.dimas.web.WebCocina.domain.Paso;
import com.dimas.web.WebCocina.domain.Receta;
import com.dimas.web.WebCocina.domain.Usuario;
import com.dimas.web.WebCocina.service.RecetaService;
import com.dimas.web.WebCocina.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
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

    @RequestMapping("/recetaUsuario")
    public String recetasUsuario(String nombre, Model model){
        List<Receta> recetas = recetaService.buscarporUsuario(nombre);
        model.addAttribute("recetas", recetas);
        return "listaRecetas";
    }

    @RequestMapping("/buscar")
    public String buscarReceta(@RequestParam("q") String consulta, Model model){
        List<Receta> recetas = recetaService.buscar(consulta);
        model.addAttribute("recetas", recetas);
        return "listaRecetas";
    }

    @RequestMapping("/crearReceta")
    public String crearRecetas(Model model){
        Receta receta = new Receta();
        receta.setIngredientes(new ArrayList<>(Arrays.asList(new Ingrediente()))); // Agregar un ingrediente vacío como ejemplo
        receta.setPasos(new ArrayList<>(Arrays.asList(new Paso())));
        model.addAttribute("receta", receta);
        return "crearReceta";
    }

    @PostMapping("/guardarReceta")
    public String guardarReceta(@ModelAttribute Receta receta, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User userDetails = (User) authentication.getPrincipal();
        Optional<Usuario> usuario = usuarioService.getUserByEmail(userDetails.getUsername());

        try {
            receta.setUsuario(usuario.orElse(null));
            recetaService.crearReceta(receta);
        } catch (Exception e) {
            model.addAttribute("error", "Hubo un error al guardar la receta: " + e.getMessage());
            return "crearReceta"; // Vuelve a la página de creación
        }
        return "redirect:/";
    }

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
