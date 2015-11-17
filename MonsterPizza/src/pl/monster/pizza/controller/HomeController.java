package pl.monster.pizza.controller;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.service.IngredientService;

@WebServlet
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		saveIngredientsInRequest(request);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	
	private void saveIngredientsInRequest(HttpServletRequest request) {
		IngredientService ingredientService = new IngredientService();
		List<Ingredient> allIngredients = ingredientService.getAllIngredients(new Comparator<Ingredient>() {

			@Override
			public int compare(Ingredient i1, Ingredient i2) {

				if (i1.getPrice() < i2.getPrice()) {
					return 1;
				} else if (i1.getPrice() > i2.getPrice()) {
					return -1;
				}
				return 0;
			}
		});
		request.setAttribute("ingredients", allIngredients);
	}

}
