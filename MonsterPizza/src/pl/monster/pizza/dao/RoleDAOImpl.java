package pl.monster.pizza.dao;

import java.util.List;

import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import pl.monster.pizza.model.Role;
import pl.monster.pizza.util.ConnectionProvider;

public class RoleDAOImpl implements RoleDAO{
	
	private static final String CREATE_ROLE = "INSERT INTO role(role_name, description) VALUES(:name, :description);";

	private NamedParameterJdbcTemplate template;
	
	public RoleDAOImpl() {
		template = new NamedParameterJdbcTemplate(ConnectionProvider.getDataSource());
	}

	@Override
	public Role create(Role role) {
		Role resultRole = new Role(role);
		SqlParameterSource paramSource = new BeanPropertySqlParameterSource(role);
		int update = template.update(CREATE_ROLE, paramSource);
		return resultRole;
	}

	@Override
	public Role read(Long primaryKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Role updateObject) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Long key) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Role> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
