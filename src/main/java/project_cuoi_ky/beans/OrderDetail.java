package project_cuoi_ky.beans;

import project_cuoi_ky.dao.ProductDAO;

public class OrderDetail {
	private int id;
	private String name;
	private int quantity;
	private float price;
	private int productID;
	private String OrderID;

	public OrderDetail() {

	}

	public OrderDetail(int id, String name, int quantity, float price, int productID, String orderID) {
		super();
		this.id = id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.productID = productID;
		OrderID = orderID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getOrderID() {
		return OrderID;
	}

	public void setOrderID(String orderID) {
		OrderID = orderID;
	}
	public String getImagePath() {
		return ProductDAO.findProductByID(this.productID).getImagePath();
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", name=" + name + ", quantity=" + quantity + ", price=" + price
				+ ", productID=" + productID + ", OrderID=" + OrderID + "]";
	}

}
