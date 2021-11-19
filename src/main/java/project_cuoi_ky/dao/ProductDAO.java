package project_cuoi_ky.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.mysql.jdbc.Statement;

import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dbcontext.DBContext;

public class ProductDAO {
	public static Connection conn = DBContext.getConnection();

	public static void insertProduct(Product p) throws SQLException  {
		String query = "insert into web_shopping.product(ProductName, ProductPrice,ProductImage,ProductDescription, ProductQuantity,ProductCategory) "
				+ "Values(?,?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(1, p.getId());
		ps.setString(1, p.getName());
		ps.setFloat(2, p.getPrice());
		ps.setString(3, p.getImagePath());
		ps.setString(4, p.getDescription());
		ps.setInt(5, p.getQuantity());
		ps.setInt(6, p.getCategoryID());
		ps.executeUpdate();
	}
	
	public static void updateProduct(Product p) throws SQLException{
		String query = "update web_shopping.product set ProductName=?, ProductPrice=?,ProductImage=?,ProductDescription=?, ProductQuantity=?,ProductCategory=? "
				+ "where ProductID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setString(1, p.getName());
		ps.setFloat(2, p.getPrice());
		ps.setString(3, p.getImagePath());
		ps.setString(4, p.getDescription());
		ps.setInt(5, p.getQuantity());
		ps.setInt(6, p.getCategoryID());
		ps.setInt(7, p.getId());
		ps.executeUpdate();
	}
	
	
	public static void deleteProduct(int id) throws SQLException{
		String query = "delete from web_shopping.product where ProductID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(1, id);
		ps.executeUpdate();
	}
	
	public static ArrayList<Product> listProduct() throws SQLException {
		String query = "select * from web_shopping.product";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<Product> tmp = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getFloat(3));
			p.setImagePath(rs.getNString(4));
			p.setDescription(rs.getString(5));
			p.setQuantity(rs.getInt(6));
			p.setCategoryID(rs.getInt(7));
			tmp.add(p);
		}
		return tmp;
	}
	
	public static ArrayList<Product> listProductByCategory(String category) throws SQLException {
		int id = CategoryDAO.findCatagory(category).getId();
		
		String query = "select * from web_shopping.product where ProductCategory = " + id;
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<Product> tmp = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getFloat(3));
			p.setImagePath(rs.getNString(4));
			p.setDescription(rs.getString(5));
			p.setQuantity(rs.getInt(6));
			p.setCategoryID(rs.getInt(7));
			tmp.add(p);
		}
		return tmp;
	}
	public static ArrayList<Product> findProductByName(String name) throws SQLException {
		String query = "select * from web_shopping.product where ProductName like '%" + name + "%'";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<Product> tmp = new ArrayList<Product>();
		while (rs.next()) {
			Product p = new Product();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setPrice(rs.getFloat(3));
			p.setImagePath(rs.getNString(4));
			p.setDescription(rs.getString(5));
			p.setQuantity(rs.getInt(6));
			p.setCategoryID(rs.getInt(7));
			tmp.add(p);
		}
		return tmp;
	}
	
	
	
	//Test function
	public static void main(String[] args) throws SQLException {
		
//		insertProduct(new Product(1,
//				"SP3",
//				16000,
//				"https://scontent.fdad3-5.fna.fbcdn.net/v/t39.30808-6/221494945_1843589535823925_1865731697281865863_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=g2cNugrHR0sAX_BEUfY&tn=-FMDf5XyWS6i1t1w&_nc_ht=scontent.fdad3-5.fna&oh=0a61bd44b542906da013bd25fbfc7c20&oe=619CDA1F",
//				"Decription for SP3",1,1));
//		updateProduct(new Product(3,
//				"SP3",
//				17000,
//				"https://scontent.fdad3-5.fna.fbcdn.net/v/t39.30808-6/221494945_1843589535823925_1865731697281865863_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=g2cNugrHR0sAX_BEUfY&tn=-FMDf5XyWS6i1t1w&_nc_ht=scontent.fdad3-5.fna&oh=0a61bd44b542906da013bd25fbfc7c20&oe=619CDA1F",
//				"Decription for SP3",1,1));
//		deleteProduct(3);
		ArrayList<Product> tmp = listProduct();
//		ArrayList<Product> tmp = listProductByCategory("muc");
		tmp.forEach((n) -> {
			System.out.println(n.toString());
		});
	}
	
}
