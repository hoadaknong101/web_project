package project_cuoi_ky.dao;

//Tiếng Việt
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.dbcontext.DBContext;

public class CustomerDAO {

	public static Connection conn = DBContext.getConnection();

	public static void insertCustomer(Customer c) {
		String query = "insert into web_shopping.customer(CustomerName,CustomerEmail,CustomerPhoneNumber,CustomerPassword) Values(?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhoneNumber());
			ps.setString(4, c.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void updateCustomer(Customer c) {
		String query = "update web_shopping.customer set CustomerName = ?, CustomerEmail=?, CustomerPhoneNumber = ?, CustomerPassword = ? where CustomerID = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setInt(5, c.getId());
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhoneNumber());
			ps.setString(4, c.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void deleteCustomer(int id) {
		String query = "delete from web_shopping.customer where CustomerID = ?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Customer findCustomerByID(int id) {
		String query = "select * from customer where CustomerID = " + id;
		Statement st;
		Customer c = new Customer();
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhoneNumber(rs.getString(4));
				c.setPassword(rs.getString(5));
				return c;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static ArrayList<Customer> listCustomers() {
		String query = "select * from customer";
		Statement st;
		ArrayList<Customer> tmp = new ArrayList<Customer>();
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			tmp = new ArrayList<Customer>();
			while (rs.next()) {
				Customer c = new Customer();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhoneNumber(rs.getString(4));
				c.setPassword(rs.getString(5));
				tmp.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tmp;
	}

	public static Customer findCustomerByName(String name) {
		Customer tmp = new Customer();
		String query = "select * from customer where CustomerName like '%" + name + "%'";
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				tmp.setId(rs.getInt(1));
				tmp.setName(rs.getString(2));
				tmp.setEmail(rs.getString(3));
				tmp.setPhoneNumber(rs.getString(4));
				tmp.setPassword(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tmp;
	}

	public static Customer checkLogin(String email, String password) {
		String query = "select * from customer where CustomerEmail = '" + email + "' and CustomerPassword = '"
				+ password + "'";
		Statement st;
		Customer customer = null;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				customer = new Customer();
				customer.setId(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setEmail(rs.getString(3));
				customer.setPhoneNumber(rs.getString(4));
				customer.setPassword(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

	public static int checkUserExist(Customer customer) {
		String query = "select * from customer where CustomerEmail = '" + customer.getEmail() + "'";
		Statement st;
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				return -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		query = "select * from customer where CustomerPhoneNumber = '" + customer.getPhoneNumber() + "'";
		try {
			st = (Statement) conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 1;
	}

	// Test function
	public static void main(String[] args) throws SQLException {
		System.out.println(checkLogin("hoadaknong101@gmail.com", "wqeqwe@3123").toString());
	}
}
