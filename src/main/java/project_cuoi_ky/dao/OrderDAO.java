package project_cuoi_ky.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import project_cuoi_ky.beans.Order;
import project_cuoi_ky.dbcontext.DBContext;

public class OrderDAO {
	public static Connection conn = DBContext.getConnection();

	public static void insertOrder(Order o) {
		String query = "insert into web_shopping.order(OrderID, OrderDate,OrderTotalPrice,CustomerID) Values(?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, o.getId());
			ps.setDate(2, o.getDate());
			ps.setFloat(3, o.getTotalPrice());
			ps.setInt(4, o.getCustomerID());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updatetOrder(Order o) throws SQLException {
		String query = "update web_shopping.order set OrderDate=?,OrderTotalPrice=?,CustomerID=?  where OrderID =?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setString(4, o.getId());
		ps.setDate(1, o.getDate());
		ps.setFloat(2, o.getTotalPrice());
		ps.setInt(3, o.getCustomerID());
		ps.executeUpdate();
	}

	public static void deleteOrder(String id) throws SQLException {
		String query = "delete from web_shopping.order where OrderID =?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setString(1, id);
		ps.executeUpdate();
	}

	public static ArrayList<Order> listOrder() {
		String query = "select * from web_shopping.order";
		Statement st;
		ArrayList<Order> tmp = null;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			tmp = new ArrayList<Order>();
			while (rs.next()) {
				Order c = new Order();
				c.setId(rs.getString(1));
				c.setDate(rs.getDate(2));
				c.setTotalPrice(rs.getFloat(3));
				c.setCustomerID(rs.getInt(4));
				tmp.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tmp;
	}

	public static Order getOrderByCustomerID(int id) {
		String query = "select * from web_shopping.order where CustomerID = " + id;
		Statement st;
		Order c = new Order();
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				c.setId(rs.getString(1));
				c.setDate(rs.getDate(2));
				c.setTotalPrice(rs.getFloat(3));
				c.setCustomerID(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	// Test function
	public static void main(String[] args) throws SQLException {

//		ArrayList<Order> tmp = listOrder();
//		tmp.forEach((n) -> {
//			System.out.println(n.toString());
//		});
		Order a = getOrderByCustomerID(15);
		System.out.print(a.toString());
	}
}
