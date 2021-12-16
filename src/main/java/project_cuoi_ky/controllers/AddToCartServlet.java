package project_cuoi_ky.controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.beans.Order;
import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dao.OrderDetailsDAO;
import project_cuoi_ky.dao.ProductDAO;
import project_cuoi_ky.dao.OrderDAO;

@WebServlet("/addtocart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddToCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String currentPath = (String) request.getParameter("currentpath");

		int quantity = 1;
		int id;
		String quantityString = (String) request.getParameter("quantity");
		if (quantityString != null) {
			if (quantityString.trim().equals("") == false) {
				quantity = Integer.parseInt(quantityString);
			}
		}

		ArrayList<OrderDetail> orderDetails = null;
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("user");
		System.out.println("---Add Product To Cart---");
		if (customer == null) {
			System.out.println("Customer == null");
			System.out.println("-------------------------\n");
			response.sendRedirect(request.getContextPath() + "/signin");
		} else {
			String OrderID = Long.toString(System.currentTimeMillis());
			if (request.getParameter("pid") != null) {
				id = Integer.parseInt((String) request.getParameter("pid"));
				Product product = ProductDAO.findProductByID(id);
				if (product != null) {
					if (session.getAttribute("order") == null) {
						System.out.println("Order == null");
						Order order = new Order(OrderID, new Date(System.currentTimeMillis()), 0, customer.getId());
						OrderDetail orderDetail = new OrderDetail();
						orderDetail.setId(0);
						orderDetail.setName(product.getName());
						orderDetail.setQuantity(1);
						orderDetail.setPrice(product.getPrice());
						orderDetail.setProductID(product.getId());
						orderDetail.setOrderID(order.getId());
						order.setTotalPrice(orderDetail.getPrice() * orderDetail.getQuantity());
						OrderDAO.insertOrder(order);
						OrderDetailsDAO.insertOrderDetails(orderDetail);
						session.setAttribute("order", order);
						System.out.println("Create order");
						System.out.println("Customer ID = " + customer.getId());
						System.out.println("Order ID = " + order.getId());
					} else {
						Order order = (Order) session.getAttribute("order");
						orderDetails = OrderDetailsDAO.listByID(order.getId());
						Boolean check = false;
						for (OrderDetail detail : orderDetails) {
							if (detail.getProductID() == product.getId()) {
								detail.setQuantity(detail.getQuantity() + quantity);
								OrderDetailsDAO.updateOrderDetails(detail);
								check = true;
							}
						}
						if (check == false) {
							OrderDetail o = new OrderDetail();
							o.setId(0);
							o.setName(product.getName());
							o.setOrderID(order.getId());
							o.setPrice(product.getPrice());
							o.setProductID(product.getId());
							o.setQuantity(quantity);
							orderDetails.add(o);
							OrderDetailsDAO.insertOrderDetails(o);
						}
						float totalPrice = 0;
						for (OrderDetail detail : orderDetails) {
							totalPrice += detail.getPrice() * detail.getQuantity();
						}
						order.setTotalPrice(totalPrice);
						OrderDAO.updatetOrder(order);
						session.setAttribute("order", order);
					}
					System.out.println("-------------------------\n");
					if (currentPath != null) {
						if (currentPath.trim().equals("") == false) {
							response.sendRedirect(currentPath);
						}
					} else {
						response.sendRedirect(request.getContextPath() + "/home");
					}
				} else {
					if (currentPath != null) {
						if (currentPath.trim().equals("") == false) {
							response.sendRedirect(currentPath);
						}
					} else {
						response.sendRedirect(request.getContextPath() + "/home");
					}
				}
			} else {
				if (currentPath != null) {
					if (currentPath.trim().equals("") == false) {
						response.sendRedirect(currentPath);
					}
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
