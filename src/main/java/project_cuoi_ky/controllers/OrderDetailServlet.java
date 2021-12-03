package project_cuoi_ky.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.dao.OrderDetailsDAO;

@WebServlet("/orderdetails")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("oid");
		
		ArrayList<OrderDetail> listOrderDetail = OrderDetailsDAO.listByID(id);
		
		request.setAttribute("listOrderDetails", listOrderDetail);
		
		request.getRequestDispatcher("templates/order_details.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
