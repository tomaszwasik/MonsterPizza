package pl.monster.pizza.model;

import java.util.ArrayList;
import java.util.List;

public class Pizza {

	private long id;
	private double price;
	private List<Ingredient> ingredients = new ArrayList<>();

	public Pizza() {
	}

	public Pizza(Pizza pizza) {
		this.id = pizza.getId();
		this.price = pizza.getPrice();
		this.ingredients = pizza.getIngredients();
	}

	public Pizza(double price, List<Ingredient> ingredients) {
		this.price = price;
		this.ingredients = ingredients;
	}

	public Pizza(long id, double price, List<Ingredient> ingredients) {
		this.id = id;
		this.price = price;
		this.ingredients = ingredients;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<Ingredient> getIngredients() {
		return ingredients;
	}

	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}

	@Override
	public String toString() {
		return "Pizza [id=" + id + ", price=" + price + ", ingredients=" + ingredients + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((ingredients == null) ? 0 : ingredients.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pizza other = (Pizza) obj;
		if (id != other.id)
			return false;
		if (ingredients == null) {
			if (other.ingredients != null)
				return false;
		} else if (!ingredients.equals(other.ingredients))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		return true;
	}

}
