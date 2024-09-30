package com.dimas.web.WebCocina.service;

import com.dimas.web.WebCocina.domain.Receta;
import com.dimas.web.WebCocina.repository.RecetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RecetaService {

    @Autowired
    private RecetaRepository recetaRepository;

    public List<Receta>buscarTodasRecetas(){return recetaRepository.findAll();}
    public Optional<Receta> buscarReceta(Integer id){ return recetaRepository.findById(id);}
    public List<Receta> buscar(String consulta){
        return recetaRepository.findByNombreContaining(consulta);
    }
    public void crearReceta(Receta receta){ recetaRepository.save(receta);}
    public List<Receta> buscarporUsuario(String nombre){ return recetaRepository.findByUsuario_Nombre(nombre);}
}
