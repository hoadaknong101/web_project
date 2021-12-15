package project_cuoi_ky.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Catagory;
import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.beans.Order;
import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.dao.CategoryDAO;
import project_cuoi_ky.dao.OrderDetailsDAO;

@WebServlet("/shoppingcart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShoppingCartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("user");
		Order c = (Order) session.getAttribute("order");
		if (customer == null) {
			response.sendRedirect(request.getContextPath() + "/signin");
		} else {
			ArrayList<OrderDetail> listOrderDetails = new ArrayList<OrderDetail>();
			if (c == null) {
				listOrderDetails = new ArrayList<OrderDetail>();
			} else {
				listOrderDetails = OrderDetailsDAO.listByID(c.getId());
			}

			request.setAttribute("listOrderDetails", listOrderDetails);

			ArrayList<Catagory> listCategory = CategoryDAO.listCategories();
			request.setAttribute("listCategory", listCategory);

			float total = 0;
			for (OrderDetail x : listOrderDetails) {
				total += x.getPrice();
			}
			request.setAttribute("total", total);
			request.setAttribute("oid", c.getId());
			request.getRequestDispatcher("templates/shopping_cart.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
