package pl.monster.pizza.dao;

public class MysqlDAOFactory extends DAOFactory{

	@Override
	public UserDAO getUserDAO() {
		return new UserDAOImpl();
	}

	@Override
	public IngredientDAO getIngredientDAO() {
		return new IngredientDAOImpl();
	}

	@Override
	public OrderDAO getOrderDAO() {
		return new OrderDAOImpl();
	}

	@Override
	public RoleDAO getRoleDAO() {
		return new RoleDAOImpl();
	}
	
	

}
