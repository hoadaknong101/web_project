package project_cuoi_ky.beans;

import java.sql.Date;

public class Order {
	private String id;
	private Date date;
	private float totalPrice;
	private int customerID;
	
	public Order() {
		
	}

	public Order(String id, Date date, float totalPrice, int customerID) {
		super();
		this.id = id;
		this.date = date;
		this.totalPrice = totalPrice;
		this.customerID = customerID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", date=" + date + ", totalPrice=" + totalPrice + ", customerID=" + customerID + "]";
	}
	
}
