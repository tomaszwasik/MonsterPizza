package pl.monster.pizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.service.IngredientService;

@WebServlet("/ingredients")
public class IngredientController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("admin_console.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String ingredientName = request.getParameter("inputIngredientName");
		int availableAmount = Integer.parseInt(request.getParameter("inputAvailableAmount"));
		double price = Double.parseDouble(request.getParameter("inputPrice"));

		IngredientService ingredientService = new IngredientService();
		ingredientService.addIngredient(ingredientName, availableAmount, price);

		response.sendRedirect("admin_console.jsp");
	}

}
