package pl.monster.pizza.dao;

import java.util.List;

import pl.monster.pizza.model.Order;

public interface OrderDAO extends GenericDAO<Order, Long>{

	List<Order> getAll();
	
}
