package pl.monster.pizza.model;

import java.util.List;

public class Order {

	private long id;
	private String customerName;
	private String customerSurname;
	private String customerStreetName;
	private String customerStreetNo;
	private String customerFlatNo;
	private String customerPostCode;
	private String customerPhone;
	private String status;
	private boolean isPaid;

	private List<Pizza> pizzas;

	public Order() {
	}

	public Order(Order order) {
		this.customerName = order.getCustomerName();
		this.customerSurname = order.getCustomerSurname();
		this.customerStreetName = order.getCustomerStreetName();
		this.customerStreetNo = order.getCustomerStreetNo();
		this.customerFlatNo = order.getCustomerFlatNo();
		this.customerPostCode = order.getCustomerPostCode();
		this.customerPhone = order.getCustomerPhone();
		this.status = order.getStatus();
		this.isPaid = order.isPaid();
		this.pizzas = order.getPizzas();
	}

	public Order(String customerName, String customerSurname, String customerStreetName, String customerStreetNo,
			String customerFlatNo, String customerPostCode, String customerPhone, String status, boolean isPaid,
			List<Pizza> pizzas) {
		this.customerName = customerName;
		this.customerSurname = customerSurname;
		this.customerStreetName = customerStreetName;
		this.customerStreetNo = customerStreetNo;
		this.customerFlatNo = customerFlatNo;
		this.customerPostCode = customerPostCode;
		this.customerPhone = customerPhone;
		this.status = status;
		this.isPaid = isPaid;
		this.pizzas = pizzas;
	}

	public Order(long id, String customerName, String customerSurname, String customerStreetName,
			String customerStreetNo, String customerFlatNo, String customerPostCode, String customerPhone,
			String status, boolean isPaid, List<Pizza> pizzas) {
		this.id = id;
		this.customerName = customerName;
		this.customerSurname = customerSurname;
		this.customerStreetName = customerStreetName;
		this.customerStreetNo = customerStreetNo;
		this.customerFlatNo = customerFlatNo;
		this.customerPostCode = customerPostCode;
		this.customerPhone = customerPhone;
		this.status = status;
		this.isPaid = isPaid;
		this.pizzas = pizzas;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerSurname() {
		return customerSurname;
	}

	public void setCustomerSurname(String customerSurname) {
		this.customerSurname = customerSurname;
	}

	public String getCustomerStreetName() {
		return customerStreetName;
	}

	public void setCustomerStreetName(String customerStreetName) {
		this.customerStreetName = customerStreetName;
	}

	public String getCustomerStreetNo() {
		return customerStreetNo;
	}

	public void setCustomerStreetNo(String customerStreetNo) {
		this.customerStreetNo = customerStreetNo;
	}

	public String getCustomerFlatNo() {
		return customerFlatNo;
	}

	public void setCustomerFlatNo(String customerFlatNo) {
		this.customerFlatNo = customerFlatNo;
	}

	public String getCustomerPostCode() {
		return customerPostCode;
	}

	public void setCustomerPostCode(String customerPostCode) {
		this.customerPostCode = customerPostCode;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public boolean isPaid() {
		return isPaid;
	}

	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	public List<Pizza> getPizzas() {
		return pizzas;
	}

	public void setPizzas(List<Pizza> pizzas) {
		this.pizzas = pizzas;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", customerName=" + customerName + ", customerSurname=" + customerSurname
				+ ", customerStreetName=" + customerStreetName + ", customerStreetNo=" + customerStreetNo
				+ ", customerFlatNo=" + customerFlatNo + ", customerPostCode=" + customerPostCode + ", customerPhone="
				+ customerPhone + ", status=" + status + ", isPaid=" + isPaid + ", pizzas=" + pizzas + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerFlatNo == null) ? 0 : customerFlatNo.hashCode());
		result = prime * result + ((customerName == null) ? 0 : customerName.hashCode());
		result = prime * result + ((customerPhone == null) ? 0 : customerPhone.hashCode());
		result = prime * result + ((customerPostCode == null) ? 0 : customerPostCode.hashCode());
		result = prime * result + ((customerStreetName == null) ? 0 : customerStreetName.hashCode());
		result = prime * result + ((customerStreetNo == null) ? 0 : customerStreetNo.hashCode());
		result = prime * result + ((customerSurname == null) ? 0 : customerSurname.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + (isPaid ? 1231 : 1237);
		result = prime * result + ((pizzas == null) ? 0 : pizzas.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Order other = (Order) obj;
		if (customerFlatNo == null) {
			if (other.customerFlatNo != null)
				return false;
		} else if (!customerFlatNo.equals(other.customerFlatNo))
			return false;
		if (customerName == null) {
			if (other.customerName != null)
				return false;
		} else if (!customerName.equals(other.customerName))
			return false;
		if (customerPhone == null) {
			if (other.customerPhone != null)
				return false;
		} else if (!customerPhone.equals(other.customerPhone))
			return false;
		if (customerPostCode == null) {
			if (other.customerPostCode != null)
				return false;
		} else if (!customerPostCode.equals(other.customerPostCode))
			return false;
		if (customerStreetName == null) {
			if (other.customerStreetName != null)
				return false;
		} else if (!customerStreetName.equals(other.customerStreetName))
			return false;
		if (customerStreetNo == null) {
			if (other.customerStreetNo != null)
				return false;
		} else if (!customerStreetNo.equals(other.customerStreetNo))
			return false;
		if (customerSurname == null) {
			if (other.customerSurname != null)
				return false;
		} else if (!customerSurname.equals(other.customerSurname))
			return false;
		if (id != other.id)
			return false;
		if (isPaid != other.isPaid)
			return false;
		if (pizzas == null) {
			if (other.pizzas != null)
				return false;
		} else if (!pizzas.equals(other.pizzas))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}

}
