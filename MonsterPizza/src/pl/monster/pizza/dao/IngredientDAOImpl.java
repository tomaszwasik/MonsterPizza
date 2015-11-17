/**
 * 
 */
package pl.monster.pizza.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import pl.monster.pizza.model.Ingredient;
import pl.monster.pizza.util.ConnectionProvider;

/**
 * @author Tomasz
 *
 */
public class IngredientDAOImpl implements IngredientDAO {

	private static final String CREATE_INGREDIENT = "INSERT INTO ingredients(ingredient_name, available_amount, price) VALUES(:name, :availableAmount, :price);";
	private static final String READ_ALL_INGREDIENTS = "SELECT * FROM ingredients;";
	private NamedParameterJdbcTemplate template;

	public IngredientDAOImpl() {
		template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
	}

	@Override
	public Ingredient create(Ingredient ingredient) {
		Ingredient resultIngredient = new Ingredient(ingredient);
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(ingredient);
		int update = template.update(CREATE_INGREDIENT, paramSource);
		return resultIngredient;
	}

	@Override
	public Ingredient read(Long primaryKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Ingredient updateObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Long key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Ingredient> getAll() {
		List<Ingredient> ingredients = template.query(READ_ALL_INGREDIENTS, new IngredientsRowMapper());
		return ingredients;
	}

	private class IngredientsRowMapper implements RowMapper<Ingredient> {

		@Override
		public Ingredient mapRow(ResultSet resultSet, int row) throws SQLException {
			Ingredient ingredient = new Ingredient();

			ingredient.setId(resultSet.getLong("id"));
			ingredient.setName(resultSet.getString("ingredient_name"));
			ingredient.setAvailableAmount(resultSet.getInt("available_amount"));
			ingredient.setPrice(resultSet.getDouble("price"));
			return ingredient;
		}

	}

}
