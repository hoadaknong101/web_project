package project_cuoi_ky.beans;

import project_cuoi_ky.dao.CategoryDAO;

public class Product {
	private int id;
	private String name;
	private float price;
	private String imagePath;
	private String description;
	private int quantity;
	private int CategoryID;

	public Product() {

	}

	public Product(int id, String name, float price, String imagePath, String description, int quantity,
			int categoryID) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.imagePath = imagePath;
		this.description = description;
		this.quantity = quantity;
		CategoryID = categoryID;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCategoryID() {
		return CategoryID;
	}

	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}

	public Catagory getCatagory() {
		Catagory catagory = new Catagory();
		catagory = CategoryDAO.findCatagory(this.CategoryID);
		return catagory;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", imagePath=" + imagePath
				+ ", description=" + description + ", quantity=" + quantity + ", CategoryID=" + CategoryID + "]";
	}

}
