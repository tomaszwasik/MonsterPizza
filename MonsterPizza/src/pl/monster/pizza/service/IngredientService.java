package pl.monster.pizza.service;

import java.util.Comparator;
import java.util.List;

import pl.monster.pizza.dao.DAOFactory;
import pl.monster.pizza.dao.IngredientDAO;
import pl.monster.pizza.model.Ingredient;

public class IngredientService {

	public void addIngredient(String ingredientName, int availableAmount, double price) {

		Ingredient ingredient = new Ingredient();
		ingredient.setName(ingredientName);
		ingredient.setAvailableAmount(availableAmount);
		ingredient.setPrice(price);

		DAOFactory factory = DAOFactory.getDAOFactory();
		IngredientDAO ingredientDAO = factory.getIngredientDAO();
		ingredientDAO.create(ingredient);

	}

	public List<Ingredient> getAllIngredients() {
		return getAllIngredients(null);
	}

	public List<Ingredient> getAllIngredients(Comparator<Ingredient> comparator) {
		DAOFactory factory = DAOFactory.getDAOFactory();
		IngredientDAO ingredientDAO = factory.getIngredientDAO();
		List<Ingredient> ingredients = ingredientDAO.getAll();
		if (comparator != null && ingredients != null) {
			ingredients.sort(comparator);
		}
		return ingredients;
	}

}
