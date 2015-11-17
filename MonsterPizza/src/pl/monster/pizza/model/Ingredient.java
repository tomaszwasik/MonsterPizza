package pl.monster.pizza.model;

public class Ingredient {

	private long id;
	private String name;
	private int availableAmount;
	private double price;

	public Ingredient() {
	}

	public Ingredient(Ingredient ingredient) {
		this.id = ingredient.getId();
		this.name = ingredient.getName();
		this.availableAmount = ingredient.getAvailableAmount();
		this.price = ingredient.getPrice();
	}

	public Ingredient(String name, int availableAmount, double price) {
		this.name = name;
		this.availableAmount = availableAmount;
		this.price = price;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAvailableAmount() {
		return availableAmount;
	}

	public void setAvailableAmount(int availableAmount) {
		this.availableAmount = availableAmount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
