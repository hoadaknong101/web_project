package project_cuoi_ky.dao;

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

	
	public static void insertCustomer(Customer c) throws SQLException {
		String query = "insert into web_shopping.customer(CustomerID, CustomerName,CustomerEmail,CustomerPhoneNumber,CustomerPassword) Values(?,?,?,?,?)";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(1, c.getId());
		ps.setString(2, c.getName());
		ps.setString(3, c.getEmail());
		ps.setString(4,c.getPhoneNumber());
		ps.setString(5, c.getPassword());
		ps.executeUpdate();
	}
	
	public static void updateCustomer(Customer c) throws SQLException{
		String query = "update web_shopping.customer set CustomerName = ?, CustomerEmail=?, CustomerPhoneNumber = ?, CustomerPassword = ? where CustomerID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(5, c.getId());
		ps.setString(1, c.getName());
		ps.setString(2, c.getEmail());
		ps.setString(3,c.getPhoneNumber());
		ps.setString(4, c.getPassword());
		ps.executeUpdate();
	}
	
	public static void deleteCustomer(int id) throws SQLException{
		String query = "delete from web_shopping.customer where CustomerID = ?";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);
		ps.setInt(1, id);
		ps.executeUpdate();
	}
	                                                              
	
	public static ArrayList<Customer> listCustomers() throws SQLException{
		String query = "select * from customer";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		ArrayList<Customer> tmp = new ArrayList<Customer>();
		while(rs.next()) {
			Customer c = new Customer();
			c.setId(rs.getInt(1));
			c.setName(rs.getString(2));
			c.setEmail(rs.getString(3));
			c.setPhoneNumber(rs.getString(4));
			c.setPassword(rs.getString(5));
			tmp.add(c);
		}
		return tmp;
	}
	
	public static Customer findCustomer(int id) throws SQLException{
		Customer tmp = new Customer();
		String query = "select * from customer where CustomerID = " + id;
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			tmp.setId(rs.getInt(1));
			tmp.setName(rs.getString(2));
			tmp.setEmail(rs.getString(3));
			tmp.setPhoneNumber(rs.getString(4));
			tmp.setPassword(rs.getString(5));
		}
		return tmp;
	}
	
	public static Customer findCustomer(String name) throws SQLException{
		Customer tmp = new Customer();
		String query = "select * from customer where CustomerName like '%" + name + "%'";
		Statement st = (Statement) conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			tmp.setId(rs.getInt(1));
			tmp.setName(rs.getString(2));
			tmp.setEmail(rs.getString(3));
			tmp.setPhoneNumber(rs.getString(4));
			tmp.setPassword(rs.getString(5));
		}
		return tmp;
	}
	
	// Test function
	public static void main(String[] args) throws SQLException {
		
		//insertCustomer(new Customer(3, "Moi them","moithem@gmail.com","321321","32312)@"));
		//updateCustomer(new Customer(3, "Moi sua lai cai moi them","moithem@gmail.com","321321","32312)@"));
		//deleteCustomer(3);
		ArrayList<Customer> tmp = listCustomers();
		for(Customer x : tmp) {
			System.out.println(x.toString());
		}
	}
}
