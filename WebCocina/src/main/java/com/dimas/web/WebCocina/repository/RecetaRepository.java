package com.dimas.web.WebCocina.repository;

import com.dimas.web.WebCocina.domain.Receta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RecetaRepository extends JpaRepository<Receta, Integer> {

    Optional<Receta> findById(Integer id);

    List<Receta> findByNombreContaining(String consulta);
}
