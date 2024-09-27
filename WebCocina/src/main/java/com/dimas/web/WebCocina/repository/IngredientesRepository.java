package com.dimas.web.WebCocina.repository;

import com.dimas.web.WebCocina.domain.Ingrediente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IngredientesRepository extends JpaRepository<Ingrediente, Integer> {
}
