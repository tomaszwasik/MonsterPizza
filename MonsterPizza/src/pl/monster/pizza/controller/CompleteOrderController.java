package pl.monster.pizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.Order;
import pl.monster.pizza.service.OrderService;

@WebServlet("/completeOrder")
public class CompleteOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Order order = (Order) request.getSession().getAttribute("order");
		order.setCustomerName(request.getParameter("customerName"));
		order.setCustomerSurname(request.getParameter("customerSurname"));
		order.setCustomerStreetName(request.getParameter("customerStreetName"));
		order.setCustomerStreetNo(request.getParameter("customerStreetNo"));
		order.setCustomerFlatNo(request.getParameter("customerFlatNo"));
		order.setCustomerPostCode(request.getParameter("customerPostCode"));
		order.setCustomerPhone(request.getParameter("customerPhone"));
		
		OrderService orderService = new OrderService();
		orderService.addOrder(order);
		
		request.getSession().removeAttribute("order");
		request.getSession().removeAttribute("pizza");
		request.getSession().invalidate();
		
		response.sendRedirect(request.getContextPath() + "/congratulations.jsp");
		
	}

	
}
