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

	public static ArrayList<Catagory> listCategories() throws SQLException {
		String query = "select * from product_category";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<Catagory> tmp = new ArrayList<Catagory>();
		while(rs.next()) {
			Catagory c = new Catagory();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			tmp.add(c);
		}
		return tmp;
	}
	
	
	public static void main(String[] args) throws SQLException {
		ArrayList<Catagory> tmp = listCategories();
		for(Catagory x: tmp) {
			System.out.println(x.toString());
		}
		
	}
}
