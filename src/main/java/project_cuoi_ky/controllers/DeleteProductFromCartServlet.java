package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.beans.Order;
import project_cuoi_ky.dao.OrderDetailsDAO;

@WebServlet("/deleteorderdetails")
public class DeleteProductFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProductFromCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("user");
		Order order = (Order) session.getAttribute("order");
		if (customer != null && order != null) {
			if (order.getId() != null) {
				int id = Integer.parseInt((String) request.getParameter("o"));
				OrderDetailsDAO.deleteOrderDetails(id);
				response.sendRedirect(request.getContextPath() + "/shoppingcart");
			}
		}else {
			response.sendRedirect(request.getContextPath() + "/error/notfound");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
