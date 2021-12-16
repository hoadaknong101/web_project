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

	public static void insertOrderDetails(OrderDetail o) {
		String query = "insert into web_shopping.order_details(OrderProductName, OrderProductQuantity,OrderProductPrice,ProductID, OrderID) Values(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, o.getName());
			ps.setInt(2, o.getQuantity());
			ps.setFloat(3, o.getPrice());
			ps.setInt(4, o.getProductID());
			ps.setString(5, o.getOrderID());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void updateOrderDetails(OrderDetail o) {
		String query = "update web_shopping.order_details set OrderProductName = ?, OrderProductQuantity= ?, OrderProductPrice=?, ProductID=?, OrderID=? "
				+ "where OrderDetailsID = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, o.getName());
			ps.setInt(2, o.getQuantity());
			ps.setFloat(3, o.getPrice());
			ps.setInt(4, o.getProductID());
			ps.setString(5, o.getOrderID());
			ps.setInt(6, o.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void deleteOrderDetails(int id) {
		String query = "delete from web_shopping.order_details where OrderDetailsID = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static void deleteOrderDetails(String id) {
		String query = "delete from web_shopping.order_details where OrderID = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

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

	public static OrderDetail getOrderDetailByID(int id) {
		OrderDetail o = new OrderDetail();
		String query = "select * from web_shopping.order_details where OrderDetailsID = " + id;
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				o.setId(rs.getInt(1));
				o.setName(rs.getString(2));
				o.setQuantity(rs.getInt(3));
				o.setPrice(rs.getFloat(4));
				o.setProductID(rs.getInt(5));
				o.setOrderID(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
	}

	public static ArrayList<OrderDetail> listByID(String id) {
		String query = "select * from web_shopping.order_details where OrderID = '" + id + "'";
		Statement st;
		ArrayList<OrderDetail> tmp = null;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			tmp = new ArrayList<OrderDetail>();
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tmp;
	}

	public static void main(String[] args) throws SQLException {

		ArrayList<OrderDetail> tmp = listByID("4");
		tmp.forEach((n) -> {
			System.out.println(n.toString());
		});
	}
}
