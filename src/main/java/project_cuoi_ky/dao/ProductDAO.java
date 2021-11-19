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
	
	public static void main(String[] args) throws SQLException {
		
		ArrayList<Product> tmp = listProduct();
		tmp.forEach((n) -> {
			System.out.println(n.toString());
		});
	}
	
}
