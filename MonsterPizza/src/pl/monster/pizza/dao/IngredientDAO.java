package pl.monster.pizza.dao;

import java.util.List;

import pl.monster.pizza.model.Ingredient;

public interface IngredientDAO extends GenericDAO<Ingredient, Long>{

	List<Ingredient> getAll();
	
}
