package pl.monster.pizza.service;

import pl.monster.pizza.dao.DAOFactory;
import pl.monster.pizza.dao.RoleDAO;
import pl.monster.pizza.model.Role;

public class RoleService {

	public void addRole(String roleName, String roleDescription) {
		Role role = new Role();
		role.setName(roleName);
		role.setDescription(roleDescription);
		
		DAOFactory factory = DAOFactory.getDAOFactory();
		RoleDAO roleDAO = factory.getRoleDAO();
		roleDAO.create(role);
	}

}
