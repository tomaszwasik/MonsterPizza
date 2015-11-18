package pl.monster.pizza.dao;

import java.util.List;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import pl.monster.pizza.model.Order;
import pl.monster.pizza.util.ConnectionProvider;

public class OrderDAOImpl implements OrderDAO {
	
	private static final String CREATE_ORDER = "";
	
	private NamedParameterJdbcTemplate template;
	
	public OrderDAOImpl() {
		template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
	}

	@Override
	public Order create(Order order) {
		Order resultOrder = new Order(order);
		KeyHolder holder = new GeneratedKeyHolder();
		//TODO
		
		return null;
	}

	@Override
	public Order read(Long primaryKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Order updateObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Long key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Order> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
