package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.dao.CustomerDAO;

/**
 * Servlet implementation class EditCustomerServlet
 */
@WebServlet("/editcustomer")
public class EditCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int id;

	public EditCustomerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		id = Integer.parseInt(request.getParameter("cid"));

		Customer customer = CustomerDAO.findCustomerByID(id);

		request.setAttribute("c", customer);

		request.getRequestDispatcher("templates/edit_customer.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

		Customer customer = new Customer(id, name, email, phoneNumber, password);

		CustomerDAO.updateCustomer(customer);

		response.sendRedirect(request.getContextPath() + "/managecustomer");
	}

}
