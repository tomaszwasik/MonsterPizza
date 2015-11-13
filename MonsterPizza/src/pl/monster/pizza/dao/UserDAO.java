package pl.monster.pizza.dao;

import java.util.List;

import pl.monster.pizza.model.User;

public interface UserDAO extends GenericDAO<User, Long>{

	List<User> getAll();
	User getUserByUsername(String username);
}
