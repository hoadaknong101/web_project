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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditCustomerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		id = Integer.parseInt(request.getParameter("cid"));

		Customer customer = CustomerDAO.findCustomerByID(id);

		request.setAttribute("c", customer);

		request.getRequestDispatcher("WEB-INF/views/edit_customer.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");

		Customer customer = new Customer(id, name, email, phoneNumber, password);

		CustomerDAO.updateCustomer(customer);

		response.sendRedirect(request.getContextPath() + "/managecustomer");
	}

}
