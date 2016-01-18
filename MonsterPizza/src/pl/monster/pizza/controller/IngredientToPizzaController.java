package pl.monster.pizza.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.model.Pizza;
import pl.monster.pizza.service.IngredientService;

@WebServlet("/ingredientToPizza")
public class IngredientToPizzaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Pizza pizza;
		IngredientService ingredientService = new IngredientService();
		List<Ingredient> allIngredients = ingredientService.getAllIngredients();

		long ingredientIdFromJsp = Long.parseLong(request.getParameter("ingredient_id"));

		if ("add".equals(request.getParameter("action"))) {

			pizza = (Pizza) request.getSession().getAttribute("pizza");
			if (pizza == null) {
				pizza = new Pizza();

				for (Ingredient i : allIngredients) {
					if (ingredientIdFromJsp == i.getId()) {
						pizza.getIngredients().add(i);
					}
				}
			} else {
				for (Ingredient i : allIngredients) {
					if (ingredientIdFromJsp == i.getId()) {
						pizza.getIngredients().add(i);
					}
				}
			}

			request.getSession().setAttribute("pizza", pizza);
			response.getOutputStream().write(prepareHtml(pizza).getBytes("UTF-8"));
		}else if("delete".equals(request.getParameter("action")))
		{
			pizza = (Pizza) request.getSession().getAttribute("pizza");
			if (pizza == null) {
				response.getOutputStream().write("".getBytes("UTF-8"));
			} else {
				List<Ingredient> list = pizza.getIngredients();
				for (int i = 0; i < list.size(); i++) {
					if (ingredientIdFromJsp == list.get(i).getId()) {
						list.remove(i);
						break;
					}
				}
				pizza.setIngredients(list);
				request.getSession().setAttribute("pizza", pizza);
				response.getOutputStream().write(prepareHtml(pizza).getBytes("UTF-8"));
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String prepareHtml(Pizza pizza) {
		List<Ingredient> ingredients = pizza.getIngredients();
		double price = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("<h2>Twoja pizza:)</h2><br>Składniki: <br><ul>");

		for (Ingredient i : ingredients) {
			price = price + i.getPrice();
			sb.append("<li>" + i.getName() + "</li>");
		}

		sb.append("</ul>");
		sb.append("<br><h2>Cena pizzy: " + price + " zł</h2>");
		return sb.toString();
	}

}
