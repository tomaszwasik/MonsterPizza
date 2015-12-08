package pl.monster.pizza.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.Order;
import pl.monster.pizza.service.OrderService;

@WebServlet("/deliverer")
public class DeliveryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		OrderService orderService = new OrderService();
		
		List<Order> allOrdersForDelivery = orderService.getAllOrdersForDelivery();
		
		request.setAttribute("ordersForDelivery", allOrdersForDelivery);
		request.getRequestDispatcher("deliverer_console.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		long orderId = Long.parseLong(request.getParameter("inputOrderId"));
		int statusId = 3;
		
		OrderService orderService = new OrderService();
		
		boolean updateStatus = orderService.updateStatus(orderId, statusId);
		
		response.sendRedirect("deliverer");
	}

	
}
