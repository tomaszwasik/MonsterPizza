package pl.monster.pizza.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.model.Order;
import pl.monster.pizza.model.Pizza;
import pl.monster.pizza.model.Status;
import pl.monster.pizza.util.ConnectionProvider;

public class OrderDAOImpl implements OrderDAO {

	private static final String CREATE_ORDER = "INSERT INTO orders(first_name, last_name, street_name, street_number,"
			+ "flat_number, postcode, telephone, amount, status_id, is_paid ) "
			+ "VALUES(:customerName, :customerSurname, :customerStreetName, :customerStreetNo, :customerFlatNo, :customerPostCode,"
			+ ":customerPhone, :orderPrice, :status, :isPaid);";

	private static final String CREATE_PIZZA = "INSERT INTO ordered_pizzas(order_id) VALUES(:orderId);";
	
	private static final String UPDATE_ORDER_STATUS = "UPDATE orders SET status_id = :statusId WHERE id = :id;";

	private static final String CREATE_INGREDIENTS_FOR_PIZZA = "INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,"
			+ "ingredient_id) VALUES(:pizzaId, :ingredientId);";

	private NamedParameterJdbcTemplate template;

	public OrderDAOImpl() {
		template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
	}

	@Override
	public Order create(Order order) {

		Order resultOrder = new Order(order);
		KeyHolder holder = new GeneratedKeyHolder();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("customerName", order.getCustomerName());
		paramMap.put("customerSurname", order.getCustomerSurname());
		paramMap.put("customerStreetName", order.getCustomerStreetName());
		paramMap.put("customerStreetNo", order.getCustomerStreetNo());
		paramMap.put("customerFlatNo", order.getCustomerFlatNo());
		paramMap.put("customerPostCode", order.getCustomerPostCode());
		paramMap.put("customerPhone", order.getCustomerPostCode());
		paramMap.put("orderPrice", order.getOrderPrice());
		paramMap.put("status", order.getStatus().getId());
		paramMap.put("isPaid", order.isPaid());

		SqlParameterSource paramSource = new MapSqlParameterSource(paramMap);
		int update = template.update(CREATE_ORDER, paramSource, holder);

		if (update > 0) {
			resultOrder.setId((Long) holder.getKey().longValue());
		}

		List<Pizza> pizzas = resultOrder.getPizzas();

		for (int i = 0; i < pizzas.size(); i++) {
			KeyHolder holder1 = new GeneratedKeyHolder();
			Map<String, Object> paramMapPizza = new HashMap<String, Object>();

			paramMapPizza.put("orderId", resultOrder.getId());

			SqlParameterSource ps = new MapSqlParameterSource(paramMapPizza);
			int updated = template.update(CREATE_PIZZA, ps, holder1);

			if (updated > 0) {
				resultOrder.getPizzas().get(i).setId((Long) holder1.getKey());

				List<Ingredient> ingredients = resultOrder.getPizzas().get(i).getIngredients();

				for (int j = 0; j < ingredients.size(); j++) {
					KeyHolder holderIngredient = new GeneratedKeyHolder();
					Map<String, Object> paramMapIngredients = new HashMap<String, Object>();

					paramMapIngredients.put("pizzaId", pizzas.get(i).getId());
					paramMapIngredients.put("ingredientId", ingredients.get(j).getId());
					
					SqlParameterSource paramSourceIngredient = new MapSqlParameterSource(paramMapIngredients);
					template.update(CREATE_INGREDIENTS_FOR_PIZZA, paramSourceIngredient, holderIngredient);
				}

			}
		}

		return resultOrder;
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
	
	public boolean updateStatus(long orderId, int statusId)
	{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", orderId);
		paramMap.put("statusId", statusId);
		
		int update = template.update(UPDATE_ORDER_STATUS, paramMap);

		if (update == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(Long key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Order> getAll() {
		
		//order ma na sobie id oraz obiekt Status
		List<Order> orders = template.query("select orders.id, orders.first_name,"
				+ " orders.last_name, orders.street_name, orders.street_number, orders.flat_number,"
				+ " orders.postcode, orders.telephone, orders.amount, orders.status_id from orders;", new OrdersRowMapper());
		
		for(Order order : orders)
		{
			List<Pizza> pizzas = template.query("select ordered_pizzas.id from ordered_pizzas where ordered_pizzas.order_id =" + order.getId() + ";", new PizzasRowMapper());
			
			for(Pizza pizza : pizzas)
			{
			List<Ingredient> ingredients = template.query("SELECT ordered_pizzas.id, ingredients_of_ordered_pizzas.ingredient_id, ingredients.ingredient_name"
					+" FROM ordered_pizzas, ingredients_of_ordered_pizzas, ingredients"
					+" WHERE ordered_pizzas.id=" + pizza.getId()
					+" AND ingredients_of_ordered_pizzas.ordered_pizzas_id = ordered_pizzas.id"
					+" AND ingredients.id = ingredients_of_ordered_pizzas.ingredient_id;", new IngredientsRowMapper());
			pizza.setIngredients(ingredients);
			}
			
			order.setPizzas(pizzas);
		}
		
		return orders;
	}
	
	private class OrdersRowMapper implements RowMapper<Order> {
		@Override
		public Order mapRow(ResultSet resultSet, int row) throws SQLException {
			Order order = new Order();
			order.setId(resultSet.getLong("id"));
			order.setCustomerName(resultSet.getString("first_name"));
			order.setCustomerSurname(resultSet.getString("last_name"));
			order.setCustomerStreetName(resultSet.getString("street_name"));
			order.setCustomerStreetNo(resultSet.getString("street_number"));
			order.setCustomerFlatNo(resultSet.getString("flat_number"));
			order.setCustomerPostCode(resultSet.getString("postcode"));
			order.setCustomerPhone(resultSet.getString("telephone"));
			order.setOrderPrice(resultSet.getDouble("amount"));
			
			Status status = new Status();
			long statusId = resultSet.getLong("status_id");
			status.setId(statusId);
			if (statusId == 1) {
				status.setState("w trakcie przygotowywania");
			} else if (statusId == 2) {
				status.setState("gotowe do dostarczenia");
			} else if (statusId == 3) {
				status.setState("dostarczono");
			} else if (statusId == 4) {
				status.setState("anulowano");
			}
			order.setStatus(status);
			return order;
		}
	}
		
		
		private class PizzasRowMapper implements RowMapper<Pizza> {
			@Override
			public Pizza mapRow(ResultSet resultSet, int row) throws SQLException {
				Pizza pizza = new Pizza();
				pizza.setId(resultSet.getLong("id"));
				return pizza;
			}
		}
		
		private class IngredientsRowMapper implements RowMapper<Ingredient> {
			@Override
			public Ingredient mapRow(ResultSet resultSet, int row) throws SQLException {
				Ingredient ingredient = new Ingredient();
				ingredient.setId(resultSet.getLong("ingredient_id"));
				ingredient.setName(resultSet.getString("ingredient_name"));
				return ingredient;
			}
		}

}
