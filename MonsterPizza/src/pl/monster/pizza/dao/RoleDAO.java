package pl.monster.pizza.dao;

import java.util.List;

import pl.monster.pizza.model.Role;

public interface RoleDAO extends GenericDAO<Role, Long>{
	
	List<Role> getAll();

}
