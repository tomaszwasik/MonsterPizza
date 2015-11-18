package pl.monster.pizza.service;

import pl.monster.pizza.dao.DAOFactory;
import pl.monster.pizza.dao.OrderDAO;
import pl.monster.pizza.model.Order;

public class OrderService {
	
	public void addOrder(Order order)
	{
		DAOFactory factory = DAOFactory.getDAOFactory();
		OrderDAO orderDAO = factory.getOrderDAO();
		orderDAO.create(order);
	}

}
