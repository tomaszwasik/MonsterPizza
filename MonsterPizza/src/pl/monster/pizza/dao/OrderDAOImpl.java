package pl.monster.pizza.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.model.Order;
import pl.monster.pizza.model.Pizza;
import pl.monster.pizza.util.ConnectionProvider;

public class OrderDAOImpl implements OrderDAO {

	private static final String CREATE_ORDER = "INSERT INTO orders(first_name, last_name, street_name, street_number,"
			+ "flat_number, postcode, telephone, amount, status_id, is_paid ) "
			+ "VALUES(:customerName, :customerSurname, :customerStreetName, :customerStreetNo, :customerFlatNo, :customerPostCode,"
			+ ":customerPhone, :orderPrice, :status, :isPaid);";

	private static final String CREATE_PIZZA = "INSERT INTO ordered_pizzas(order_id) VALUES(:orderId);";

	private static final String CREATE_INGREDIENTS_FOR_PIZZA = "INSERT INTO ingredients_of_ordered_pizzas(ordered_pizzas_id,"
			+ "ingredient_id) VALUES(:pizzaId, :ingredientId);";

	// INSERT INTO
	// ingredients_of_ordered_pizzas(ordered_pizzas_id,ingredient_id)
	// VALUES(1,3);

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
