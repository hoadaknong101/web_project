package project_cuoi_ky.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.dbcontext.DBContext;

public class OrderDetailsDAO {
	public static Connection conn = DBContext.getConnection();

	public static void insertOrderDetails(OrderDetail o) throws SQLException {
		String query = "insert into web_shopping.order_details(OrderProductName, OrderProductQuantity,OrderProductPrice,ProductID, OrderID) Values(?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setString(1, o.getName());
		ps.setInt(2, o.getQuantity());
		ps.setFloat(3, o.getPrice());
		ps.setInt(4, o.getProductID());
		ps.setString(5, o.getOrderID());
		ps.executeUpdate();
	}

	public static void updateOrderDetails(OrderDetail o) throws SQLException {
		String query = "update web_shopping.order_details set OrderProductName = ?, OrderProductQuantity= ?, OrderProductPrice=?, ProductID=?, OrderID=? "
				+ "where OrderDetailsID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setString(1, o.getName());
		ps.setInt(2, o.getQuantity());
		ps.setFloat(3, o.getPrice());
		ps.setInt(4, o.getProductID());
		ps.setString(5, o.getOrderID());
		ps.setInt(6, o.getId());
		ps.executeUpdate();
	}

	public static void deleteOrderDetails(int id) throws SQLException {
		String query = "delete from web_shopping.order_details where OrderDetailsID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(1, id);
		ps.executeUpdate();
	}

	public static ArrayList<OrderDetail> listOrderDetails() throws SQLException {
		String query = "select * from web_shopping.order_details";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<OrderDetail> tmp = new ArrayList<OrderDetail>();
		while (rs.next()) {
			OrderDetail c = new OrderDetail();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setQuantity(rs.getInt(3));
			c.setPrice(rs.getFloat(4));
			c.setProductID(rs.getInt(5));
			c.setOrderID(rs.getString(6));
			tmp.add(c);
		}
		return tmp;
	}
	
	public static ArrayList<OrderDetail> listByID(String id) throws SQLException{
		String query = "select * from web_shopping.order_details where OrderID = '" + id +"'";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<OrderDetail> tmp = new ArrayList<OrderDetail>();
		while (rs.next()) {
			OrderDetail c = new OrderDetail();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setQuantity(rs.getInt(3));
			c.setPrice(rs.getFloat(4));
			c.setProductID(rs.getInt(5));
			c.setOrderID(rs.getString(6));
			tmp.add(c);
		}
		return tmp;
	}
	
	public static void main(String[] args) throws SQLException {

		//insertOrderDetails(new OrderDetail(1,"But may",5,30000,1,"1"));
		
		ArrayList<OrderDetail> tmp = new ArrayList<OrderDetail>();
		tmp.forEach((n) -> {
			System.out.println(n.toString());
		});
	}
}
