package pl.monster.pizza.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.model.Order;
import pl.monster.pizza.model.Pizza;

@WebServlet("/pizzaToOrder")
public class PizzaToOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		Pizza pizza = (Pizza) request.getSession().getAttribute("pizza");
		Order order = (Order) request.getSession().getAttribute("order");

		if (pizza == null && order == null) {
			response.sendRedirect(request.getContextPath());
		} else if (pizza == null && order != null) {
			if ("goToSummary".equals(action)) {
				response.sendRedirect("summary.jsp");
			} else if ("addPizzaToOrder".equals(action)) {
				response.sendRedirect(request.getContextPath());
			}
		} else {
			if (order == null) {
				order = new Order();
			}
			double pizzaPrice = setPizzaPrice(pizza);
			pizza.setPrice(pizzaPrice);
			order.getPizzas().add(pizza);
			request.getSession().removeAttribute("pizza");
			request.getSession().setAttribute("order", order);

			if ("goToSummary".equals(action)) {
				response.sendRedirect("summary.jsp");
			} else if ("addPizzaToOrder".equals(action)) {
				response.sendRedirect(request.getContextPath());
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private double setPizzaPrice(Pizza pizza) {
		List<Ingredient> ingredients = pizza.getIngredients();
		double price = 0;
		for (Ingredient i : ingredients) {
			price = price + i.getPrice();
		}
		return price;
	}

}
