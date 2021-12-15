package project_cuoi_ky.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.dao.CustomerDAO;

@WebServlet("/managecustomer")
public class CustomerManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerManageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		Customer c = (Customer) session.getAttribute("user");
		if (c == null || c.getEmail().equals("hoadaknong101@gmail.com") == false) {
			response.sendRedirect(request.getContextPath() + "/error");
		} else {
			ArrayList<Customer> listCustomer = CustomerDAO.listCustomers();

			request.setAttribute("listCustomer", listCustomer);

			request.getRequestDispatcher("templates/manage_customer.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
