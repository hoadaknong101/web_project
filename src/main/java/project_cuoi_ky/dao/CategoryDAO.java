package project_cuoi_ky.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import project_cuoi_ky.beans.*;
import project_cuoi_ky.dbcontext.DBContext;

public class CategoryDAO {
	public static Connection conn = DBContext.getConnection();

	public static void insertCategory(Catagory c){
		String query = "insert into web_shopping.product_category(ProductCategoryName) Values('"+ c.getName() +"')";
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void updateCategory(Catagory c){
		String query = "update web_shopping.product_category set ProductCategoryName = '" + c.getName()+"' where ProductCategoryID = " + c.getId();
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void deleteCategory(int id){
		String query = "delete from web_shopping.product_category where ProductCategoryID = " + id;
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static ArrayList<Catagory> listCategories(){
		String query = "select * from product_category";
		Statement st;
		ArrayList<Catagory> tmp = new ArrayList<Catagory>();
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Catagory c = new Catagory();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				tmp.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tmp;
	}
	
	public static Catagory findCatagory(int id){
		String query = "select * from product_category where ProductCategoryID = " + id;
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			Catagory tmp = new Catagory();
			while(rs.next()) {
				tmp.setId(rs.getInt(1));
				tmp.setName(rs.getString(2));
				return tmp;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public static Catagory findCatagory(String name) throws SQLException{
		String query = "select * from product_category where ProductCategoryName like '%" + name + "%'";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		Catagory tmp = new Catagory();
		while(rs.next()) {
			tmp.setId(rs.getInt(1));
			tmp.setName(rs.getString(2));
		}
		return tmp;
	}
	
	
	//Test function
	public static void main(String[] args) throws SQLException {
		
		
		//insertCategory(new Catagory(1,"Moi Them"));
		//updateCategory(new Catagory(4,"Update cai moi them"));
		//deleteCategory(8);
		ArrayList<Catagory> tmp = listCategories();
		for(Catagory x: tmp) {
			System.out.println(x.toString());
		}
	}

}
