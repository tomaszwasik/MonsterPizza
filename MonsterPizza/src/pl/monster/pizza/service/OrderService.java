package pl.monster.pizza.service;

import java.util.ArrayList;
import java.util.List;

import pl.monster.pizza.dao.DAOFactory;
import pl.monster.pizza.dao.OrderDAO;
import pl.monster.pizza.dao.OrderDAOImpl;
import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.model.Order;
import pl.monster.pizza.model.Pizza;
import pl.monster.pizza.model.Status;

public class OrderService {

	public void addOrder(Order order) {
		Order orderCopy = new Order(order);
		
		orderCopy.setOrderPrice(calculateOrderPrice(order));
		Status status = new Status();
		status.setId(1L);
		orderCopy.setStatus(status);
		orderCopy.setPaid(false);
		
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		orderDAO.create(orderCopy);
	}

	private double calculateOrderPrice(Order order) {
		List<Pizza> pizzas = order.getPizzas();
		List<Ingredient> ingredients;
		double summaryPrice = 0;

		for (Pizza p : pizzas) {
			ingredients = p.getIngredients();
			for (Ingredient i : ingredients) {
				summaryPrice = summaryPrice + i.getPrice();
			}
		}
		return summaryPrice;
	}

	public List<Order> getAllOrdersForPrepare() {
	
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		List<Order> all = orderDAO.getAll();

		List<Order> allOrdersForPrepare = new ArrayList<>();
		for (Order order : all) {
			if (order.getStatus().getId() == 1) {
				allOrdersForPrepare.add(order);
			}
		}
		return allOrdersForPrepare;
	}
	
	public List<Order> getAllOrdersForDelivery() {
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		List<Order> all = orderDAO.getAll();

		List<Order> allOrdersForPrepare = new ArrayList<>();
		for (Order order : all) {
			if (order.getStatus().getId() == 2) {
				allOrdersForPrepare.add(order);
			}
		}
		return allOrdersForPrepare;
	}
	
	
	public boolean updateStatus(long orderId, int statusId)
	{
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrderDAOImpl orderDAOImpl = (OrderDAOImpl) factory.getOrderDAO();
		
		boolean updateStatus = orderDAOImpl.updateStatus(orderId, statusId);
		
		return updateStatus;
	}


}
